#=
using Revise; include(joinpath("perf", "benchmark.jl"))
=#
import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools
import Logging
import Random
Random.seed!(1234)

players() = ntuple(i->(Player(TH.FuzzBot(), i)), 4)

# It's not easy to benchmark games without
# also benchmarking the creation/allocation
# of games. We previously did, and they're
# very close in benchmark times.
function do_work!()
    play!(Game(players();gui=TH.NoGUI(), logger=TH.ByPassLogger()))
    return nothing
end

trial = @benchmark do_work!()
show(stdout, MIME("text/plain"), trial)
