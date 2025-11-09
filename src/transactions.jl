#####
##### Transactions
#####

import PokerHandEvaluator
const PHE = PokerHandEvaluator

"""
    SidePot

A side-pot for each player.
"""
mutable struct SidePot
  amts::Vector{Int} # amount contributed per player
  cap::Int # total amount any individual player can contribute to this side-pot
end
amounts(sp::SidePot) = sp.amts
cap(sp::SidePot) = sp.cap

const joker = Card(0, 1)

Base.@kwdef mutable struct HandEval
    hand_rank::Int = 1
    hand_type::Symbol = :empty
    best_cards::Vector{Card} = Card[joker,joker,joker,joker,joker]
end

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager{L}
  logger::L
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

TransactionManager(players, logger) = TransactionManager(Players(players), logger)
function TransactionManager(players::Players, logger)
    perm = collect(sortperm(players))
    N = length(players)
    bank_rolls = collect(map(x->bank_roll_chips(x), players))

    brp = map(p->bank_roll(players[p]), perm)
    caps = collect(ntuple(N) do i
        i==1 ? brp[1] : brp[i] - brp[i-1]
    end)

    unsorted_to_sorted_map = collect(map(players) do player
        findfirst(p -> seat_number(players[p]) == seat_number(player), perm)
    end)
    amts = zeros(Int, N)
    side_pots = [SidePot(deepcopy(amts), c) for c in caps]
    @cdebug logger "initial caps = $(cap.(side_pots))"

    initial_brs = deepcopy(collect(bank_roll_chips.(players)))
    sorted_hand_evals = map(x->HandEval(), 1:N)
    pot_id = Int[1]
    FT = eltype(initial_brs)
    side_pot_winnings = collect(map(x->collect(map(x->FT(0), players)), players))
    TransactionManager{typeof(logger)}(
        logger,
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
        tm.side_pots[i].amts .= 0
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
    players = players_at_table(table)
    @cdebug logger "$(name(player))'s bank roll (pre-contribute) = $(bank_roll(player))"
    if !(0 ≤ amt ≤ bank_roll(player))
        @cerror logger begin
            msg1 = "$(name(player)) has insufficient bank"
            msg2 = "roll ($(bank_roll(player))) to add $amt to pot."
            msg1*msg2
        end
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
        sp = tm.side_pots[i]
        sn = seat_number(player)
        if is_player_contribution_to_side_pot_full(sp, sn)
            continue
        end
        @assert 0 < amt_remaining "amt_remaining: $amt_remaining"
        amt_contrib = if contribution_fits_in_sidepot(sp, sn, amt_remaining)
            amt_remaining
        else
            contribution_that_fits_in_sidepot(sp, sn)
        end
        @assert 0 < amt_contrib
        sp.amts[sn] += amt_contrib
        player.bank_roll -= amt_contrib
        amt_remaining -= amt_contrib
        amt_remaining == 0 && break
    end
    @assert amt_remaining == 0 # pots better be emptied

    if bank_roll(player) == 0 # went all-in.
        player.action_required = false
    end

    if is_side_pot_full(tm, players)
        increment_pot_id!(tm)
    end
    @cdebug logger "$(name(player))'s bank roll (post-contribute) = $(bank_roll(player))"
    @cdebug logger "all_in($(name(player))) = $(all_in(player))"
    @cdebug logger "post-contribute side-pots: $(tm.side_pots)"
end

increment_pot_id!(tm::TransactionManager) = (tm.pot_id[1]+=1)
function is_side_pot_full(tm, players, ith_sidepot = tm.pot_id[1])
    sp = tm.side_pots[ith_sidepot]
    all(x->is_player_contribution_to_side_pot_full(sp, seat_number(x)), players)
end
is_player_contribution_to_side_pot_full(side_pot, sn::Int) =
    side_pot.amts[sn] == cap(side_pot)

contribution_fits_in_sidepot(side_pot, sn::Int, contribution) =
    side_pot.amts[sn] + contribution ≤ cap(side_pot)

contribution_that_fits_in_sidepot(side_pot, sn::Int) =
    cap(side_pot) - side_pot.amts[sn]

# TODO: should we have a pot/sidepot that persists through `distribute_winnings!`?
function pot(tm::TransactionManager)
    sp = sidepot_winnings(tm, length(tm.side_pots))
    return sp == 0 ? sum(spw->sum(spw), tm.side_pot_winnings) : sp
end

Base.@propagate_inbounds function sidepot_winnings(tm::TransactionManager, id::Int)
    mapreduce(i->sum(tm.side_pots[i].amts), +, 1:id; init=0)
end

function profit(player, tm)
    ∑spw = sum(tm.side_pot_winnings[seat_number(player)])
    return Chips(∑spw-pot_investment(player))
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
    @cdebug logger "Pot amounts = $(amounts.(tm.side_pots))"
    perm = tm.perm
    sorted_hand_evals = tm.sorted_hand_evals
    @inbounds for (ssn, p) in enumerate(perm)
        player = players[p]
        if !pot_eligible(player)
            sorted_hand_evals[ssn].hand_rank = -1
            sorted_hand_evals[ssn].hand_type = :empty
            @inbounds for i in 1:5
                sorted_hand_evals[ssn].best_cards[i] = joker
            end
        else
            pc = player.cards
            tc = table_cards
            @inbounds all_cards = (pc[1], pc[2], tc[1], tc[2], tc[3], tc[4], tc[5])
            if logger isa ByPassLogger
                he = PHE.CompactHandEval(all_cards)
                sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
            else
                he = PHE.FullHandEval(all_cards)
                sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
                sorted_hand_evals[ssn].best_cards .= Card[PHE.best_cards(he)...]
            end
        end
    end

    @inbounds for i in 1:length(players)
        for k in 1:length(players)
            tm.side_pot_winnings[i][k] = Chips(0)
        end
    end

    # populate `side_pot_winnings` and empty out `side_pots`
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

        for (ssn, she) in enumerate(sorted_hand_evals)
            player = players[perm[ssn]]
            is_winner = (still_playing(player) && ssn ≥ i ? she.hand_rank==mvhr : false) || is_largest_pot_investment(player, players)
            is_winner || continue
            winner_id = ssn
            @cdebug logger "winning pidx = $(tm.perm[winner_id])"
            win_seat = seat_number(players[tm.perm[winner_id]])
            amt_total = sidepot_winnings(tm, i)
            amt_base = div(amt_total, n_winners)
            remainder = rem(amt_total, n_winners) # ∈ 1:(amt_base-1)
            amt_chips = Chips(amt_base, SimpleRatio(remainder,n_winners))
            tm.side_pot_winnings[win_seat][i] = amt_chips
        end
        for j in 1:i
            tm.side_pots[j].amts .= 0 # empty out distributed winnings
        end
    end

    # Adjust bank rolls:
    for (player, initial_br, player_sp_winnings) in zip(players, tm.initial_brs, tm.side_pot_winnings)
        ∑spw = sum(player_sp_winnings)
        amt_contributed = initial_br - bank_roll(player)
        prof = profit(player, tm)
        player.game_profit = prof
        if !(∑spw == 0 && active(player))
            if amt_contributed == 0 && ∑spw == 0 && prof == 0 && !still_playing(player)
                continue
            end
            player.bank_roll += ∑spw
        end
    end
    # Can the above be replaced with
    #     for (player, initial_br, player_sp_winnings) in zip(players, tm.initial_brs, tm.side_pot_winnings)
    #         player.game_profit = profit(player, tm)
    #         player.bank_roll += sum(player_sp_winnings)
    #     end
    # ?


    if !(logger isa ByPassLogger)
        @cinfo logger "Pot distribution results:"
        for (player, player_sp_winnings) in zip(players, tm.side_pot_winnings)
            log_player_winnings(player, player_sp_winnings, tm)
        end
    end

    @cdebug logger "--- Finished distributing winnings..."
    return nothing
end

function log_player_winnings(player, player_sp_winnings, tm)
    logger = tm.logger
    sorted_hand_evals = tm.sorted_hand_evals
    ∑spw = sum(player_sp_winnings)
    ssn = tm.unsorted_to_sorted_map[seat_number(player)]
    prof = profit(player, tm)
    winnings = ∑spw
    contributed = ∑spw - prof # prof = ∑spw - contributed
    net_winnings = prof
    @log_event_code logger Int.([CodeWinnings, net_winnings.n])
    she = sorted_hand_evals[ssn]
    hand_name = she.hand_type
    bc = ntuple(i->she.best_cards[i], length(she.best_cards))
    pc = ntuple(i->player.cards[i], length(player.cards))

    f_str = folded(player) ? "folded, " : ""
    i_str = inactive(player) ? "inactive " : ""
    st_str = "$f_str$i_str"
    if hand_name == :empty
        @cinfo logger begin
            "  $(name(player)): folded / inactive."
        end
    else
        @cdebug logger "$(name(player))'s side-pot wins: $(player_sp_winnings)!"
        @cinfo logger begin
            "  $(name(player)) had $(pc). Winnings $(winnings.n), contributed $(contributed.n), net $(net_winnings.n) with $hand_name $bc."
        end
    end
    return nothing
end