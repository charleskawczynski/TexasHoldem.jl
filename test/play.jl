using Test
using PlayingCards
using TexasHoldem

@testset "Game: Play (invalid number of players)" begin
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 1))
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 11))
end

@testset "Game: Play (BotCheckCall)" begin
    play(Game(ntuple(i->Player(BotCheckCall(), i), 3)))
end

@testset "Game: Play (BotCheckFold)" begin
    play(Game(ntuple(i->Player(BotCheckFold(), i), 3)))
end
