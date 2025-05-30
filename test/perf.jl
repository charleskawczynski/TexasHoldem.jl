import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using Test
import Random
Random.seed!(1234)

import JET
# Suggested in: https://github.com/aviatesk/JET.jl/issues/455
macro n_failures(ex)
    return :(
        let result = JET.@report_opt $(ex)
            length(JET.get_reports(result.analyzer, result.result))
        end
    )
end

players() = ntuple(i->(Player(TH.FuzzBot(), i)), 4)

function do_work!(game)
    play(game)
    return nothing
end

# Make sure it runs without errors
game = Game(players();logger=TH.ByPassLogger())
do_work!(game)

Random.seed!(1234)
game = Game(players();logger=TH.ByPassLogger())
n_expected_failures = Dict()
n_expected_failures[v"1.9.2"] = 0
n_expected_failures[v"1.9.3"] = 0
n_expected_failures[v"1.8.5"] = 13
nef = get(n_expected_failures, VERSION, minimum(values(n_expected_failures)))
@testset "Inference" begin
    n = @n_failures do_work!(game)
    @test n ≤ nef
    n < nef && @show n
    if n > nef
        JET.@test_opt do_work!(game)
    end
end
