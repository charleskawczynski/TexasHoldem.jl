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
end
player_id(sp::SidePot) = sp.player_id

"""
    TransactionManager

Handle pots and side pots
among multiple players.
"""
struct TransactionManager
  sorted_players::Vector{Player}
  pot_id::Vector{Int}
  side_pots::Vector{SidePot}
end

function TransactionManager(players)
    sorted_players = sort(collect(players); by = x->bank_roll(x))
    TransactionManager(
        sorted_players,
        Int[1],
        [SidePot(pid, 0) for (pid, amt) in zip(player_id.(sorted_players), bank_roll.(sorted_players))]
    )
end

function contribute!(tm::TransactionManager, player, amt)
    @assert bank_roll(player) ≥ amt
    tm.side_pots[tm.pot_id[1]].amt+=amt
    player.bank_roll -= amt
end

side_pot_full!(tm::TransactionManager) = (tm.pot_id[1]+=1)

sidepot_winnings(tm::TransactionManager, id::Int) = sum(map(x->x.amt, tm.side_pots[1:id]))

function distribute_winnings!(players, tm::TransactionManager, table_cards)
    hand_evals = map(enumerate(tm.sorted_players)) do (j, player)
        (player.id, hand_rank(FullHandEval((player.cards..., table_cards...))), j)
    end
    hand_evals_filtered = deepcopy(hand_evals)

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
            players[win_id].bank_roll += sidepot_winnings(tm, i) / n_winners
        end
        for j in 1:i
            tm.side_pots[j].amt = 0 # empty out distributed winnings
        end
    end
end
