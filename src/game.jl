#####
##### Game
#####

export Game, play

mutable struct Game
    table::Table
end

function Base.show(io::IO, game::Game)
    println(io, "\n----------------------- Poker game")
    show(io, game.table, false)
    for player in players_at_table(game)
        show(io, player, false)
    end
    println(io, "-----------------------")
end

function Game(players::Tuple;
        deck = ordered_deck(),
        table_in = nothing,
        button_id::Int = button_id(),
        blinds::Blinds = Blinds(1,2),
    )

    n_player_cards = sum(map(x->cards(x)==nothing ? 0 : length(cards(x)), players))

    if length(deck) ≠ 52
        # if the deck isn't full, then players should have been dealt cards.
        @assert n_player_cards > 0

        # If the user is specifying the player cards, then the
        # user should probably also handle the table cards too.
        @assert table_in ≠ nothing
        table = table_in
        @assert cards(table) isa Tuple{Card,Card,Card,Card,Card}
        @assert legnth(cards(table)) == 5
        @assert length(deck) + n_player_cards + length(cards(table)) == 52
    else # nobody has been dealt yet
        table = Table(;
            deck=deck,
            players=players,
            button_id=button_id,
            blinds=blinds
        )

        @assert length(deck) == 52
        @assert n_player_cards == 0
        @assert cards(table) == nothing
    end

    return Game(table)
end

players_at_table(game::Game) = players_at_table(game.table)
small_blind(game::Game) = small_blind(players_at_table(game), game.table)
big_blind(game::Game) = big_blind(players_at_table(game), game.table)
blinds(game::Game) = blinds(game.table)
any_actions_required(game::Game) = any_actions_required(game.table)

function act_generic!(game::Game, state::AbstractGameState)
    table = game.table
    table.winners.declared && return # TODO: is this redundant?
    set_state!(game.table, state)
    print_state(game)

    any_actions_required(game) || return
    for player in circle(table, FirstToAct())
        last_to_raise(player) && break
        all_checked_or_folded(table) && break
        all_all_in(table) && break
        !any(action_required.(players_at_table(table))) && break
        folded(player) && continue
        player_option!(game, player)
        table.winners.declared && break
    end
end

function act!(game::Game, state::AbstractGameState)
    act_generic!(game, state)
    reset_round!(game.table)
end

function act!(game::Game, state::River)
    act_generic!(game, state)
    declare_winners!(game.table)
end

"""
    play(::Game)

Play a game. Note that this method
expects no cards (players and table)
to be dealt.
"""
function play(game::Game; debug = false)
    table = game.table
    players = players_at_table(table)

    table.transactions = TransactionManager(players)

    @assert all(cards.(players) .== nothing)
    @assert cards(table) == nothing
    deal!(table, blinds(table))
    @assert cards(table) ≠ nothing

    winners = table.winners

    winners.declared || act!(game, PreFlop())   # Pre-flop bet/check/raise
    winners.declared || act!(game, Flop())      # Deal flop , then bet/check/raise
    winners.declared || act!(game, Turn())      # Deal turn , then bet/check/raise
    winners.declared || act!(game, River())     # Deal river, then bet/check/raise
    return winners
end

