using Test
using PlayingCards
using NoLimitHoldem
NLH = NoLimitHoldem

@testset "Game: Play (3 BotRandom's)" begin
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)

    play(game)
end

@testset "Game: Play (BotSitOut)" begin
    players = (
        NLH.Player(BotSitOut(), 1),
        NLH.Player(BotRandom(), 2),
        NLH.Player(BotRandom(), 3),
    )
    game = Game(players)
    play(game)
end

@testset "Game: Play (BotCheckFold)" begin
    players = (
        NLH.Player(BotCheckFold(), 1),
        NLH.Player(BotCheckFold(), 2),
        NLH.Player(BotCheckFold(), 3),
    )
    game = Game(players)
    play(game)
end
