#####
##### Game
#####

export Game, play
export Deal, PayBlinds, Flop, Turn, River
export move_button!

abstract type AbstractGameState end
struct Deal <: AbstractGameState end
struct PayBlinds <: AbstractGameState end
struct Flop <: AbstractGameState end
struct Turn <: AbstractGameState end
struct River <: AbstractGameState end

mutable struct Table{C, P}
    cards::C
    pot::P
    state::AbstractGameState
    button_id::Int
end

function Base.show(io::IO, table::Table, include_type = true)
    include_type && println(io, typeof(table))
    println(io, "Button           = $(table.button_id)")
    println(io, "Pot              = $(table.pot)")
    println(io, "All cards        = $(table.cards)")
    println(io, "Observed cards   = $(observed_cards(table))")
end

Table(cards::Tuple) = Table(cards, 0, Deal(), 1)
Table!(deck::Deck) =
    Table(Iterators.flatten(ntuple(i->pop!(deck, 1), 5)) |> collect |> Tuple)

observed_cards(table::Table) = observed_cards(table, table.state)
observed_cards(table::Table, ::Deal) = ()
observed_cards(table::Table, ::PayBlinds) = ()
observed_cards(table::Table, ::Flop) = table.cards[1:3]
observed_cards(table::Table, ::Turn) = table.cards[1:4]
observed_cards(table::Table, ::River) = table.cards

struct Blinds{S,B}
    small::S
    big::B
end

Base.@kwdef mutable struct Winners
    declared::Bool = false
    players::Union{Nothing,Tuple,Player} = nothing
end

function Base.show(io::IO, winners::Winners, include_type = true)
    include_type && println(io, typeof(winners))
    println(io, "Winners declared = $(winners.declared)")
    println(io, "Winners          = $(winners.players)")
end

mutable struct Game
    state::AbstractGameState
    table::Table
    players::Tuple
    blinds::Blinds
    winners::Winners
    current_raise_amt::Float64
end

function Base.show(io::IO, blinds::Blinds, include_type = true)
    include_type && println(io, typeof(blinds))
    println(io, "Blinds           = (small=$(blinds.small),big=$(blinds.big))")
end

function Base.show(io::IO, player::Player, include_type = true)
    include_type && println(io, typeof(player))
    println(io, "Player[$(player.id)]        = $(player.cards)")
end

function Base.show(io::IO, game::Game)
    println(io, "\n----------------------- Poker game")
    show(io, game.blinds, false)
    show(io, game.table, false)
    for player in game.players
        show(io, player, false)
    end
    show(io, game.winners, false)
    println(io, "-----------------------")
end

function Game(;
        deck,
        players,
        blinds::Blinds = Blinds(1,2),
        winners::Winners = Winners()
    )
    table = Table!(deck)
    state = table.state
    targs = (table, players, blinds, winners)
    current_raise_amt = 0
    args = (state, table, players, blinds, winners, current_raise_amt)
    return Game(args...)
end

folded(player::Player) = player.folded
action_history(player::Player) = player.action_history
n_players(game::Game) = length(game.players)

function declare_winners!(game::Game)
    fhe = map(game.players) do player
        FullHandEval((player.cards..., observed_cards(game.table)...))
    end

    hr = hand_rank.(fhe)
    @show hand_type.(fhe)
    @show hand_rank.(fhe)
    @show best_cards.(fhe)

    min_hr = min(hr...)
    game.winners.players = filter(game.players) do player
        hr[player.id] == min_hr
    end
    game.winners.declared = true
    game.current_raise_amt = 0
end

function check_for_winner!(game)
    game.winners.declared = count(folded.(game.players)) == n_players(game)-1
    if game.winners.declared
        for player in game.players
            folded(player) && continue
            game.winners.players = player
        end
    end
end

move_button!(game::Game) = move_button!(game.table, game.players)

"""
    move_button!(table::Table)

Move the button to the next player on
the table.
"""
function move_button!(table::Table, players)
    table.button_id = mod(table.button_id, length(players))+1
end


"""
    action_id(n_players, button_id, state)

The player ID whose action it is, given
 - `state` the global iteration state (starting from 1)
 - `n_players` the total number of players
 - `button_id` the dealer ID (from `1:n_players`)
"""
action_id(n_players, button_id, state) =
    mod(state + button_id+1, n_players)+1

action_id(game::Game, state) =
    action_id(length(game.players), game.table.button_id, state)

acting_player(game::Game, state) =
    game.players[action_id(game, state)]

any_actions_required(game::Game) =
    any(map(player -> player.action_required, game.players))

player_button_star(table::Table, player::Player) =
    table.button_id == player.id ? "*" : ""

small_blind(game::Game) = game.players[action_id(game, -1)]
big_blind(game::Game) = game.players[action_id(game, 0)]
blinds(game::Game) = game.blinds

function reset_actions_required!(game::Game)
    for player in game.players
        folded(player) && continue
        player.action_required = true
    end
    game.current_raise_amt = 0
end

function set_state!(game::Game, state::AbstractGameState)
    game.state = state
    game.table.state = state
end

function act_generic!(game::Game, state::AbstractGameState)
    game.winners.declared && return # TODO: is this redundant?
    set_state!(game, state)
    print_state(game)

    # TODO: incorporate winners.declared into logic

    any_actions_required(game) || return
    i = 1
    while any_actions_required(game)
        player = acting_player(game, i)
        folded(player) || player_option!(game, player)
        game.winners.declared && break
        i+=1
    end
end

function act!(game::Game, state::AbstractGameState)
    act_generic!(game, state)
    reset_actions_required!(game)
end

function act!(game::Game, state::River)
    act_generic!(game, state)
    declare_winners!(game)
end

function act!(game::Game, state::PayBlinds)
    set_state!(game, state)
    # Always call blinds:
    call!(game, small_blind(game), blinds(game).small)
    call!(game, big_blind(game), blinds(game).big)
    print_state(game)
    reset_actions_required!(game)
end

function play(game::Game)
    # TODO: deal cards here instead of cards dealt into Game before play
    # Also: Players who cannot afford the blinds are all-in, which is likely
    # not caught here.
    # @assert all(cards.(game.players) .== nothing)
    act!(game, Deal())      # Deal player cards, then bet/check/raise based on player cards
    act!(game, PayBlinds()) #
    game.winners.declared || act!(game, Flop())      # Deal flop        , then bet/check/raise based on flop
    game.winners.declared || act!(game, Turn())      # Deal turn        , then bet/check/raise based on turn
    game.winners.declared || act!(game, River())     # Deal river       , then bet/check/raise based on river
    return game.winners
end

