using Test
using PlayingCards
using TexasHoldem
TH = TexasHoldem

@testset "Players" begin
    players = (
        TH.Player(Human(), 1),
        TH.Player(BotRandom(), 2),
    )
    @test TH.name(players[1]) == "Human[1]"
    @test TH.name(players[2]) == "BotRandom[2]"
    @test TH.cards(players[1]) == players[1].cards
    @test TH.cards(players[2]) == players[2].cards
end
