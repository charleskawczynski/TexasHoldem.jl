#####
##### Game
#####

export Game, play
export Deal, PayBlinds, Flop, Turn, River
export Fold, Check, Call, Raise
export move_button!
export fold!, check!, raise!, call!

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

abstract type AbstractAction end
struct Fold <: AbstractAction end
struct Check <: AbstractAction end
struct Call{T} <: AbstractAction
    amt::T
end
struct Raise{T} <: AbstractAction
    amt::T
end

abstract type AbstractPlayer end
struct Nobody <: AbstractPlayer end

mutable struct Player{ID,C,BR,AH,AR,AI} <: AbstractPlayer
    id::ID
    cards::C
    bank_roll::BR
    action_history::AH
    action_required::AR
    all_in::AI
end

function Player(id, cards)
    bank_roll = 200
    action_history = AbstractAction[]
    action_required = true
    all_in = false
    args = (id, cards, bank_roll, action_history, action_required, all_in)
    Player{typeof.(args)...}(args...)
end

struct Blinds{S,B}
    small::S
    big::B
end

mutable struct Winners{D<:Bool,P<:AbstractPlayer}
    declared::D
    players::P
end

function Base.show(io::IO, winners::Winners, include_type = true)
    include_type && println(io, typeof(winners))
    println(io, "Winners declared = $(winners.declared)")
    println(io, "Winners          = $(winners.players)")
end

mutable struct Game{T,P,B,W}
    state::AbstractGameState
    table::T
    players::P
    blinds::B
    winners::W
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
        deck = ordered_deck(),
        n_players::Int = 2,
        blinds::Blinds = Blinds(1,2),
        winners::Winners = Winners(false, Nobody())
    )
    shuffle!(deck)
    players = ntuple(n_players) do i
        Player(i, pop!(deck, 2))
    end
    table = Table!(deck)
    state = table.state
    targs = (table, players, blinds, winners)
    args = (state, table, players, blinds, winners)
    return Game{typeof.(targs)...}(args...)
end

function fold!(game::Game, player::Player)
    push!(player.action_history, Fold())
    player.action_required = false
end
function check!(game::Game, player::Player)
    push!(player.action_history, Check())
    player.action_required = false
end
function call!(game::Game, player::Player, amt)
    push!(player.action_history, Call(amt))
    player.action_required = false

    if player.bank_roll > amt
        player.bank_roll -= amt
        game.table.pot += amt
    else
        player.bank_roll = 0
        game.table.pot += player.bank_roll
        player.all_in = true
    end
end
function raise!(game::Game, player::Player, amt)
    if player.bank_roll >= amt
        player.bank_roll -= amt
        game.table.pot += amt
        player.bank_roll == amt && (player.all_in = true)
    else
        msg1 = "Player $(player.id) has insufficient bank"
        msg2 = "roll ($(player.bank_roll)) to add $amt to pot."
        error(msg1*msg2)
    end

    push!(player.action_history, Raise(amt))
    player.action_required = false
    for oponent in game.players
        oponent.id == player.id && continue
        last(oponent.action_history) isa Fold && continue
        oponent.action_required = true
    end
end

move_button!(game::Game) = move_button!(game.table, game.players)

"""
    move_button!(table::Table)

Move the button around the table
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
        player.action_required = true
    end
end

function act!(game::Game, player::Player)
    check!(game, player) # Check for now
end

function set_state!(game::Game, state::AbstractGameState)
    game.state = state
    game.table.state = state
end

function act_generic!(game::Game, state::AbstractGameState)
    set_state!(game, state)
    print_state(game)
    any_actions_required(game) || return
    i = 1
    while any_actions_required(game)
        act!(game, acting_player(game, i))
        i+=1
    end
end

function act!(game::Game, state::AbstractGameState)
    act_generic!(game, state)
    reset_actions_required!(game)
end

function act!(game::Game, state::River)
    act_generic!(game, state)
    # game.winners = top_hand
end

function act!(game::Game, state::PayBlinds)
    set_state!(game, state)
    # Always call blinds:
    call!(game, small_blind(game), blinds(game).small)
    call!(game, big_blind(game), blinds(game).big)
    print_state(game)
end

function play(game::Game)
    act!(game, Deal())      # Deal player cards, then bet/check/raise based on player cards
    act!(game, PayBlinds()) #
    act!(game, Flop())      # Deal flop        , then bet/check/raise based on flop
    act!(game, Turn())      # Deal turn        , then bet/check/raise based on turn
    act!(game, River())     # Deal river       , then bet/check/raise based on river
    return game.winners
end

