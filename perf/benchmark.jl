#=
using Revise; include(joinpath("perf", "benchmark.jl"))
=#
import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools
import Logging

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(BotCheckCall(), i)), 4)

# It's not easy to benchmark games without
# also benchmarking the creation/allocation
# of games. We previously did, and they're
# very close in benchmark times.
function do_work!()
    Logging.with_logger(Logging.NullLogger()) do
        play!(Game(players()))
    end
    return nothing
end

trial = @benchmark do_work!()
show(stdout, MIME("text/plain"), trial)
