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

# use a counter to avoid benchmarking
# the creation of players and games:
const cntr = Int[1]
function do_work!(games)
    Logging.with_logger(Logging.NullLogger()) do
        play!(games[cntr[1]])
        cntr[]+=1
    end
    return nothing
end

games = map(x->Game(players()), 1:100_000);
trial = @benchmark do_work!($games)
show(stdout, MIME("text/plain"), trial)

# Also benchmark including the
# creation of players and games:
function do_work!()
    Logging.with_logger(Logging.NullLogger()) do
        play!(Game(players()))
    end
    return nothing
end

trial = @benchmark do_work!()
show(stdout, MIME("text/plain"), trial)
