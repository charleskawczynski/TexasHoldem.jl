using Test
using PlayingCards
using TexasHoldem
const TH = TexasHoldem

QuietGame(args...; kwargs...) = Game(args...; kwargs..., logger=TH.ByPassLogger())

@testset "Game: show" begin
    players = ntuple(2) do i
        Player(Bot5050(), i)
    end
    game = QuietGame(players)
    sprint(show, game)

    game.table.stage = PreFlop()
    sprint(show, game)
end

@testset "Game: pre-dealt deck" begin
    deck = PlayingCards.MaskedDeck()
    shuffle!(deck)
    players = ntuple(3) do i
        Player(Bot5050(), i, pop!(deck, Val(2)))
    end
    game = QuietGame(players;deck=deck,cards=pop!(deck, Val(5)))
end

@testset "Game: contrived game" begin
    players = ntuple(3) do i
        Player(Bot5050(), i)
    end
    game = QuietGame(players)
    players = TH.players_at_table(game)
    TH.deal!(game.table, TH.blinds(game.table))
    # Round 1
    TH.check!(game, players[1])
    TH.check!(game, players[2])
    TH.fold!(game, players[3])

    # Round 2
    TH.check!(game, players[1])
    TH.check!(game, players[2])

    # Round 3
    TH.raise_to!(game, players[1], 10)
    @test TH.checked(players[1]) == false
    TH.call!(game, players[2])

    # Round 4
    TH.raise_to!(game, players[1], 20)
    @test TH.checked(players[1]) == false
    TH.fold!(game, players[2])

    # All-in cases
    players = ntuple(3) do i
        Player(Bot5050(), i)
    end
    game = QuietGame(players)
    players = TH.players_at_table(game)
    TH.deal!(game.table, TH.blinds(game.table))
    # Round 1
    TH.check!(game, players[1])
    TH.check!(game, players[2])
    TH.fold!(game, players[3])

    # Round 2
    TH.raise_to!(game, players[1], players[1].bank_roll)
    @test TH.checked(players[1]) == false
    TH.call!(game, players[2])

    @test_throws AssertionError TH.raise_to!(game, players[1], 10000) # raise exceeds bank roll!
end

