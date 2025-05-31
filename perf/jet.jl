#=
using Revise; include(joinpath("perf", "jet.jl"))
=#
import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools

players() = ntuple(i->(Player(TH.FuzzBot(), i)), 4)

function do_work!(game)
    play(game)
    return nothing
end

# Make sure it runs without errors
game = Game(players();logger=TH.ByPassLogger())
do_work!(game)

import JET
game = Game(players();logger=TH.ByPassLogger())
JET.@test_opt do_work!(game)
