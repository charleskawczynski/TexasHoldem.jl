using Test
using TexasHoldem
using Aqua

@testset "Aqua tests (performance)" begin
    # This tests that we don't accidentally run into
    # https://github.com/JuliaLang/julia/issues/29393
    ua = Aqua.detect_unbound_args_recursively(TexasHoldem)
    @test length(ua) == 0

    # See: https://github.com/SciML/OrdinaryDiffEq.jl/issues/1750
    # Test that we're not introducing method ambiguities across deps
    ambs = Aqua.detect_ambiguities(TexasHoldem; recursive = true)
    @test length(ambs) == 0
end

@testset "Aqua tests" begin
    Aqua.test_all(TexasHoldem)
end

nothing
