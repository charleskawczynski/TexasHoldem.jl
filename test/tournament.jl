using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
import Random
const TH = TexasHoldem
import Random

include("tester_bots.jl")
QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())
DebugGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.DebugLogger())

@testset "Tournament (BotCheckCall)" begin
    players = ntuple(i->Player(BotCheckCall();bank_roll=6), 2)
    game = QuietGame(players)
    tournament!(game)
end
