using Test
using NoLimitHoldem
const NLH = NoLimitHoldem

@testset "Suit" begin
    @test ♣ == NLH.Club()
    @test ♠ == NLH.Spade()
    @test ♡ == NLH.Heart()
    @test ♢ == NLH.Diamond()
    @test string(2♣) == "2♣"
    @test string(J♣) == "J♣"
    @test string(Q♣) == "Q♣"
    @test string(K♣) == "K♣"
    @test string(A♣) == "A♣"
end

@testset "Ranks" begin
    for r in 2:10
        Tr = typeof(NLH.NumberCard(r))
        @test NLH.value(Tr) == NLH.low_value(Tr) == r
    end
    r = NLH.Jack();  Tr = typeof(r); @test NLH.value(Tr) == NLH.low_value(Tr) == 11
    r = NLH.Queen(); Tr = typeof(r); @test NLH.value(Tr) == NLH.low_value(Tr) == 12
    r = NLH.King();  Tr = typeof(r); @test NLH.value(Tr) == NLH.low_value(Tr) == 13

    r = NLH.Ace()
    Tr = typeof(r)
    @test NLH.value(Tr) == 14
    @test NLH.low_value(Tr) == 1
end

@testset "Card" begin
    @test NLH.rank_type(typeof(J♣)) == NLH.Jack
    @test NLH.suit_type(typeof(J♣)) == NLH.Club
    @test NLH.rank_type(J♣) == NLH.Jack
    @test NLH.suit_type(J♣) == NLH.Club
    @test NLH.rank(J♣) == NLH.Jack()
    @test NLH.suit(J♣) == NLH.Club()
    @test sprint(show, 2♣) == "2♣"
    @test sprint(show, J♣) == "J♣"
end

