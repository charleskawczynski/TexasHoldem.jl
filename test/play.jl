using Test
using PlayingCards
using NoLimitHoldem
NLH = NoLimitHoldem

@testset "Game: Play (invalid number of players)" begin
    @test_throws AssertionError Game(ntuple(i->NLH.Player(BotRandom(), i), 1))
    @test_throws AssertionError Game(ntuple(i->NLH.Player(BotRandom(), i), 11))
end

@testset "Game: Play (BotCheckCall)" begin
    play(Game(ntuple(i->NLH.Player(BotCheckCall(), i), 3)))
end

@testset "Game: Play (BotCheckFold)" begin
    play(Game(ntuple(i->NLH.Player(BotCheckFold(), i), 3)))
end

@testset "Game: Play (BotSitOut)" begin
    players = (
        NLH.Player(BotSitOut(), 1),
        NLH.Player(BotRandom(), 2),
        NLH.Player(BotRandom(), 3),
    )
    play(Game(players))
end

@testset "Game: Play (3 BotRandom's)" begin
    for n in 1:100
        play(Game(ntuple(i->NLH.Player(BotRandom(), i), 3)))
    end
end

@testset "Game: Play (10 BotRandom's)" begin
    play(Game(ntuple(i->NLH.Player(BotRandom(), i), 10)))
end
