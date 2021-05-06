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
  initial_brs::Vector{Float64}
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
        deepcopy(collect(bank_roll.(players))),
        Int[1],
        [SidePot(pid, 0, cap_i) for (cap_i, pid, amt) in zip(cap, player_id.(sorted_players), bank_roll.(sorted_players))],
    )
end

function last_call_of_round(table, player)
    for (i,oponent) in enumerate(circle(table, player))
        oponent.id == player.id && continue
        folded(oponent) && continue
        all_in(oponent) && !last_to_raise(oponent) && continue
        return last_to_raise(oponent)
        i > length(players_at_table(table)) && error("Broken logic in last_call_of_round")
    end
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
    if !(0 ≤ amt ≤ bank_roll(player))
        msg1 = "$(name(player)) has insufficient bank"
        msg2 = "roll (\$$(bank_roll(player))) to add \$$amt to pot."
        error(msg1*msg2)
    end
    @assert all_in(player) == false

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
        @debug "$(name(player)) contributes $amt_contrib to last side-pot $(i) ($cond)"
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

function distribute_winnings!(players, tm::TransactionManager, table_cards)
    @debug "Distributing winnings..."
    @debug "Pot amounts = $(amount.(tm.side_pots))"
    hand_evals_sorted = map(enumerate(tm.sorted_players)) do (spid, player)
        fhe = sat_out(player) ? nothing : FullHandEval((player.cards..., table_cards...))
        eligible = !folded(player) && !sat_out(player)
        (; eligible=eligible, player=player, fhe=fhe, spid=spid)
    end

    player_winnings = map(players) do player
        zeros(length(tm.side_pots))
    end

    for i in 1:length(tm.side_pots)
        @debug "Distributing side-pot $i"
        @debug "sidepot_winnings(tm, length(players)) ≈ 0 = $(sidepot_winnings(tm, length(players)) ≈ 0)"
        sidepot_winnings(tm, length(players)) ≈ 0 && continue # no money left to distribute

        hand_evals_sorted = map(hand_evals_sorted) do (eligible, player, fhe, spid)
            if spid ≥ i # only (sorted) players i:end can win the ith side-pot
                (; eligible=eligible, player=player, fhe=fhe, spid=spid)
            else
                (; eligible=false, player=player, fhe=fhe, spid=spid)
            end
        end
        @debug begin
            s = "Sorted hand evals: \n"
            for hes in hand_evals_sorted
                sat_out(hes.player) && continue # (don't have cards to eval)
                s *= "eligible=$(hes.eligible), "
                s *= "pid=$(player_id(hes.player)), "
                s *= "spid=$(hes.spid), "
                s *= "hr=$(hand_rank(hes.fhe)), "
                s *= "ht=$(nameof(typeof(hand_type(hes.fhe))))\n"
            end
            s
        end
        all_valid_min_hrs = min(map(x->hand_rank(x.fhe), filter(x->x.eligible, hand_evals_sorted))...)

        winner_ids = findall(x->hand_rank(x.fhe)==all_valid_min_hrs && x.eligible, hand_evals_sorted)
        n_winners = length(winner_ids)
        @debug "winner_ids = $(winner_ids)"
        for winner_id in winner_ids
            win_id = tm.sorted_players[winner_id].id
            winning_player = players[win_id]
            folded(winning_player) && continue
            amt = sidepot_winnings(tm, i) / n_winners
            player_winnings[win_id][i] = amt
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end

    for (player, initial_br, side_pot_winnings) in zip(players, tm.initial_brs, player_winnings)
        ∑side_pot_winnings = sum(side_pot_winnings)
        if !(∑side_pot_winnings ≈ 0)
            amt_contributed = initial_br - bank_roll(player)
            @debug "$(name(player))'s side-pot wins: \$$(side_pot_winnings)!"
            @info "$(name(player)) wins \$$(∑side_pot_winnings) (\$$(∑side_pot_winnings-amt_contributed) profit)!"
            player.bank_roll += ∑side_pot_winnings
        end
    end

    @debug "Distributed winnings..."
end
