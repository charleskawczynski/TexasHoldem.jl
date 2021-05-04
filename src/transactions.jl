#####
##### Transactions
#####

"""
    SidePot

A side-pot for player `player_id`,
who has gone all-in with amount `amt`.
"""
mutable struct SidePot
  player_id::Int
  amt::Float64
  cap::Float64 # total possible amount any player can contribute to this side-pot
end
player_id(sp::SidePot) = sp.player_id
amount(sp::SidePot) = sp.amt
cap(sp::SidePot) = sp.cap

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager
  sorted_players::Vector{Player}
  pot_id::Union{Nothing,Vector{Int}}
  side_pots::Vector{SidePot}
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

    TransactionManager(
        sorted_players,
        Int[1],
        [SidePot(pid, 0, cap_i) for (cap_i, pid, amt) in zip(cap, player_id.(sorted_players), bank_roll.(sorted_players))],
    )
end

function last_call_of_round(table, player)
    for (i,oponent) in enumerate(circle(table, player))
        oponent.id == player.id && continue
        folded(oponent) && continue
        oponent.all_in && !last_to_raise(oponent) && continue
        return last_to_raise(oponent)
        i > length(players_at_table(table)) && error("Broken logic in last_call_of_round")
    end
end

"""
    contribute!(table, player, amt, call=false;debug=false)

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
function contribute!(table, player, amt, call=false;debug=false)
    tm = table.transactions
    if !(0 ≤ amt ≤ bank_roll(player))
        msg1 = "Player $(player.id) has insufficient bank"
        msg2 = "roll ($(player.bank_roll)) to add $amt to pot."
        error(msg1*msg2)
    end
    @assert player.all_in == false

    amt_remaining = amt

    if amt ≈ bank_roll(player)
        player.all_in = true
    end

    for i in 1:length(tm.side_pots)
        @assert 0 ≤ amt_remaining
        side_pot_full(tm, i) && continue
        cap_i = tm.side_pots[i].cap
        @assert 0 ≤ amt_remaining
        cond = amt_remaining < cap_i
        amt_contrib = cond ? amt_remaining : cap_i
        debug && @info "$(name(player)) contributes $amt_contrib to last side-pot $(i) ($cond)"
        tm.side_pots[i].amt += amt_contrib
        player.bank_roll -= amt_contrib
        amt_remaining -= amt_contrib
        amt_remaining ≈ 0 && break
    end

    if bank_roll(player) ≈ 0 # went all-in, set exactly.
        player.bank_roll = 0
    end

    if last_call_of_round(table, player) && call
        side_pot_full!(tm)
    end
end

side_pot_full!(tm::TransactionManager) = (tm.pot_id[1]+=1)
side_pot_full(tm::TransactionManager, i) = i < tm.pot_id[1]

sidepot_winnings(tm::TransactionManager, id::Int) = sum(map(x->x.amt, tm.side_pots[1:id]))

function print_winner(player, n_side_pots, amt)
    if n_side_pots==1
        @info "$(name(player)) wins \$$(amt)!"
    else
        @info "$(name(player)) wins \$$(amt) side-pot!"
    end
end

function distribute_winnings!(players, tm::TransactionManager, table_cards)
    hand_evals = map(enumerate(tm.sorted_players)) do (j, player)
        (player.id, hand_rank(FullHandEval((player.cards..., table_cards...))), j)
    end
    hand_evals_filtered = deepcopy(hand_evals)
    n_side_pots = count(x->!(x.amt≈0), tm.side_pots)

    for i in 1:length(tm.side_pots)

        filter!(x->x[3] ≥ i, hand_evals_filtered) # only (sorted) players i:end can win the ith side-pot
        isempty(hand_evals_filtered) && continue # no players left to distribute to
        sidepot_winnings(tm, length(players)) ≈ 0 && continue # no money left to distribute

        remaining_ids = map(x-> x[1], hand_evals_filtered)
        min_hr_all = min(map(x->x[2], hand_evals_filtered)...)

        # since hand_evals are filtered, we need a `+i-1` offset to retain indexing into :
        winners = findall(x->x[2]==min_hr_all, hand_evals_filtered) .+ i .- 1
        n_winners = length(winners)

        for winner_id in winners
            win_id = tm.sorted_players[winner_id].id
            winer_pl = tm.sorted_players[winner_id]
            amt = sidepot_winnings(tm, i) / n_winners
            players[win_id].bank_roll += amt
            print_winner(players[win_id], n_side_pots, amt)
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
end
