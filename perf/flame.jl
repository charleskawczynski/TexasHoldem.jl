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

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(Bot5050(), i)), 4)

function do_work!(games)
    Logging.with_logger(Logging.NullLogger()) do
        for game in games
            play!(game)
        end
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
