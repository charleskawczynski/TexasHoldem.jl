using Test
using PlayingCards
using NoLimitHoldem
NLH = NoLimitHoldem

@testset "Players" begin
    players = (
        NLH.Player(Human(), 1),
        NLH.Player(BotRandom(), 2),
    )
    @test NLH.name(players[1]) == "Human[1]"
    @test NLH.name(players[2]) == "BotRandom[2]"
    @test NLH.cards(players[1]) == players[1].cards
    @test NLH.cards(players[2]) == players[2].cards
end
