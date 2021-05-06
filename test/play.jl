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
