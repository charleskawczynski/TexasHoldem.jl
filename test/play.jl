using Test
using PlayingCards
using TexasHoldem
TH = TexasHoldem

@testset "Game: Play (invalid number of players)" begin
    @test_throws AssertionError Game(ntuple(i->TH.Player(BotRandom(), i), 1))
    @test_throws AssertionError Game(ntuple(i->TH.Player(BotRandom(), i), 11))
end

@testset "Game: Play (BotCheckCall)" begin
    play(Game(ntuple(i->TH.Player(BotCheckCall(), i), 3)))
end

@testset "Game: Play (BotCheckFold)" begin
    play(Game(ntuple(i->TH.Player(BotCheckFold(), i), 3)))
end

@testset "Game: Play (BotSitOut)" begin
    players = (
        TH.Player(BotSitOut(), 1),
        TH.Player(BotRandom(), 2),
        TH.Player(BotRandom(), 3),
    )
    play(Game(players))
end

@testset "Game: Play (3 BotRandom's)" begin
    for n in 1:100
        play(Game(ntuple(i->TH.Player(BotRandom(), i), 3)))
    end
end

@testset "Game: Play (10 BotRandom's)" begin
    play(Game(ntuple(i->TH.Player(BotRandom(), i), 10)))
end
