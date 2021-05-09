using Test
using PlayingCards
using TexasHoldem
TH = TexasHoldem

@testset "Game: show" begin
    players = ntuple(2) do i
        Player(Bot5050(), i)
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
        Player(Bot5050(), i, pop!(deck, 2))
    end
    table = Table(;players=players,deck=deck,cards=pop!(deck, 5))
    game = Game(players;deck=deck,table=table)
end

@testset "Game: contrived game" begin
    players = ntuple(3) do i
        Player(Bot5050(), i)
    end
    game = Game(players)
    players = TH.players_at_table(game)
    TH.deal!(game.table, TH.blinds(game.table))
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
        Player(Bot5050(), i)
    end
    game = Game(players)
    players = TH.players_at_table(game)
    TH.deal!(game.table, TH.blinds(game.table))
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    raise_to!(game, players[1], players[1].bank_roll)
    call!(game, players[2])

    @test_throws AssertionError("Invalid raise amount") raise_to!(game, players[1], 10000)
end

