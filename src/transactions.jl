#####
##### Transactions
#####

import PokerHandEvaluator
const PHE = PokerHandEvaluator

"""
    SidePot

A side-pot for player `seat_number`,
who has gone all-in with amount `amt`.
"""
mutable struct SidePot
  seat_number::Int
  amt::Int
  cap::Int # total amount any individual player can contribute to this side-pot
end
seat_number(sp::SidePot) = sp.seat_number
amount(sp::SidePot) = sp.amt
cap(sp::SidePot) = sp.cap

const joker = Card(0, 1)

Base.@kwdef mutable struct HandEval
    hand_rank::Int = 1
    hand_type::Symbol = :empty
    best_cards::NTuple{5,Card} = ntuple(_->joker, 5)
end

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager
  perm::Vector{Int}
  bank_rolls::Vector{Chips} # cache
  initial_brs::Vector{Chips}
  pot_id::Vector{Int}
  side_pots::Vector{SidePot}
  side_pot_winnings::Vector{Vector{Chips}}
  unsorted_to_sorted_map::Vector{Int}
  sorted_hand_evals::Vector{HandEval}
end

function Base.show(io::IO, tm::TransactionManager, include_type = true)
    include_type && println(io, typeof(tm))
    println(io, "Pot(s)           = $(tm.side_pots)")
end

TransactionManager(players) = TransactionManager(Players(players))
function TransactionManager(players::Players)
    perm = collect(sortperm(players))
    bank_rolls = collect(map(x->bank_roll_chips(x), players))

    cap = zeros(Int,length(players))
    for i in 1:length(players)
        if i == 1
            cap[i] = bank_roll(players[perm[i]])
        else
            cap[i] = bank_roll(players[perm[i]]) - sum(cap[1:i-1])
        end
    end

    unsorted_to_sorted_map = collect(map(players) do player
        findfirst(p -> seat_number(players[p]) == seat_number(player), perm)
    end)
    side_pots = [SidePot(seat_number(players[p]), 0, cap_i) for (cap_i, p) in zip(cap, perm)]

    initial_brs = deepcopy(collect(bank_roll_chips.(players)))
    sorted_hand_evals = map(x->HandEval(), 1:length(players))
    pot_id = Int[1]
    FT = eltype(initial_brs)
    side_pot_winnings = collect(map(x->collect(map(x->FT(0), players)), players))
    TransactionManager(
        perm,
        bank_rolls,
        initial_brs,
        pot_id,
        side_pots,
        side_pot_winnings,
        unsorted_to_sorted_map,
        sorted_hand_evals,
    )
end

function reset!(tm::TransactionManager, players::Players)
    perm = tm.perm
    @inbounds for i in 1:length(players)
        tm.bank_rolls[i] = bank_roll_chips(players[i])
    end
    sortperm!(perm, tm.bank_rolls)
    @inbounds for i in 1:length(players)
        sp = players[perm[i]]
        player = players[i]
        br = bank_roll(sp)
        cap_i = i == 1 ? br : br - bank_roll(players[perm[i-1]])
        ssn = seat_number(sp)::Int
        tm.side_pots[i].seat_number = ssn
        tm.side_pots[i].amt = 0
        tm.side_pots[i].cap = cap_i
        for k in 1:length(players)
            tm.side_pot_winnings[i][k] = Chips(0)
        end
        j = findfirst(p->seat_number(players[p]) == seat_number(player), perm)::Int
        tm.unsorted_to_sorted_map[i] = j
        tm.initial_brs[i] = bank_roll_chips(player)
    end
    @inbounds tm.pot_id[1] = 1
    return nothing
end

function last_action_of_round(table, player, call)
    laor = all_oppononents_all_in(table, player) ||
        (count(x->action_required(x), players_at_table(table)) == 0 && call)
    logger = table.logger
    @cdebug logger "last_action_of_round = $laor"
    # @cdebug logger "    action_required.(players_at_table(table)) = $(action_required.(players_at_table(table)))"
    # @cdebug logger "    all_oppononents_all_in(table, player) = $(all_oppononents_all_in(table, player))"
    # @cdebug logger "    call = $call"
    return laor
end

"""
    contribute!(table, player, amt, call=false)

Player `player` contributes amount `amt` to the
appropriate side-pot(s) for calls (for `call = true`)
and raises (for `call = false`). All side-pots are
internally handled.

To properly handle side-pots, each raise and call
is decomposed into side-pots based on the bank roll
of the (sorted) players at the start of the game.


```
                      [1300] __ all-in for sorted_player_6
                    | []
                    | [1100] __ all-in for sorted_player_5
                |   | []
                |   | []
                |   | []
                |   | []
                |   | []
                |   | [500] __ all-in for sorted_player_4
            |   |   | [400] __ all-in for sorted_player_3
        |   |   |   | [300] __ all-in for sorted_player_2
    |   |   |   |   | []
    |   |   |   |   | [100] __ all-in for sorted_player_1
|   |   |   |   |   | []
---------------------
1   2   3   4   5   6
```
"""
function contribute!(table, player, amt, call=false)
    tm = table.transactions
    logger = table.logger
    @cdebug logger "$(name(player))'s bank roll (pre-contribute) = $(bank_roll(player))"
    if !(0 ≤ amt ≤ bank_roll(player))
        msg1 = "$(name(player)) has insufficient bank"
        msg2 = "roll ($(bank_roll(player))) to add $amt to pot."
        error(msg1*msg2)
    end
    @assert all_in(player) == false
    @assert !(amt == 0) "Cannot contribute $amt to the pot!"

    player.round_contribution += amt
    player.pot_investment += amt
    amt_remaining = amt
    @cdebug logger "$(name(player)) contributing $amt to side-pots"
    @cdebug logger "caps = $(cap.(tm.side_pots))"
    @cdebug logger "$(name(player))'s pot_investment = $(player.pot_investment)"

    @inbounds for i in 1:length(tm.side_pots)
        @assert 0 ≤ amt_remaining
        cap_i = cap(tm.side_pots[i])
        cond = amt_remaining < cap_i
        amt_contrib = cond ? amt_remaining : cap_i
        contributing = !side_pot_full(tm, i) && !(cap_i == 0)
        # This is a bit noisy:
        # @cdebug logger "$(name(player)) potentially contributing $amt_contrib to side-pot $(i) ($cond). cap_i=$cap_i, amt_remaining=$amt_remaining"
        @cdebug logger "contributing, amt_contrib = $contributing, $amt_contrib"
        contributing || continue
        @assert !(amt_contrib == 0)
        tm.side_pots[i].amt += amt_contrib
        player.bank_roll -= amt_contrib
        amt_remaining -= amt_contrib
        amt_remaining == 0 && break
    end
    @assert amt_remaining == 0 # pots better be emptied

    if bank_roll(player) == 0 # went all-in, set exactly.
        player.all_in = true
        player.action_required = false
    end

    if is_side_pot_full(tm, table, player, call)
        set_side_pot_full!(tm)
    end
    @cdebug logger "$(name(player))'s bank roll (post-contribute) = $(bank_roll(player))"
    @cdebug logger "all_in($(name(player))) = $(all_in(player))"
    @cdebug logger "post-contribute side-pots: $(tm.side_pots)"
end

function is_side_pot_full(tm::TransactionManager, table, player, call)
    players = players_at_table(table)
    # To switch from pot_id = 1 to pot_id = 2, then exactly 1 player  should be all-in:
    # To switch from pot_id = 2 to pot_id = 3, then exactly 2 players should be all-in:
    # ...
    return @inbounds count(x->all_in(x), players) == tm.pot_id[1] && last_action_of_round(table, player, call)
end

set_side_pot_full!(tm::TransactionManager) = (tm.pot_id[1]+=1)
side_pot_full(tm::TransactionManager, i) = i < tm.pot_id[1]

Base.@propagate_inbounds function sidepot_winnings(tm::TransactionManager, id::Int)
    mapreduce(i->tm.side_pots[i].amt, +, 1:id; init=0)
end

function profit(player, tm)
    # TODO: this is wrong (but only used for log / game_profit)
    if not_playing(player)
        return Chips(-pot_investment(player))
    else
        n = length(tm.side_pots)
        ∑spw = sidepot_winnings(tm, n)
        return Chips(∑spw-pot_investment(player))
    end
end

function distribute_winnings_1_player_left!(players, tm::TransactionManager, table_cards, logger)
    @assert count(x->still_playing(x), players) == 1
    n = length(tm.side_pots)
    for (player, initial_br) in zip(players, tm.initial_brs)
        player.game_profit = profit(player, tm)
    end
    for (player, initial_br) in zip(players, tm.initial_brs)
        ∑spw = sidepot_winnings(tm, n)
        not_playing(player) && continue
        amt_contributed = initial_br - bank_roll(player)
        player.bank_roll += ∑spw
        if !(∑spw == 0 && player.bank_roll == 0 && amt_contributed == 0)
            @cinfo logger "$(name(player)) wins $(∑spw) ($(profit(player, tm)) profit) (all opponents folded)"
        end
        @inbounds for j in 1:n
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
        break
    end
    return nothing
end

function minimum_valid_hand_rank(sorted_hand_evals, players, perm, i)::Int
    min_hrs = typemax(Int)
    for (ssn, she) in enumerate(sorted_hand_evals)
        player = players[perm[ssn]]
        if is_largest_pot_investment(player, players) || still_playing(player) && ssn ≥ i
            min_hrs = min(min_hrs, she.hand_rank)
        end
    end
    @assert min_hrs ≠ typemax(Int)
    return min_hrs
end

#=largest pot investment, excluding player=#
function largest_pot_investment(player, players)
    lpi = 0
    for i in 1:length(players)
        seat_number(players[i]) == seat_number(player) && continue
        lpi = max(lpi, pot_investment(players[i]))
    end
    return lpi
end

is_largest_pot_investment(player, players) =
    pot_investment(player) > largest_pot_investment(player, players)

function distribute_winnings!(players, tm::TransactionManager, table_cards, logger=InfoLogger())
    @cdebug logger "--- Distributing winnings..."
    @cdebug logger "Pot amounts = $(amount.(tm.side_pots))"
    perm = tm.perm
    if count(x->still_playing(x), players) == 1
        @cdebug logger "Distributing to only remaining player"
        return distribute_winnings_1_player_left!(players, tm, table_cards, logger)
    end
    sorted_hand_evals = tm.sorted_hand_evals
    @inbounds for (ssn, p) in enumerate(tm.perm)
        player = players[p]
        if inactive(player)
            sorted_hand_evals[ssn].hand_rank = -1
            sorted_hand_evals[ssn].hand_type = :empty
            sorted_hand_evals[ssn].best_cards = ntuple(j->joker, 5)
        else
            pc = player.cards::Tuple{Card,Card}
            tc = table_cards::Tuple{Card,Card,Card,Card,Card}
            if logger isa ByPassLogger
                he = PHE.CompactHandEval((pc..., tc...))
                sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
            else
                he = PHE.FullHandEval((pc..., tc...))
                sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
                sorted_hand_evals[ssn].best_cards = PHE.best_cards(he)
            end
        end
    end

    @inbounds for i in 1:length(players)
        for k in 1:length(players)
            tm.side_pot_winnings[i][k] = Chips(0)
        end
    end

    @inbounds for i in 1:length(tm.side_pots)
        sidepot_winnings(tm, length(players)) == 0 && continue # no money left to distribute

        @cdebug logger begin
            s = "Sorted hand evals: \n"
            for (ssn, she) in enumerate(sorted_hand_evals)
                player = players[perm[ssn]]
                inactive(player) && continue # (don't have cards to eval)
                eligible=(ssn ≥ i && still_playing(player)) || is_largest_pot_investment(player, players)
                s *= "eligible=$eligible, "
                s *= "sn=$(seat_number(player)), "
                s *= "br=$(bank_roll(player)), "
                s *= "rbr=$(round_bank_roll(player)), "
                s *= "pi=$(pot_investment(player)), "
                s *= "ssn=$(ssn), "
                s *= "hr=$(she.hand_rank), "
                s *= "ht=$(she.hand_type)\n"
            end
            s
        end
        mvhr = minimum_valid_hand_rank(sorted_hand_evals, players, perm, i)

        @cdebug logger "length(players) = $(length(players))"
        @cdebug logger "length(sorted_hand_evals) = $(length(sorted_hand_evals))"
        n_winners = count(enumerate(sorted_hand_evals)) do (ssn, she)
            player = players[perm[ssn]]
            (still_playing(player) && ssn ≥ i ? she.hand_rank==mvhr : false) || is_largest_pot_investment(player, players)
        end

        # Compute the least winnings per player:
        # amt_total = sidepot_winnings(tm, i)
        # amt_base = div(amt_total, n_winners)
        # remainder = rem(amt_total, n_winners) # ∈ 1:(amt_base-1)
        # eligible_pidxs = Int[]
        # for (ssn, she) in enumerate(sorted_hand_evals)
        #     player = players[perm[ssn]]
        #     if (still_playing(player) && ssn ≥ i ? she.hand_rank==mvhr : false) || is_largest_pot_investment(player, players)
        #         push!(eligible_pidxs, perm[ssn])
        #     end
        # end
        # TODO: distribute remaining more uniformly / with less variance
        # lucky_pidx = isempty(eligible_pidxs) ? -1 : rand(eligible_pidxs)
        # @cdebug logger "eligible_pidxs = $eligible_pidxs"
        # @cdebug logger "lucky_pidx = $lucky_pidx"
        # @cdebug logger "remainder = $remainder"

        for (ssn, she) in enumerate(sorted_hand_evals)
            player = players[perm[ssn]]
            is_winner = (still_playing(player) && ssn ≥ i ? she.hand_rank==mvhr : false) || is_largest_pot_investment(player, players)
            is_winner || continue
            winner_id = ssn
            @cdebug logger "winning pidx = $(tm.perm[winner_id])"
            win_seat = seat_number(players[tm.perm[winner_id]])
            # we do a coin flip to see who gets the remaining chips:
            # @cdebug logger "ssn, lucky_pidx: $ssn, $lucky_pidx"
            # amt = perm[ssn] == lucky_pidx ? amt_base + remainder : amt_base
            amt_total = sidepot_winnings(tm, i)
            amt_base = div(amt_total, n_winners)
            remainder = rem(amt_total, n_winners) # ∈ 1:(amt_base-1)
            amt_chips = Chips(amt_base, Rational(remainder,n_winners))
            tm.side_pot_winnings[win_seat][i] = amt_chips
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
    for (player, initial_br, player_winnings) in zip(players, tm.initial_brs, tm.side_pot_winnings)
        ∑spw = sum(player_winnings)
        ssn = tm.unsorted_to_sorted_map[seat_number(player)]
        amt_contributed = initial_br - bank_roll(player)
        prof = profit(player, tm)
        player.game_profit = prof
        if ∑spw == 0 && active(player)
            @cinfo logger begin
                she = sorted_hand_evals[ssn]
                hand_name = she.hand_type
                bc = she.best_cards
                f_str = folded(player) ? " (folded)" : ""
                "$(name(player)) loses$f_str $(pot_investment(player)) with $bc ($hand_name)!"
            end
        else
            @cdebug logger "$(name(player))'s side-pot wins: $(player_winnings)!"
            if amt_contributed == 0 && ∑spw == 0 && prof == 0 && !still_playing(player)
                continue
            end
            @cinfo logger begin
                she = sorted_hand_evals[ssn]
                hand_name = she.hand_type
                bc = she.best_cards
                "$(name(player)) wins $∑spw ($prof profit) with $bc ($hand_name)!"
            end
            player.bank_roll += ∑spw
        end
    end

    @cdebug logger "--- Finished distributing winnings..."
    return nothing
end
