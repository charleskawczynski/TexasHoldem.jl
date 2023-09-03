using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
import Random
const TH = TexasHoldem
import Random

include("tester_bots.jl")
QuietGame(args...; kwargs...) = Game(args...; kwargs..., logger=TH.ByPassLogger())

@testset "Tournament (BotCheckCall)" begin
    players = ntuple(i->Player(BotCheckCall();bank_roll=6), 2)
    game = QuietGame(players)
    tournament!(game)
end
