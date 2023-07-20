#####
##### Transactions
#####

"""
    SidePot

A side-pot for player `pidx`,
who has gone all-in with amount `amt`.
"""
mutable struct SidePot
  pidx::Int
  amt::Float64
  cap::Float64 # total amount any individual player can contribute to this side-pot
end
pidx(sp::SidePot) = sp.pidx
amount(sp::SidePot) = sp.amt
cap(sp::SidePot) = sp.cap

# TODO: add Joker (or placeholder) cards to PlayingCards for a placeholder
const placeholder_card = PlayingCards.A♡
const placeholder_cards = ntuple(i->placeholder_card, 5)

mutable struct HandEval
    hand_rank::Int
    hand_type::Symbol
    best_cards::NTuple{5,PlayingCards.Card}
end

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager
  perm::Vector{Int}
  initial_brs::Vector{Float64}
  pot_id::Vector{Int}
  hand_evals::Vector{HandEval}
  winners::Vector{Bool}
  side_pots::Vector{SidePot}
  side_pot_winnings::Vector{Vector{Float64}}
end

function Base.show(io::IO, tm::TransactionManager, include_type = true)
    include_type && println(io, typeof(tm))
    println(io, "Pot(s)           = $(tm.side_pots)")
end

TransactionManager(players) = TransactionManager(Players(players))
function TransactionManager(players::Players)
    perm = collect(sortperm(players))

    cap = zeros(length(players))
    for i in 1:length(players)
        if i == 1
            cap[i] = bank_roll(players[perm[i]])
        else
            cap[i] = bank_roll(players[perm[i]]) - sum(cap[1:i-1])
        end
    end

    side_pots = [SidePot(i, 0, cap_i) for (cap_i, i) in zip(cap, 1:length(players))]

    initial_brs = deepcopy(collect(bank_roll.(players)))
    pot_id = Int[1]
    hand_evals = map(x-> HandEval(-1,:empty, placeholder_cards), collect(1:length(players)))
    winners = map(x-> false, collect(1:length(players)))
    side_pot_winnings = map(p->zeros(length(side_pots)), collect(1:length(players)))
    TransactionManager(
        perm,
        initial_brs,
        pot_id,
        hand_evals,
        winners,
        side_pots,
        side_pot_winnings,
    )
end

function reset!(tm::TransactionManager, players::Players)
    perm = tm.perm
    sortperm!(perm, players)
    @inbounds for i in 1:length(players)
        sp = players[perm[i]]
        player = players[i]
        br = bank_roll(sp)
        cap_i = i == 1 ? br : br - bank_roll(players[perm[i-1]])
        tm.side_pots[i].pidx = i
        tm.side_pots[i].amt = Float64(0)
        tm.side_pots[i].cap = cap_i
        tm.initial_brs[i] = bank_roll(player)
        tm.hand_evals[i].hand_rank = -1
        tm.hand_evals[i].hand_type = :empty
        tm.hand_evals[i].best_cards = placeholder_cards
        tm.winners[i] = false
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
    @cdebug logger "$(name(player))'s bank roll (pre-contribute) = \$$(bank_roll(player))"
    if !(0 ≤ amt ≤ bank_roll(player))
        msg1 = "$(name(player)) has insufficient bank"
        msg2 = "roll (\$$(bank_roll(player))) to add \$$amt to pot."
        error(msg1*msg2)
    end
    @assert all_in(player) == false
    @assert !(amt ≈ 0) "Cannot contribute \$$amt to the pot!"

    player.round_contribution += amt
    player.pot_investment += amt
    amt_remaining = amt
    @cdebug logger "$(name(player)) contributing $amt to side-pots"
    @cdebug logger "caps = $(cap.(tm.side_pots))"
    @cdebug logger "$(name(player))'s pot_investment = $(player.pot_investment)"

    for i in 1:length(tm.side_pots)
        @assert 0 ≤ amt_remaining
        cap_i = cap(tm.side_pots[i])
        sp_amt = amount(tm.side_pots[i])
        cond = amt_remaining < cap_i
        amt_contrib = cond ? amt_remaining : cap_i
        contributing = !side_pot_full(tm, i) && !(cap_i ≈ 0)
        # This is a bit noisy:
        # @cdebug logger "$(name(player)) potentially contributing $amt_contrib to side-pot $(i) ($cond). cap_i=$cap_i, amt_remaining=$amt_remaining"
        @cdebug logger "contributing = $contributing"
        contributing || continue
        @assert !(amt_contrib ≈ 0)
        tm.side_pots[i].amt += amt_contrib
        player.bank_roll -= amt_contrib
        amt_remaining -= amt_contrib
        amt_remaining ≈ 0 && break
    end
    @assert amt_remaining ≈ 0 # pots better be emptied

    if bank_roll(player) ≈ 0 # went all-in, set exactly.
        player.all_in = true
        player.action_required = false
        player.bank_roll = 0
    end

    if is_side_pot_full(tm, table, player, call)
        set_side_pot_full!(tm)
    end
    @cdebug logger "$(name(player))'s bank roll (post-contribute) = \$$(bank_roll(player))"
    @cdebug logger "all_in($(name(player))) = $(all_in(player))"
end

function is_side_pot_full(tm::TransactionManager, table, player, call)
    players = players_at_table(table)
    # To switch from pot_id = 1 to pot_id = 2, then exactly 1 player  should be all-in:
    # To switch from pot_id = 2 to pot_id = 3, then exactly 2 players should be all-in:
    # ...
    return count(x->all_in(x), players) == tm.pot_id[1] && last_action_of_round(table, player, call)
end

set_side_pot_full!(tm::TransactionManager) = (tm.pot_id[1]+=1)
side_pot_full(tm::TransactionManager, i) = i < tm.pot_id[1]

Base.@propagate_inbounds function sidepot_winnings(tm::TransactionManager, id::Int)
    sum(i->tm.side_pots[i].amt, 1:id)
end

# only (sorted) players i:end can win the ith side-pot
# (sorted) players are only eligible to win side-pots: `1:perm[pidx]` i:end can win the ith side-pot
function eligible(perm, pidx, i)
    return perm[pidx] ≥ i
end

function distribute_winnings_1_player_left!(players, tm::TransactionManager, table_cards, logger)
    @assert count(x->still_playing(x), players) == 1
    n = length(tm.side_pots)
    for (player, initial_br) in zip(players, tm.initial_brs)
        not_playing(player) && continue
        amt_contributed = initial_br - bank_roll(player)
        ∑spw = sidepot_winnings(tm, n)
        prof = ∑spw-amt_contributed
        @cinfo logger "$(name(player)) wins \$$(∑spw) (\$$(prof) profit) (all opponents folded)"
        player.bank_roll += ∑spw
        for j in 1:n
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
        break
    end
    return nothing
end

function minimum_ith_sidepot_hand_rank(hand_evals, perm, i)::Int
    min_hrs = typemax(Int)
    for j in 1:length(hand_evals)
        hr = hand_evals[j].hand_rank
        hr == -1 && continue
        eligible(perm, j, i) || continue
        min_hrs = min(min_hrs, hr)
    end
    return min_hrs
end

function distribute_winnings!(players, tm::TransactionManager, table_cards, logger=InfoLogger())
    @cdebug logger "Distributing winnings..."
    @cdebug logger "Pot amounts = $(amount.(tm.side_pots))"
    if count(x->still_playing(x), players) == 1
        return distribute_winnings_1_player_left!(players, tm, table_cards, logger)
    end

    for i in 1:length(players)
        player = players[i]
        if isnothing(player.cards)
            tm.hand_evals[i].hand_rank = -1
            tm.hand_evals[i].hand_type = :empty
            tm.hand_evals[i].best_cards = placeholder_cards
        else
            pc = player.cards::Tuple{PlayingCards.Card,PlayingCards.Card}
            tc = table_cards::Tuple{PlayingCards.Card,PlayingCards.Card,PlayingCards.Card,PlayingCards.Card,PlayingCards.Card}
            he = PokerHandEvaluator.FullHandEval((pc..., tc...))
            # he = PokerHandEvaluator.CompactHandEval((player.cards..., table_cards...))
            tm.hand_evals[i].hand_rank = still_playing(player) && !inactive(player) ? hand_rank(he) : -1
            tm.hand_evals[i].hand_type = still_playing(player) && !inactive(player) ? hand_type(he) : :empty
            tm.hand_evals[i].best_cards = still_playing(player) && !inactive(player) ? best_cards(he) : placeholder_cards
        end
    end

    @inbounds for i in 1:length(tm.side_pots)
        for j in 1:length(players)
            tm.side_pot_winnings[i][j] = 0
        end
    end

    @inbounds for i in 1:length(tm.side_pots)
        sidepot_winnings(tm, length(players)) ≈ 0 && continue # no money left to distribute

        @cdebug logger begin
            s = "Hand evals: \n"
            for i in 1:length(players)
                he = tm.hand_evals[i]
                player = players[i]
                inactive(player) && continue # (don't have cards to eval)
                s *= "sn=$(seat_number(player)), "
                s *= "hr=$(he.hand_rank), "
                s *= "ht=$(he.hand_type)\n"
            end
            s
        end
        misphr = minimum_ith_sidepot_hand_rank(tm.hand_evals, tm.perm, i)
        misphr == typemax(Int) && continue
        misphr == -1 && continue

        for j in 1:length(players)
            tm.winners[j] = eligible(tm.perm, j, i) && tm.hand_evals[j].hand_rank == misphr
        end
        n_winners = count(tm.winners)
        @cdebug logger "winners = $(tm.winners)"
        @cdebug logger "length(players) = $(length(players))"
        for (j, winner) in enumerate(tm.winners)
            winner || continue
            amt = sidepot_winnings(tm, i) / n_winners
            tm.side_pot_winnings[j][i] = amt
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
    for i in 1:length(players)
        player = players[i]
        active(player) || continue
        player_winnings = tm.side_pot_winnings[i]
        initial_br = tm.initial_brs[i]
        ∑spw = sum(player_winnings)
        he = tm.hand_evals[i]
        hand_name = he.hand_type
        bc = he.best_cards
        if ∑spw ≈ 0
            f_str = folded(player) ? " (folded)" : ""
            @cinfo logger "$(name(player)) loses$f_str \$$(pot_investment(player)) with $bc ($hand_name)!"
        else
            amt_contributed = initial_br - bank_roll(player)
            @cdebug logger "$(name(player))'s side-pot wins: \$$(player_winnings)!"
            prof = ∑spw-amt_contributed
            @cinfo logger "$(name(player)) wins \$$∑spw (\$$prof profit) with $bc ($hand_name)!"
            player.bank_roll += ∑spw
        end
    end

    @cdebug logger "Distributed winnings..."
    return nothing
end
