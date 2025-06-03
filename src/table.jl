#####
##### Table
#####

import StatsBase
const SB = StatsBase
export Dealer, SmallBlind, BigBlind, FirstToAct
export Table
export move_buttons!

Base.@kwdef mutable struct Winners
    declared::Bool = false
end

function Base.show(io::IO, winners::Winners, include_type = true)
    include_type && println(io, typeof(winners))
    println(io, "Winners declared = $(winners.declared)")
end

struct Blinds{T}
    small::T
    big::T
end

Blinds() = Blinds(1,2) # default
default_dealer_pidx() = 1 # default

function Base.show(io::IO, blinds::Blinds, include_type = true)
    include_type && println(io, typeof(blinds))
    println(io, "Blinds           = (small=$(blinds.small),big=$(blinds.big))")
end

struct Buttons
    dealer::Int
    small_blind::Int
    big_blind::Int
    first_to_act::Int
end

dealer_pidx(b::Buttons) = b.dealer
small_blind_pidx(b::Buttons) = b.small_blind
big_blind_pidx(b::Buttons) = b.big_blind
first_to_act_pidx(b::Buttons) = b.first_to_act


buttons(b::Buttons) = (
    b.dealer,
    b.small_blind,
    b.big_blind,
    b.first_to_act,
)

mutable struct Table{P<:Players, L, TM, B <: Blinds, D <: PlayingCards.AbstractDeck, G}
    deck::D
    players::P
    cards::Vector{Card}
    blinds::B
    pot::Int
    round::Symbol
    buttons::Buttons
    current_raise_amt::Int
    initial_round_raise_amt::Int
    transactions::TM
    winners::Winners
    play_out_game::Bool
    n_max_actions::Int
    logger::L
    gui::G
end

buttons(table::Table) = table.buttons
n_max_actions(table::Table) = table.n_max_actions

"""
    compute_n_max_actions(players, bb)

The total possible number of actions,
which happens when
 - pre-flop: all players check/call
 - flop: all players check
 - turn: all players check
 - river: 1) all but one player checks (n_players-1 actions)
          2) the last player raises (1 action)
          3) everyone, except the last player, calls, (n_players-1 actions)
          4) the last player re-raises (1 action)
          ...
          until all players are all-in.
"""
function compute_n_max_actions(players::Players, bb)
    maxbr = maximum(bank_roll.(players))
    n_players = length(players)
    n_check_call_rounds = n_players*3 # preflop, flop, turn
    n_raise_rounds = findfirst(1:typemax(Int)) do i
        maxbr < bb^n_raises(i, n_players)
    end
    return n_check_call_rounds + n_raise_rounds
end
n_raises(i, n_players) = Int(floor(i/n_players))

Table(players::Tuple; kwargs...) = Table(Players(players); kwargs...)
function Table(players::Players;
    deck = PlayingCards.MaskedDeck(),
    cards = Card[joker, joker, joker, joker, joker],
    gui = isinteractive() ? Terminal() : NoGUI(), # NoGUI() is better for testing
    blinds = Blinds(),
    pot = 0,
    round = :preflop,
    dealer_pidx = default_dealer_pidx(),
    current_raise_amt = 0,
    initial_round_raise_amt = blinds.small,
    logger = InfoLogger(),
    transactions = TransactionManager(players, logger),
    winners = Winners(),
    play_out_game = false,
)
    P = typeof(players)
    buttons = Buttons(players, dealer_pidx)
    @assert 2 ≤ length(players) ≤ 10 "Invalid number of players"
    n_max_actions = compute_n_max_actions(players, blinds.big)
    @cdebug logger "n_max_actions = $n_max_actions"
    L = typeof(logger)
    TM = typeof(transactions)
    B = typeof(blinds)
    return Table{P, L, TM, B, typeof(deck), typeof(gui)}(deck,
        players,
        Card[cards[1],cards[2],cards[3],cards[4],cards[5]],
        blinds,
        pot,
        round,
        buttons,
        current_raise_amt,
        initial_round_raise_amt,
        transactions,
        winners,
        play_out_game,
        n_max_actions,
        logger,
        gui)
end

function Buttons(players::Players, dealer_pidx)
    dealer_pidx       = this_or_next_valid_pidx(players, dealer_pidx       )
    small_blind_pidx  = this_or_next_valid_pidx(players, dealer_pidx     +1)
    big_blind_pidx    = this_or_next_valid_pidx(players, small_blind_pidx+1)
    first_to_act_pidx = this_or_next_valid_pidx(players, big_blind_pidx  +1)
    return Buttons(dealer_pidx, small_blind_pidx, big_blind_pidx, first_to_act_pidx)
end

valid_button(player::Player) = !zero_bank_roll(player) && still_playing(player)

"""
    this_or_next_valid_pidx(players::Players, ncpidx)

Given a non-cyclic player index `ncpidx`, return
 - this cyclic player index (if valid), or
 - the next valid cyclic index
"""
function this_or_next_valid_pidx(players::Players, ncpidx)
    R = ncpidx:(ncpidx+length(players))
    i = findfirst(R) do _ncpidx
        pidx = cyclic_player_index(players, _ncpidx)
        valid_button(players[pidx])
    end::Int
    return cyclic_player_index(players, R[i])
end

function Base.show(io::IO, table::Table, include_type = true)
    include_type && println(io, typeof(table))
    show(io, blinds(table), false)
    show(io, table.winners, false)
    println(io, "Dealer           = $(dealer_pidx(table))")
    println(io, "Pot              = $(table.transactions)")
    println(io, "All cards        = $(table.cards)")
    println(io, "Observed cards   = $(observed_cards(table))")
end

cards(table::Table) = table.cards

function observed_cards(table::Table)
    r = round(table)
    if r == :preflop;   return Card[]
    elseif r == :flop;  return table.cards[1:3]
    elseif r == :turn;  return table.cards[1:4]
    elseif r == :river; return table.cards
    else; error("Uncaught case")
    end
end

function observed_cards_all(table::Table, r = round(table))
    if r == :preflop;   return Card[joker,joker,joker,joker,joker]
    elseif r == :flop;  return Card[table.cards[1:3]..., joker, joker]
    elseif r == :turn;  return Card[table.cards[1:4]..., joker]
    elseif r == :river; return table.cards
    else; error("Uncaught case")
    end
end

function unobserved_cards(table::Table)
    r = round(table)
    if r == :preflop;   return table.cards
    elseif r == :flop;  return table.cards[4:5]
    elseif r == :turn;  return Card[table.cards[5]]
    elseif r == :river; return Card[]
    else; error("Uncaught case")
    end
end

current_raise_amt(table::Table) = table.current_raise_amt
initial_round_raise_amt(table::Table) = table.initial_round_raise_amt
minimum_raise_amt(table::Table) = blinds(table).small

round(table::Table) = table.round

play_out_game(table::Table) = table.play_out_game

dealer_pidx(table::Table) = dealer_pidx(table.buttons)
small_blind_pidx(table::Table) = small_blind_pidx(table.buttons)
big_blind_pidx(table::Table) = big_blind_pidx(table.buttons)
first_to_act_pidx(table::Table) = first_to_act_pidx(table.buttons)

dealer(table::Table) = players_at_table(table)[dealer_pidx(table)]
small_blind(table::Table) = players_at_table(table)[small_blind_pidx(table)]
big_blind(table::Table) = players_at_table(table)[big_blind_pidx(table)]
first_to_act(table::Table) = players_at_table(table)[first_to_act_pidx(table)]

is_dealer(table::Table, player::Player) = seat_number(player) == seat_number(dealer(table))
is_small_blind(table::Table, player::Player) = seat_number(player) == seat_number(small_blind(table))
is_big_blind(table::Table, player::Player) = seat_number(player) == seat_number(big_blind(table))
is_first_to_act(table::Table, player::Player) = seat_number(player) == seat_number(first_to_act(table))

players_at_table(table::Table) = table.players
all_playing_checked(table::Table) = all(x -> not_playing(x) || checked(x), players_at_table(table))
all_playing_all_in(table::Table) = all(x -> not_playing(x) || all_in(x), players_at_table(table))
all_all_in_or_checked(table::Table) = all(x -> checked(x) || all_in(x), players_at_table(table))

"""
    bank_roll_leader(table::Table)

Return the player who
 - Is still playing and
 - Has the highest bank roll
and a `Bool` indicating if there
are multiple players with the largest
bank roll.
"""
function bank_roll_leader(table::Table)
    max_rbr = 0
    players = players_at_table(table)
    br_leader = first(players)
    for player in players
        still_playing(player) || continue # only consider players still playing
        pbr = round_bank_roll(player)
        if pbr > max_rbr
            br_leader = player
            max_rbr = pbr
        end
    end
    multiple_leaders = let max_rbr=max_rbr # avoid variable capture
        count(player->begin
            round_bank_roll(player) == max_rbr && still_playing(player)
        end, players) > 1
    end
    return br_leader, multiple_leaders
end

paid_current_raise_amount(table::Table, player::Player) =
    round_contribution(player) == current_raise_amt(table)

# Can be true in exactly 2 cases:
#  1) Everyone (still playing) is all-in.
#  2) Everyone (still playing), except `player`, is all-in.
function all_oppononents_all_in(table::Table, player::Player)
    all_opp_all_in = true
    for opponent in players_at_table(table)
        seat_number(opponent) == seat_number(player) && continue
        not_playing(opponent) && continue
        if action_required(opponent)
            all_opp_all_in = false
        else
            all_opp_all_in = all_opp_all_in && all_in(opponent)
        end
    end
    return all_opp_all_in
end

# One case that we need to catch is when everyone, except
# the bank roll leader, has folded or gone all-in. In this
# case, while the bank roll leader may have required actions
# everyone else does not, so nobody can respond to their raise
# (if they chose to do so). Therefore, we must "play out" the
# entire game with no further actions.
# Note that this method is intended to be used _during_ a round.
function all_all_in_except_bank_roll_leader(table::Table)
    br_leader, multiple_leaders = bank_roll_leader(table)
    players = players_at_table(table)
    multiple_leaders && return false # the bank roll leader can go all-in

    @assert !multiple_leaders # We have a single bank roll leader

    return all(player -> begin
        cond1 = not_playing(player)
        cond2 = all_in(player)
        cond3 = seat_number(player) == seat_number(br_leader) && !action_required(br_leader)
        any((cond1, cond2, cond3))
    end, players)
end

# Note that this method is only valid before or after a round has ended.
function set_play_out_game!(table::Table)
    br_leader, multiple_leaders = bank_roll_leader(table)
    players = players_at_table(table)
    if multiple_leaders
        return all(player -> not_playing(player) || all_in(player), players)
    end

    @assert !multiple_leaders # We have a single bank roll leader

    table.play_out_game = all(player -> begin
        cond1 = not_playing(player)
        cond2 = all_in(player)
        cond3 = seat_number(player) == seat_number(br_leader)
        any((cond1, cond2, cond3))
    end, players)
end

blinds(table::Table) = table.blinds

function is_blind_call(table::Table, player::Player, amt = call_amount(table, player))
    pot_inv = pot_investment(player)
    logger = table.logger
    @cdebug logger "amt = $amt, pot_investment(player) = $pot_inv"
    bb = blinds(table).big
    sb = blinds(table).small
    if is_small_blind(table, player)
        return amt == sb && pot_inv == sb
    elseif is_big_blind(table, player)
        return amt == 0 && pot_inv == bb
    else
        return amt == bb && pot_inv == 0
    end
end

function reset_round_bank_rolls!(table::Table, round)
    round == :preflop && return nothing
    players = players_at_table(table)
    for player in players
        player.round_bank_roll = bank_roll_chips(player)
    end
end

function reset_round_parameters!(table::Table)
    players = players_at_table(table)
    for player in players
        not_playing(player) && continue
        all_in(player) && continue
            player.performed_action = :none
        if !all_oppononents_all_in(table, player) # all bets have been called
            player.action_required = true
        end
        player.last_to_raise = false
        player.round_contribution = 0
    end
    table.initial_round_raise_amt = blinds(table).small
    table.current_raise_amt = 0
end

# Check for winner, in case when only a single player remains
# playing
function check_for_and_declare_winner!(table::Table)
    players = players_at_table(table)
    n_players = length(players)
    table.winners.declared = count(x->not_playing(x), players) == n_players-1
    return nothing
end


#####
##### Circling the table
#####

"""
    move_buttons!(table::Table)

Move the dealer, small blind, big blind,
and first-to-act buttons to the next set
of players.

This is an internal method.
"""
function move_buttons!(table::Table)
    players = players_at_table(table)
    dealer = table.buttons.dealer
    dealer       = this_or_next_valid_pidx(players, dealer      + 1)
    small_blind  = this_or_next_valid_pidx(players, dealer      + 1)
    big_blind    = this_or_next_valid_pidx(players, small_blind + 1)
    first_to_act = this_or_next_valid_pidx(players, big_blind   + 1)
    table.buttons = Buttons(dealer, small_blind, big_blind, first_to_act)
end

any_actions_required(table::Table) = any(x->action_required(x), players_at_table(table))

abstract type TablePosition end
struct Dealer <: TablePosition end
struct SmallBlind <: TablePosition end
struct BigBlind <: TablePosition end
struct FirstToAct <: TablePosition end # (after BigBlind)

struct CircleTable{CircType, NITER,PS}
    players::PS
    buttons::Buttons
end

n_iterations(::CircleTable{CircType,NITER}) where {CircType,NITER} = NITER

function Base.length(ct::CircleTable)
    n_iter = n_iterations(ct)
    if !(n_iter === Inf)
        return n_iter
    else
        error("CircleTable has an infinite length")
    end
end

"""
    circle(table::Table, tp::TablePosition)

Orbits the table and returns the player index for
each player, starting with the table position `tp`.

See [`Players`](@ref) for more info.
"""
circle(table::Table, tp::TablePosition, n_iter = Inf) =
    CircleTable{typeof(tp), n_iter, typeof(table.players)}(table.players, buttons(table))
#=
`ncpidx` is used here to denote "non-cyclic" player index.
We can call `cyclic_player_index` to get the `pidx`:

    pidx = cyclic_player_index(::Players, ncpidx)
=#
function Base.iterate(ct::CircleTable{Dealer}, ncpidx = dealer_pidx(ct.buttons))
    ncpidx > n_iterations(ct)+dealer_pidx(ct.buttons)-1 && return nothing
    pidx = cyclic_player_index(ct.players, ncpidx)
    player = ct.players[pidx]
    ncpidx == dealer_pidx(ct.buttons) && @assert active(player)
    return (pidx, ncpidx+1)
end

function Base.iterate(ct::CircleTable{SmallBlind}, ncpidx = small_blind_pidx(ct.buttons))
    ncpidx > n_iterations(ct)+small_blind_pidx(ct.buttons)-1 && return nothing
    pidx = cyclic_player_index(ct.players, ncpidx)
    player = ct.players[pidx]
    ncpidx == small_blind_pidx(ct.buttons) && @assert active(player)
    return (pidx, ncpidx+1)
end

function Base.iterate(ct::CircleTable{BigBlind}, ncpidx = big_blind_pidx(ct.buttons))
    ncpidx > n_iterations(ct)+big_blind_pidx(ct.buttons)-1 && return nothing
    pidx = cyclic_player_index(ct.players, ncpidx)
    player = ct.players[pidx]
    ncpidx == big_blind_pidx(ct.buttons) && @assert active(player)
    return (pidx, ncpidx+1)
end

function Base.iterate(ct::CircleTable{FirstToAct}, ncpidx = first_to_act_pidx(ct.buttons))
    ncpidx > n_iterations(ct)+first_to_act_pidx(ct.buttons)-1 && return nothing
    pidx = cyclic_player_index(ct.players, ncpidx)
    player = ct.players[pidx]
    ncpidx == first_to_act_pidx(ct.buttons) && @assert active(player)
    return (pidx, ncpidx+1)
end

show_cards(table::Table, player::Player{Human}) = player.cards
show_cards(table::Table, player::Player{S}) where {S <: AbstractStrategy} = "(??,??)"

#####
##### Deal
#####

function deal!(table::Table, blinds::Blinds)
    players = players_at_table(table)
    call_blinds = true
    logger = table.logger
    for (i, pidx) in enumerate(circle(table, SmallBlind()))
        player = players[pidx]

        i>length(players) && break # deal cards to each player once

        not_playing(player) && continue

        for j in 1:2
            player.cards[j] = SB.sample!(table.deck)
        end

        if is_small_blind(table, player) && bank_roll(player) ≤ blinds.small
            contribute!(table, player, bank_roll(player), call_blinds)
            @cinfo logger "$(name(player)) paid the small blind (all-in) and dealt cards: $(show_cards(table, player))"
        elseif is_big_blind(table, player) && bank_roll(player) ≤ blinds.big
            contribute!(table, player, bank_roll(player), call_blinds)
            @cinfo logger "$(name(player)) paid the  big  blind (all-in) and dealt cards: $(show_cards(table, player))"
        else
            if is_small_blind(table, player)
                contribute!(table, player, blinds.small, call_blinds)
                @cinfo logger "$(name(player)) paid the small blind and dealt cards: $(show_cards(table, player))"
            elseif is_big_blind(table, player)
                contribute!(table, player, blinds.big, call_blinds)
                @cinfo logger "$(name(player)) paid the  big  blind and dealt cards: $(show_cards(table, player))"
            else
                @cinfo logger "$(name(player)) dealt (free) cards:                   $(show_cards(table, player))"
            end
        end
    end
    set_antes!(table, table.round)

    @inbounds for j in 1:5
        table.cards[j] = SB.sample!(table.deck)
    end
    @cinfo logger "Table cards dealt (face-down)."
    @cdebug logger "Post-blinds bank roll summary: $(bank_roll.(players))"
end

