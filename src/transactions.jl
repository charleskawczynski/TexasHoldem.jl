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
  sorted_players::Vector{Player}
  initial_brs::Vector{Float64}
  pot_id::Union{Nothing,Vector{Int}}
  side_pots::Vector{SidePot}
  unsorted_to_sorted_map::Vector{Int}
end

function Base.show(io::IO, tm::TransactionManager, include_type = true)
    include_type && println(io, typeof(tm))
    println(io, "Pot(s)           = $(tm.side_pots)")
end

function TransactionManager(players)
    sorted_players = sort(collect(players); by = x->bank_roll(x))

    cap = zeros(length(players))
    for i in 1:length(players)
        if i == 1
            cap[i] = bank_roll(sorted_players[i])
        else
            cap[i] = bank_roll(sorted_players[i]) - sum(cap[1:i-1])
        end
    end

    unsorted_to_sorted_map = collect(map(players) do player
        findfirst(seat_number.(sorted_players) .== seat_number(player))
    end)
    side_pots = [SidePot(sn, 0, cap_i) for (cap_i, sn, amt) in zip(cap, seat_number.(sorted_players), bank_roll.(sorted_players))]

    TransactionManager(
        sorted_players,
        deepcopy(collect(bank_roll.(players))),
        Int[1],
        side_pots,
        unsorted_to_sorted_map,
    )
end
amount(tm::TransactionManager) = amount(tm.side_pots[tm.pot_id[1]])
cap(tm::TransactionManager) = cap(tm.side_pots[tm.pot_id[1]])

function last_action_of_round(table, player, call)
    laor = all_oppononents_all_in(table, player) || (count(action_required.(players_at_table(table))) == 0 && call)
    @debug "last_action_of_round = $laor"
    # @debug "    action_required.(players_at_table(table)) = $(action_required.(players_at_table(table)))"
    # @debug "    all_oppononents_all_in(table, player) = $(all_oppononents_all_in(table, player))"
    # @debug "    call = $call"
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
    @debug "$(name(player))'s bank roll (pre-contribute) = \$$(bank_roll(player))"
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
    @debug "$(name(player)) contributing $amt to side-pots"
    @debug "caps = $(cap.(tm.side_pots))"
    @debug "$(name(player))'s pot_investment = $(player.pot_investment)"

    for i in 1:length(tm.side_pots)
        @assert 0 ≤ amt_remaining
        cap_i = cap(tm.side_pots[i])
        sp_amt = amount(tm.side_pots[i])
        cond = amt_remaining < cap_i
        amt_contrib = cond ? amt_remaining : cap_i
        contributing = !side_pot_full(tm, i) && !(cap_i ≈ 0)
        # This is a bit noisy:
        # @debug "$(name(player)) potentially contributing $amt_contrib to side-pot $(i) ($cond). cap_i=$cap_i, amt_remaining=$amt_remaining"
        @debug "contributing = $contributing"
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
    @debug "$(name(player))'s bank roll (post-contribute) = \$$(bank_roll(player))"
    @debug "all_in($(name(player))) = $(all_in(player))"
end

function is_side_pot_full(tm::TransactionManager, table, player, call)
    players = players_at_table(table)
    # To switch from pot_id = 1 to pot_id = 2, then exactly 1 player  should be all-in:
    # To switch from pot_id = 2 to pot_id = 3, then exactly 2 players should be all-in:
    # ...
    return last_action_of_round(table, player, call) && count(all_in.(players)) == tm.pot_id[1]
end

set_side_pot_full!(tm::TransactionManager) = (tm.pot_id[1]+=1)
side_pot_full(tm::TransactionManager, i) = i < tm.pot_id[1]

sidepot_winnings(tm::TransactionManager, id::Int) = sum(map(x->x.amt, tm.side_pots[1:id]))

function distribute_winnings_1_player_left!(players, tm::TransactionManager, table_cards)
    @assert count(still_playing.(players)) == 1
    n = length(tm.side_pots)
    for (player, initial_br) in zip(players, tm.initial_brs)
        not_playing(player) && continue
        amt_contributed = initial_br - bank_roll(player)
        ∑spw = sidepot_winnings(tm, n)
        prof = ∑spw-amt_contributed
        @info "$(name(player)) wins \$$(∑spw) (\$$(prof) profit) (all opponents folded)"
        player.bank_roll += ∑spw
        for j in 1:n
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
        break
    end
    return nothing
end

function distribute_winnings!(players, tm::TransactionManager, table_cards)
    @debug "Distributing winnings..."
    @debug "Pot amounts = $(amount.(tm.side_pots))"
    if count(still_playing.(players)) == 1
        return distribute_winnings_1_player_left!(players, tm, table_cards)
    end
    hand_evals_sorted = map(enumerate(tm.sorted_players)) do (ssn, player)
        fhe = inactive(player) ? nothing : FullHandEval((player.cards..., table_cards...))
        eligible = still_playing(player)
        (; eligible=eligible, player=player, fhe=fhe, ssn=ssn)
    end

    side_pot_winnings = map(players) do player
        zeros(length(tm.side_pots))
    end
    winning_hands = Vector{Symbol}(undef, length(players))
    all_winning_players = Player[]

    for i in 1:length(tm.side_pots)
        sidepot_winnings(tm, length(players)) ≈ 0 && continue # no money left to distribute

        hand_evals_sorted = map(hand_evals_sorted) do (eligible, player, fhe, ssn)
            if ssn ≥ i # only (sorted) players i:end can win the ith side-pot
                (; eligible=eligible, player=player, fhe=fhe, ssn=ssn)
            else
                (; eligible=false, player=player, fhe=fhe, ssn=ssn)
            end
        end
        @debug begin
            s = "Sorted hand evals: \n"
            for hes in hand_evals_sorted
                inactive(hes.player) && continue # (don't have cards to eval)
                s *= "eligible=$(hes.eligible), "
                s *= "sn=$(seat_number(hes.player)), "
                s *= "ssn=$(hes.ssn), "
                s *= "hr=$(hand_rank(hes.fhe)), "
                s *= "ht=$(hand_type(hes.fhe))\n"
            end
            s
        end
        all_valid_min_hrs = min(map(x->hand_rank(x.fhe), filter(x->x.eligible, hand_evals_sorted))...)

        winner_ids = findall(hand_evals_sorted) do x
            x.eligible ? hand_rank(x.fhe)==all_valid_min_hrs : false
        end
        n_winners = length(winner_ids)
        @debug "winner_ids = $(winner_ids)"
        @debug "length(players) = $(length(players))"
        @debug "length(hand_evals_sorted) = $(length(hand_evals_sorted))"
        @debug "length(tm.sorted_players) = $(length(tm.sorted_players))"
        for winner_id in winner_ids
            win_seat = seat_number(tm.sorted_players[winner_id])
            winning_player = players[win_seat]
            not_playing(winning_player) && continue
            push!(all_winning_players, winning_player)
            amt = sidepot_winnings(tm, i) / n_winners
            side_pot_winnings[win_seat][i] = amt
            winning_hands[win_seat] = hand_type(hand_evals_sorted[winner_id].fhe)
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
    for (player, initial_br, player_winnings) in zip(players, tm.initial_brs, side_pot_winnings)
        ∑spw = sum(player_winnings)
        ssn = tm.unsorted_to_sorted_map[seat_number(player)]
        if ∑spw ≈ 0
            if active(player)
                hand = hand_evals_sorted[ssn].fhe
                hand_name = hand_type(hand)
                bc = best_cards(hand)
                f_str = folded(player) ? " (folded)" : ""
                @info "$(name(player)) loses$f_str \$$(pot_investment(player)) with $bc ($hand_name)!"
            end
        else
            hand = hand_evals_sorted[ssn].fhe
            hand_name = hand_type(hand)
            bc = best_cards(hand)
            amt_contributed = initial_br - bank_roll(player)
            @debug "$(name(player))'s side-pot wins: \$$(player_winnings)!"
            prof = ∑spw-amt_contributed
            @info "$(name(player)) wins \$$∑spw (\$$prof profit) with $bc ($hand_name)!"
            player.bank_roll += ∑spw
        end
    end

    @debug "Distributed winnings..."
    return Tuple(all_winning_players)
end
