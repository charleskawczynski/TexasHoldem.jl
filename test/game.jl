using Test
using PlayingCards
using NoLimitHoldem
NLH = NoLimitHoldem

@testset "Game: show" begin
    players = ntuple(2) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    sprint(show, game)

    game.table.state = PreFlop()
    sprint(show, game)
end

@testset "Game: pre-dealt deck" begin
    deck = ordered_deck()
    shuffle!(deck)
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i, pop!(deck, 2))
    end
    table = Table(;players=players,deck=deck,cards=pop!(deck, 5))
    game = Game(players;deck=deck,table=table)
end

@testset "Game: contrived game" begin
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    players = NLH.players_at_table(game)
    NLH.deal!(game.table, NLH.blinds(game.table))
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    check!(game, players[1])
    check!(game, players[2])

    # Round 3
    raise_to!(game, players[1], 10)
    call!(game, players[2])

    # Round 4
    raise_to!(game, players[1], 20)
    fold!(game, players[2])

    # All-in cases
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    players = NLH.players_at_table(game)
    NLH.deal!(game.table, NLH.blinds(game.table))
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    raise_to!(game, players[1], players[1].bank_roll)
    call!(game, players[2])

    @test_throws AssertionError raise_to!(game, players[1], 10000) # raise exceeds bank roll!
end

