#####
##### Transactions
#####

"""
    SidePot

A side-pot for player `seat_number`,
who has gone all-in with amount `amt`.
"""
mutable struct SidePot
  seat_number::Int
  amt::Float64
  cap::Float64 # total amount any individual player can contribute to this side-pot
end
seat_number(sp::SidePot) = sp.seat_number
amount(sp::SidePot) = sp.amt
cap(sp::SidePot) = sp.cap

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager
  perm::Vector{Int}
  initial_brs::Vector{Float64}
  pot_id::Vector{Int}
  side_pots::Vector{SidePot}
  side_pot_winnings::Vector{Vector{Float64}}
  unsorted_to_sorted_map::Vector{Int}
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

    unsorted_to_sorted_map = collect(map(players) do player
        findfirst(p -> seat_number(players[p]) == seat_number(player), perm)
    end)
    side_pots = [SidePot(seat_number(players[p]), 0, cap_i) for (cap_i, p) in zip(cap, perm)]

    initial_brs = deepcopy(collect(bank_roll.(players)))
    pot_id = Int[1]
    FT = eltype(initial_brs)
    side_pot_winnings = collect(map(x->collect(map(x->FT(0), players)), players))
    TransactionManager(
        perm,
        initial_brs,
        pot_id,
        side_pots,
        side_pot_winnings,
        unsorted_to_sorted_map,
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
        ssn = seat_number(sp)::Int
        tm.side_pots[i].seat_number = ssn
        tm.side_pots[i].amt = Float64(0)
        tm.side_pots[i].cap = cap_i
        tm.side_pot_winnings[i] .= 0
        j = findfirst(p->seat_number(players[p]) == seat_number(player), perm)::Int
        tm.unsorted_to_sorted_map[i] = j
        tm.initial_brs[i] = bank_roll(player)
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

function minimum_valid_hand_rank(hand_evals_sorted, i)::Int
    min_hrs = typemax(Int)
    for hes in hand_evals_sorted
        still_playing(hes.player) && hes.ssn ≥ i || continue
        min_hrs = min(min_hrs, hand_rank(hes.fhe))
    end
    @assert min_hrs ≠ typemax(Int)
    return min_hrs
end

function distribute_winnings!(players, tm::TransactionManager, table_cards, logger=InfoLogger())
    @cdebug logger "Distributing winnings..."
    @cdebug logger "Pot amounts = $(amount.(tm.side_pots))"
    if count(x->still_playing(x), players) == 1
        return distribute_winnings_1_player_left!(players, tm, table_cards, logger)
    end
    hand_evals_sorted = map(enumerate(tm.perm)) do (ssn, p)
        player = players[p]
        fhe = inactive(player) ? nothing : FullHandEval((player.cards..., table_cards...))
        (; player=player, fhe=fhe, ssn=ssn)
    end

    for i in 1:length(players)
        tm.side_pot_winnings[i] .= 0
    end

    @inbounds for i in 1:length(tm.side_pots)
        sidepot_winnings(tm, length(players)) ≈ 0 && continue # no money left to distribute

        @cdebug logger begin
            s = "Sorted hand evals: \n"
            for hes in hand_evals_sorted
                inactive(hes.player) && continue # (don't have cards to eval)
                s *= "eligible=$(hes.ssn ≥ i && still_playing(hes.player)), "
                s *= "sn=$(seat_number(hes.player)), "
                s *= "ssn=$(hes.ssn), "
                s *= "hr=$(hand_rank(hes.fhe)), "
                s *= "ht=$(hand_type(hes.fhe))\n"
            end
            s
        end
        mvhr = minimum_valid_hand_rank(hand_evals_sorted, i)

        winner_ids = findall(hand_evals_sorted) do x
            still_playing(x.player) && x.ssn ≥ i ? hand_rank(x.fhe)==mvhr : false
        end
        n_winners = length(winner_ids)
        @cdebug logger "winner_ids = $(winner_ids)"
        @cdebug logger "length(players) = $(length(players))"
        @cdebug logger "length(hand_evals_sorted) = $(length(hand_evals_sorted))"
        for winner_id in winner_ids
            win_seat = seat_number(players[tm.perm[winner_id]])
            winning_player = players[win_seat]
            not_playing(winning_player) && continue
            amt = sidepot_winnings(tm, i) / n_winners
            tm.side_pot_winnings[win_seat][i] = amt
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
    for (player, initial_br, player_winnings) in zip(players, tm.initial_brs, tm.side_pot_winnings)
        ∑spw = sum(player_winnings)
        ssn = tm.unsorted_to_sorted_map[seat_number(player)]
        if ∑spw ≈ 0
            if active(player)
                hand = hand_evals_sorted[ssn].fhe
                hand_name = hand_type(hand)
                bc = best_cards(hand)
                f_str = folded(player) ? " (folded)" : ""
                @cinfo logger "$(name(player)) loses$f_str \$$(pot_investment(player)) with $bc ($hand_name)!"
            end
        else
            hand = hand_evals_sorted[ssn].fhe
            hand_name = hand_type(hand)
            bc = best_cards(hand)
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
