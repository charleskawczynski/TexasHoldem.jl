#=
using Revise; include(joinpath("perf", "jet.jl"))
=#
import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(BotCheckCall(), i)), 4)

function do_work!(game)
    play!(game)
    return nothing
end

# Make sure it runs without errors
game = Game(players();logger=TH.ByPassLogger())
do_work!(game)

import JET
game = Game(players();logger=TH.ByPassLogger())
JET.@test_opt do_work!(game)
