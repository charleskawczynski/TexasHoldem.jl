#=
using Revise; include(joinpath("perf", "flame.jl"))
=#
import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools
import Logging
import Random
Random.seed!(1234)

players() = ntuple(i->(Player(Bot5050(), i)), 4)

function do_work!(games)
    for game in games
        play!(game)
    end
    return nothing
end

import Profile
import ProfileCanvas

games = map(x->Game(players();logger=TH.ByPassLogger()), 1:100_000);
do_work!(games) # compile first

Random.seed!(1234) # reset seed

games = map(x->Game(players();logger=TH.ByPassLogger()), 1:100_000);
Profile.clear()
prof = Profile.@profile begin
    do_work!(games)
end

results = Profile.fetch()
Profile.clear()
ProfileCanvas.html_file(joinpath("perf", "flame.html"), results)
