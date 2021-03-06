#####
##### Table
#####

export Dealer, SmallBlind, BigBlind, FirstToAct
export Table
export move_buttons!

Base.@kwdef mutable struct Winners
    declared::Bool = false
    players::Union{Nothing,Tuple,Player} = nothing
end

function Base.show(io::IO, winners::Winners, include_type = true)
    include_type && println(io, typeof(winners))
    println(io, "Winners declared = $(winners.declared)")
    println(io, "Winners          = $(winners.players)")
end

struct Blinds{S,B}
    small::S
    big::B
end

Blinds() = Blinds(1,2) # default
default_dealer_id() = 1 # default

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

dealer_id(b::Buttons) = b.dealer
small_blind_id(b::Buttons) = b.small_blind
big_blind_id(b::Buttons) = b.big_blind
first_to_act_id(b::Buttons) = b.first_to_act


buttons(b::Buttons) = (
    b.dealer,
    b.small_blind,
    b.big_blind,
    b.first_to_act,
)

mutable struct Table
    deck::PlayingCards.Deck
    players::Tuple
    cards::Union{Nothing,Tuple{<:Card,<:Card,<:Card,<:Card,<:Card}}
    blinds::Blinds
    pot::Float64
    state::AbstractGameState
    buttons::Buttons
    current_raise_amt::Float64
    initial_round_raise_amt::Float64
    transactions::TransactionManager
    winners::Winners
    play_out_game::Bool
    n_max_actions::Int
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
function compute_n_max_actions(players, bb)
    maxbr = maximum(bank_roll.(players))
    n_players = length(players)
    n_check_call_rounds = n_players*3 # PreFlop, Flop, Turn
    n_raise_rounds = findfirst(1:typemax(Int)) do i
        maxbr < bb^n_raises(i, n_players)
    end
    return n_check_call_rounds + n_raise_rounds
end
n_raises(i, n_players) = Int(floor(i/n_players))

function Table(;
    players::Tuple,
    deck = ordered_deck(),
    cards = nothing,
    blinds = Blinds(),
    pot = Float64(0),
    state = PreFlop(),
    dealer_id = default_dealer_id(),
    current_raise_amt = Float64(0),
    initial_round_raise_amt = blinds.small,
    transactions = nothing,
    winners = Winners(),
    play_out_game = false,
)
    if transactions == nothing
        transactions = TransactionManager(players)
    end
    buttons = Buttons(dealer_id, players)
    n_max_actions = compute_n_max_actions(players, blinds.big)
    @debug "n_max_actions = $n_max_actions"
    return Table(deck,
        players,
        cards,
        blinds,
        pot,
        state,
        buttons,
        current_raise_amt,
        initial_round_raise_amt,
        transactions,
        winners,
        play_out_game,
        n_max_actions)
end

function Buttons(dealer_id, players::Tuple)
    dealer_id       = this_or_next_valid_id(dealer_id       , players)
    small_blind_id  = this_or_next_valid_id(dealer_id     +1, players)
    big_blind_id    = this_or_next_valid_id(small_blind_id+1, players)
    first_to_act_id = this_or_next_valid_id(big_blind_id  +1, players)
    return Buttons(dealer_id, small_blind_id, big_blind_id, first_to_act_id)
end

valid_button(player::Player) = !zero_bank_roll(player) && still_playing(player)

"""
    this_or_next_valid_id(id, players::Tuple)

Given an index `id`, return this index, if valid,
otherwise find the next valid index.
"""
function this_or_next_valid_id(id, players::Tuple)
    n_players = length(players)
    id = circle_index(n_players, id) # so that we can pass in id+1
    if valid_button(players[id])
        return id
    else
        state = id
        id_need_defined = true
        while id_need_defined
            state > 2*n_players && error("Broken logic in this_or_next_valid_id")
            id = circle_index(n_players, state)
            if valid_button(players[id])
                return id
            end
            state+=1
        end
    end
end

function Base.show(io::IO, table::Table, include_type = true)
    include_type && println(io, typeof(table))
    show(io, blinds(table), false)
    show(io, table.winners, false)
    println(io, "Dealer           = $(dealer_id(table))")
    println(io, "Pot              = $(table.transactions)")
    println(io, "All cards        = $(table.cards)")
    println(io, "Observed cards   = $(observed_cards(table))")
end

get_table_cards!(deck::PlayingCards.Deck) =
    Iterators.flatten(ntuple(i->pop!(deck, 1), 5)) |> collect |> Tuple
cards(table::Table) = table.cards

observed_cards(table::Table) = observed_cards(table, table.state)
observed_cards(table::Table, ::PreFlop) = ()
observed_cards(table::Table, ::Flop) = table.cards[1:3]
observed_cards(table::Table, ::Turn) = table.cards[1:4]
observed_cards(table::Table, ::River) = table.cards
current_raise_amt(table::Table) = table.current_raise_amt
initial_round_raise_amt(table::Table) = table.initial_round_raise_amt
minimum_raise_amt(table::Table) = blinds(table).small

state(table::Table) = table.state

play_out_game(table::Table) = table.play_out_game

dealer_id(table::Table) = dealer_id(table.buttons)
small_blind_id(table::Table) = small_blind_id(table.buttons)
big_blind_id(table::Table) = big_blind_id(table.buttons)
first_to_act_id(table::Table) = first_to_act_id(table.buttons)

dealer(table::Table) = players_at_table(table)[dealer_id(table)]
small_blind(table::Table) = players_at_table(table)[small_blind_id(table)]
big_blind(table::Table) = players_at_table(table)[big_blind_id(table)]
first_to_act(table::Table) = players_at_table(table)[first_to_act_id(table)]

is_dealer(table::Table, player::Player) = seat_number(player) == seat_number(dealer(table))
is_small_blind(table::Table, player::Player) = seat_number(player) == seat_number(small_blind(table))
is_big_blind(table::Table, player::Player) = seat_number(player) == seat_number(big_blind(table))
is_first_to_act(table::Table, player::Player) = seat_number(player) == seat_number(first_to_act(table))

players_at_table(table::Table) = table.players
all_playing_checked(table::Table) = all(map(x -> not_playing(x) || checked(x), players_at_table(table)))
all_playing_all_in(table::Table) = all(map(x -> not_playing(x) || all_in(x), players_at_table(table)))
all_all_in_or_checked(table::Table) = all(map(x -> checked(x) || all_in(x), players_at_table(table)))

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
    multiple_leaders = count(map(players) do player
        round_bank_roll(player) ??? max_rbr && still_playing(player)
    end) > 1
    return br_leader, multiple_leaders
end

paid_current_raise_amount(table::Table, player::Player) =
    round_contribution(player) ??? current_raise_amt(table)

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

    return all(map(players) do player
        cond1 = not_playing(player)
        cond2 = all_in(player)
        cond3 = seat_number(player) == seat_number(br_leader) && !action_required(br_leader)
        any((cond1, cond2, cond3))
    end)
end

# Note that this method is only valid before or after a round has ended.
function set_play_out_game!(table::Table)
    br_leader, multiple_leaders = bank_roll_leader(table)
    players = players_at_table(table)
    if multiple_leaders
        return all(map(player -> not_playing(player) || all_in(player), players))
    end

    @assert !multiple_leaders # We have a single bank roll leader

    table.play_out_game = all(map(players) do player
        cond1 = not_playing(player)
        cond2 = all_in(player)
        cond3 = seat_number(player) == seat_number(br_leader)
        any((cond1, cond2, cond3))
    end)
end

blinds(table::Table) = table.blinds

function is_blind_call(table::Table, player::Player, amt = call_amount(table, player))
    pot_inv = pot_investment(player)
    @debug "amt = $amt, pot_investment(player) = $pot_inv"
    bb = blinds(table).big
    sb = blinds(table).small
    if is_small_blind(table, player)
        return amt ??? sb && pot_inv ??? sb
    elseif is_big_blind(table, player)
        return amt ??? 0 && pot_inv ??? bb
    else
        return amt ??? bb && pot_inv ??? 0
    end
end

function reset_round_bank_rolls!(table::Table)
    players = players_at_table(table)
    for player in players
        player.round_bank_roll = bank_roll(player)
    end
end

function reset_round!(table::Table)
    players = players_at_table(table)
    for player in players
        not_playing(player) && continue
        all_in(player) && continue
        player.checked = false
        player.action_required = true
        player.last_to_raise = false
        player.round_contribution = 0
    end
    table.initial_round_raise_amt = blinds(table).small
    table.current_raise_amt = 0
end

function set_state!(table::Table, state::AbstractGameState)
    table.state = state
end

# Check for winner, in case when only a single player remains
# playing
function check_for_and_declare_winner!(table::Table)
    players = players_at_table(table)
    n_players = length(players)
    table.winners.declared = count(not_playing.(players)) == n_players-1
    if table.winners.declared
        for player in players
            not_playing(player) && continue
            table.winners.players = player
        end
    end
end


#####
##### Circling the table
#####

"""
    move_buttons!(table::Table)

Move the dealer, small blind, big blind,
and first-to-act buttons to the next set
of players.
"""
function move_buttons!(table::Table)
    players = players_at_table(table)
    dealer = table.buttons.dealer
    dealer       = this_or_next_valid_id(dealer      + 1, players)
    small_blind  = this_or_next_valid_id(dealer      + 1, players)
    big_blind    = this_or_next_valid_id(small_blind + 1, players)
    first_to_act = this_or_next_valid_id(big_blind   + 1, players)
    table.buttons = Buttons(dealer, small_blind, big_blind, first_to_act)
end

"""
    circle_index(n_players, state)

A circular index for indexing into `players`.
`state = 1` corresponds to `player[1]`.
"""
circle_index(n_players, i) = mod(i-1, n_players)+1

any_actions_required(table::Table) = any(action_required.(players_at_table(table)))

abstract type TablePosition end
struct Dealer <: TablePosition end
struct SmallBlind <: TablePosition end
struct BigBlind <: TablePosition end
struct FirstToAct <: TablePosition end # (after BigBlind)

struct CircleTable{CircType,P, NITER}
    players::Tuple
    buttons::Buttons
    n_players::Int
    player::P
end

n_iterations(::CircleTable{CircType,P,NITER}) where {CircType,P,NITER} = NITER

function Base.length(ct::CircleTable)
    n_iter = n_iterations(ct)
    if !(n_iter === Inf)
        return n_iter
    else
        error("CircleTable has an infinite length")
    end
end

circle(table::Table, tp::TablePosition, n_iter = Inf) =
    CircleTable{typeof(tp),Nothing, n_iter}(table.players, buttons(table), length(table.players), nothing)

circle(table::Table, player::Player, n_iter = Inf) =
    CircleTable{typeof(player),typeof(player), n_iter}(table.players, buttons(table), length(table.players), player)


function Base.iterate(ct::CircleTable{Dealer}, state = dealer_id(ct.buttons))
    state > n_iterations(ct)+dealer_id(ct.buttons)-1 && return nothing
    i_circ = circle_index(ct.n_players, state)
    player = ct.players[i_circ]
    state == dealer_id(ct.buttons) && @assert active(player)
    return (player, state+1)
end

function Base.iterate(ct::CircleTable{SmallBlind}, state = small_blind_id(ct.buttons))
    state > n_iterations(ct)+small_blind_id(ct.buttons)-1 && return nothing
    i_circ = circle_index(ct.n_players, state)
    player = ct.players[i_circ]
    state == small_blind_id(ct.buttons) && @assert active(player)
    return (player, state+1)
end

function Base.iterate(ct::CircleTable{BigBlind}, state = big_blind_id(ct.buttons))
    state > n_iterations(ct)+big_blind_id(ct.buttons)-1 && return nothing
    i_circ = circle_index(ct.n_players, state)
    player = ct.players[i_circ]
    state == big_blind_id(ct.buttons) && @assert active(player)
    return (player, state+1)
end

function Base.iterate(ct::CircleTable{FirstToAct}, state = first_to_act_id(ct.buttons))
    state > n_iterations(ct)+first_to_act_id(ct.buttons)-1 && return nothing
    i_circ = circle_index(ct.n_players, state)
    player = ct.players[i_circ]
    state == first_to_act_id(ct.buttons) && @assert active(player)
    return (player, state+1)
end

function Base.iterate(ct::CircleTable{P},
        state = circle_index(ct.n_players, seat_number(ct.player))
    ) where {P <: Player}
    state > n_iterations(ct)+circle_index(ct.n_players, seat_number(ct.player))-1 && return nothing
    i_circ = circle_index(ct.n_players, state)
    player = ct.players[i_circ]
    state == circle_index(ct.n_players, seat_number(ct.player)) && @assert active(player)
    return (player, state+1)
end

show_cards(table::Table, player::Player{Human}) = player.cards
show_cards(table::Table, player::Player{LF}) where {LF <: AbstractAI} = "(??,??)"

#####
##### Deal
#####

function deal!(table::Table, blinds::Blinds)
    players = players_at_table(table)
    shuffle!(table.deck)
    call_blinds = true
    for (i, player) in enumerate(circle(table, SmallBlind()))

        i>length(players) && break # deal cards to each player once

        not_playing(player) && continue

        player.cards = pop!(table.deck, 2)

        if is_small_blind(table, player) && bank_roll(player) ??? blinds.small
            contribute!(table, player, bank_roll(player), call_blinds)
            @info "$(name(player)) paid the small blind (all-in) and dealt cards: $(show_cards(table, player))"
        elseif is_big_blind(table, player) && bank_roll(player) ??? blinds.big
            contribute!(table, player, bank_roll(player), call_blinds)
            @info "$(name(player)) paid the  big  blind (all-in) and dealt cards: $(show_cards(table, player))"
        else
            if is_small_blind(table, player)
                contribute!(table, player, blinds.small, call_blinds)
                @info "$(name(player)) paid the small blind and dealt cards: $(show_cards(table, player))"
            elseif is_big_blind(table, player)
                contribute!(table, player, blinds.big, call_blinds)
                @info "$(name(player)) paid the  big  blind and dealt cards: $(show_cards(table, player))"
            else
                @info "$(name(player)) dealt (free) cards:                   $(show_cards(table, player))"
            end
        end
    end

    table.cards = get_table_cards!(table.deck)
    @info "Table cards dealt (face-down)."
end

