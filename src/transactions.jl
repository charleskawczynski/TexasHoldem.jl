#####
##### Transactions
#####

import PokerHandEvaluator
const PHE = PokerHandEvaluator

"""
    SidePot

A side-pot for each player.
"""
struct SidePot{N}
  amts::NTuple{N, Int} # amount contributed per player
  cap::Int # total amount any individual player can contribute to this side-pot
end
amounts(sp::SidePot) = sp.amts
cap(sp::SidePot) = sp.cap

const joker = Card(0, 1)

Base.@kwdef struct HandEval
    hand_rank::Int = 1
    hand_type::Symbol = :empty
    best_cards::NTuple{5, Card} = (joker,joker,joker,joker,joker)
end

"""
    Transactions

Handle pots and side pots
among multiple players.
"""
struct Transactions{N}
  perm::NTuple{N, Int}
  bank_rolls::NTuple{N, Chips} # cache
  initial_brs::NTuple{N, Chips}
  pot_id::Int
  side_pots::NTuple{N, SidePot{N}}
  side_pot_winnings::NTuple{N, NTuple{N, Chips}}
  unsorted_to_sorted_map::NTuple{N, Int}
  sorted_hand_evals::NTuple{N,HandEval}
end

function Base.show(io::IO, tr::Transactions, include_type = true)
    include_type && println(io, typeof(tr))
    println(io, "Pot(s)           = $(tr.side_pots)")
end

Transactions(players, logger) = Transactions(NewPlayers(players), logger)
function Transactions(players::Players, logger)
    N = length(players)
    perm = sortperm(players)
    bank_rolls = map(x->bank_roll_chips(x), players)

    brp = map(p->bank_roll(players[p]), perm)
    caps = ntuple(N) do i
        i==1 ? brp[1] : brp[i] - brp[i-1]
    end

    unsorted_to_sorted_map = map(players) do player
        findfirst(p -> seat_number(players[p]) == seat_number(player), perm)
    end
    amts = ntuple(_ -> 0, N)
    side_pots = map(c->SidePot(amts, c), caps)
    @assert N > 0
    @cdebug logger "initial caps = $(cap.(side_pots))"

    initial_brs = map(x->bank_roll_chips(x), players)
    sorted_hand_evals = ntuple(_->HandEval(), N)
    pot_id = 1
    FT = eltype(initial_brs)
    side_pot_winnings = map(x->map(x->FT(0), players), players)
    Transactions{N}(
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

function reset(transactions::Transactions, players::Players)
    N = length(players)
    (; bank_rolls,
        side_pots,
        side_pot_winnings,
        pot_id,
        unsorted_to_sorted_map,
        initial_brs) = transactions
    bank_rolls = ntuple(i->bank_roll_chips(players[i]), N)
    # perm = sortperm(bank_rolls)
    perm = TupleTools.sortperm(ntuple(i->bank_roll(players[i]), N))
    @inbounds for i in 1:N
        sp = players[perm[i]]
        player = players[i]
        br = bank_roll(sp)
        cap_i = i == 1 ? br : br - bank_roll(players[perm[i-1]])
        @reset side_pots[i].amts .= 0
        @reset side_pots[i].cap = cap_i
        for k in 1:N
            @reset side_pot_winnings[i][k] = Chips(0)
        end
        j = findfirst(p->seat_number(players[p]) == seat_number(player), perm)::Int
        @reset unsorted_to_sorted_map[i] = j
        @reset initial_brs[i] = bank_roll_chips(player)
    end
    pot_id = 1
    @reset transactions.perm = perm
    @reset transactions.bank_rolls = bank_rolls
    @reset transactions.side_pots = side_pots
    @reset transactions.side_pot_winnings = side_pot_winnings
    @reset transactions.pot_id = pot_id
    @reset transactions.unsorted_to_sorted_map = unsorted_to_sorted_map
    @reset transactions.initial_brs = initial_brs
    return transactions
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
    contribute(table, player, amt, call=false)

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
function contribute(table, player, amt, call=false)
    tr = table.transactions
    logger = table.logger
    players = players_at_table(table)
    pidx = pidx_from_seat_number(player, players)
    @cdebug logger "contribute"
    @cdebug logger "     $(name(player))'s bank roll (pre-contribute) = $(bank_roll(player))"
    if !(0 ≤ amt ≤ bank_roll(player))
        msg1 = "$(name(player)) has insufficient bank"
        msg2 = "roll ($(bank_roll(player))) to add $amt to pot."
        error(msg1*msg2)
    end
    @assert all_in(player) == false
    @assert !(amt == 0) "Cannot contribute $amt to the pot!"

    @reset player.round_contribution += amt
    @reset player.pot_investment += amt
    amt_remaining = amt
    @cdebug logger "     $(name(player)) contributing $amt to side-pots"
    @cdebug logger "     caps = $(cap.(tr.side_pots))"
    @cdebug logger "     $(name(player))'s pot_investment = $(player.pot_investment)"

    @inbounds for i in 1:length(tr.side_pots)
        @assert 0 ≤ amt_remaining
        sp = tr.side_pots[i]
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
        @cdebug logger "     amt_contrib: $amt_contrib"
        @assert 0 < amt_contrib "amt_contrib: $amt_contrib"
        @reset tr.side_pots[i].amts[sn] += amt_contrib
        @cdebug logger "     side_pots: $(tr.side_pots[i].amts)"
        @cdebug logger "     $(name(player)).bank_roll (pre contrib): $(bank_roll(player))"
        @reset player.bank_roll -= amt_contrib
        @cdebug logger "     $(name(player)).bank_roll (post contrib): $(bank_roll(player))"
        amt_remaining -= amt_contrib
        amt_remaining == 0 && break
    end
    @assert amt_remaining == 0 "amt_remaining: $amt_remaining" # pots better be emptied

    if bank_roll(player) == 0 # went all-in.
        @reset player.all_in = true
        @reset player.action_required = false
    end

    @reset players.players[pidx] = player
    if is_side_pot_full(tr, players)
        @reset tr.pot_id += 1
    end
    @cdebug logger "     $(name(player)).bank_roll (post contrib): $(bank_roll(player))"
    @cdebug logger "     all_in($(name(player))) = $(all_in(player))"
    @cdebug logger "     post-contribute side-pots: $(tr.side_pots)"
    @reset table.transactions = tr
    @reset table.players = players
    return table
end

function is_side_pot_full(tr, players, ith_sidepot = tr.pot_id)
    sp = tr.side_pots[ith_sidepot]
    all(x->is_player_contribution_to_side_pot_full(sp, seat_number(x)), players)
end
is_player_contribution_to_side_pot_full(side_pot, sn::Int) =
    side_pot.amts[sn] == cap(side_pot)

contribution_fits_in_sidepot(side_pot, sn::Int, contribution) =
    side_pot.amts[sn] + contribution ≤ cap(side_pot)

contribution_that_fits_in_sidepot(side_pot, sn::Int) =
    cap(side_pot) - side_pot.amts[sn]

# TODO: should we have a pot/sidepot that persists through `distribute_winnings`?
function pot(tr::Transactions)
    sp = sidepot_winnings(tr.side_pots, length(tr.side_pots))
    return sp == 0 ? sum(spw->sum(spw), tr.side_pot_winnings) : sp
end

Base.@propagate_inbounds function sidepot_winnings(side_pots, id::Int)
    mapreduce(i->sum(side_pots[i].amts), +, 1:id; init=0)
end

function profit(player, side_pot_winnings)
    ∑spw = sum(side_pot_winnings[seat_number(player)])
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

function distribute_winnings(table, logger=InfoLogger())
    (; transactions, players) = table
    N = length(players)
    tr = transactions
    table_cards = table.cards
    @cdebug logger "--- Distributing winnings..."
    (; side_pots, sorted_hand_evals, side_pot_winnings, perm, initial_brs) = transactions
    @cdebug logger "Pot amounts = $(amounts.(side_pots))"
    @inbounds for (ssn, p) in enumerate(perm)
        player = players[p]
        if !pot_eligible(player)
            @reset sorted_hand_evals[ssn].hand_rank = -1
            @reset sorted_hand_evals[ssn].hand_type = :empty
            @inbounds for i in 1:5
                @reset sorted_hand_evals[ssn].best_cards[i] = joker
            end
        else
            pc = player.cards
            tc = table_cards
            @inbounds all_cards = (pc[1], pc[2], tc[1], tc[2], tc[3], tc[4], tc[5])
            if logger isa ByPassLogger
                he = PHE.CompactHandEval(all_cards)
                @reset sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                @reset sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
            else
                @assert !any(c->c===joker, all_cards) "`all_cards`: $all_cards"
                he = PHE.FullHandEval(all_cards)
                @reset sorted_hand_evals[ssn].hand_rank = PHE.hand_rank(he)
                @reset sorted_hand_evals[ssn].hand_type = PHE.hand_type(he)
                bc = PHE.best_cards(he)
                # @show bc
                @reset sorted_hand_evals[ssn].best_cards = bc
            end
        end
    end

    side_pot_winnings = ntuple(i->ntuple(_->Chips(0), N), N)

    # populate `side_pot_winnings` and empty out `side_pots`
    @inbounds for i in 1:length(side_pots)
        sidepot_winnings(side_pots, length(players)) == 0 && continue # no money left to distribute

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
            @cdebug logger "winning pidx = $(perm[winner_id])"
            win_seat = seat_number(players[perm[winner_id]])
            amt_total = sidepot_winnings(side_pots, i)
            amt_base = div(amt_total, n_winners)
            remainder = rem(amt_total, n_winners) # ∈ 1:(amt_base-1)
            amt_chips = Chips(amt_base, SimpleRatio(remainder,n_winners))
            @reset side_pot_winnings[win_seat][i] = amt_chips
        end
        for j in 1:i
            @reset side_pots[j].amts .= 0 # empty out distributed winnings
        end
    end

    pidxs = map(p->pidx_from_seat_number(p, players), players)
    # Adjust bank rolls:
    for (pidx, initial_br, player_sp_winnings) in zip(pidxs, initial_brs, side_pot_winnings)
        player = players[pidx]
        ∑spw = sum(player_sp_winnings)
        amt_contributed = initial_br - bank_roll(player)
        prof = profit(player, side_pot_winnings)
        @reset players[pidx].game_profit = prof
        if !(∑spw == 0 && active(player))
            if amt_contributed == 0 && ∑spw == 0 && prof == 0 && !still_playing(player)
                continue
            end
            @reset players[pidx].bank_roll += ∑spw
        end
    end

    @cdebug logger "--- Finished distributing winnings..."
    @reset tr.side_pots = side_pots
    @reset tr.sorted_hand_evals = sorted_hand_evals
    @reset tr.side_pot_winnings = side_pot_winnings
    @reset table.players = players
    @reset table.transactions = tr
    if !(logger isa ByPassLogger)
        for (player, player_sp_winnings) in zip(players, side_pot_winnings)
            log_player_winnings(player, player_sp_winnings, tr, logger)
        end
    end
    return table
end

function log_player_winnings(player, player_sp_winnings, tr, logger)
    (; side_pot_winnings, sorted_hand_evals) = tr
    ∑spw = sum(player_sp_winnings)
    ssn = tr.unsorted_to_sorted_map[seat_number(player)]
    prof = profit(player, side_pot_winnings)
    winnings = ∑spw
    contributed = ∑spw - prof # prof = ∑spw - contributed
    net_winnings = prof
    she = sorted_hand_evals[ssn]
    hand_name = she.hand_type
    bc = she.best_cards

    f_str = folded(player) ? "folded, " : ""
    i_str = inactive(player) ? "inactive " : ""
    st_str = "$f_str$i_str"
    if hand_name == :empty
        @cinfo logger begin
            "$(name(player)): folded / inactive."
        end
    else
        @cdebug logger "$(name(player))'s side-pot wins: $(player_sp_winnings)!"
        @cinfo logger begin
            "$(name(player)): winnings $(winnings.n), contributed $(contributed.n), net $(net_winnings.n) with $bc ($hand_name), `bank_roll`:$(bank_roll(player))."
        end
    end
    return nothing
end