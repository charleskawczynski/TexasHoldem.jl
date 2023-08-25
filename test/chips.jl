using TexasHoldem
using Test

@testset "Chips" begin
    a = Chips(1, 0//1)
    b = Chips(2, 3//2)
    @test a + b == Chips(4, 1//2)
end