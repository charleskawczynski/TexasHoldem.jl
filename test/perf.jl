import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using Test

import JET
# Suggested in: https://github.com/aviatesk/JET.jl/issues/455
macro n_failures(ex)
    return :(
        let result = JET.@report_opt $(ex)
            length(JET.get_reports(result.analyzer, result.result))
        end
    )
end

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

game = Game(players();logger=TH.ByPassLogger())
n_expected_failures = Dict()
n_expected_failures[v"1.9.2"] = 4
n_expected_failures[v"1.8.5"] = 15
nef = get(n_expected_failures, VERSION, 15)
@testset "Inference" begin
    n = @n_failures do_work!(game)
    @test n ≤ nef
    @test_broken n < nef
end
