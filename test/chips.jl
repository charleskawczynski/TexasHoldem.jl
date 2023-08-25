using TexasHoldem
using Test

@testset "SimpleRatio" begin
    @test SimpleRatio(0, 1) == SimpleRatio(0, 2)
end

@testset "Chips" begin
    a = Chips(1, SimpleRatio(0, 1))
    b = Chips(2, SimpleRatio(3, 2))
    @test a + b == Chips(4, SimpleRatio(1, 2))
    @test Chips(12, SimpleRatio(0, 1)) == Chips(12, SimpleRatio(0, 2))
end
