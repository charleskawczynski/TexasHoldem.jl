using Test
using NoLimitHoldem
using Combinatorics
using BenchmarkTools
const NLH = NoLimitHoldem

@testset "Recurse type" begin
    @test NLH.recurse_up(2♣) == 12

    @test NLH.type_up(2♣, 1) == NLH.NumberCard{3}
    @test NLH.type_dn(A♣, 1) == NLH.King
end

@testset "Card eval helpers" begin

    # From the table:
    @test NLH.quads_base(NLH.Ace) == 11
    @test NLH.quads_base(NLH.King) == 23
    @test NLH.quads_base(NLH.Queen) == 35
    @test NLH.quads_base(NLH.Jack) == 47
    @test NLH.quads_base(NLH.NumberCard{10}) == 59
    @test NLH.quads_base(NLH.NumberCard{9}) == 71
    @test NLH.quads_base(NLH.NumberCard{8}) == 83
    @test NLH.quads_base(NLH.NumberCard{7}) == 95
    @test NLH.quads_base(NLH.NumberCard{6}) == 107
    @test NLH.quads_base(NLH.NumberCard{5}) == 119
    @test NLH.quads_base(NLH.NumberCard{4}) == 131
    @test NLH.quads_base(NLH.NumberCard{3}) == 143
    @test NLH.quads_base(NLH.NumberCard{2}) == 155
    @test_throws ErrorException NLH.single_kicker_iter(Ace, Ace)

    # For debugging:
    debug = false
    if debug
        for r in NLH.rank_list[end:-1:1]
            @show string(r), NLH.quads_base(typeof(r))
        end
        s_readability = "(string(r), string(rk), NLH.single_kicker_iter(typeof(r), typeof(rk))) = "
        for r in NLH.rank_list[end:-1:1]
            for rk in NLH.rank_list[end:-1:1]
                rk == r && (println(s_readability); continue)
                @show string(r), string(rk), NLH.single_kicker_iter(typeof(r), typeof(rk))
            end
            println()
        end
    end
end

@testset "trips_base" begin
    @test NLH.trips_base(Ace) == 1610
    @test NLH.trips_base(King) == 1610+66
    @test NLH.trips_base(Queen) == 1610+66*2
    @test NLH.trips_base(Jack) == 1610+66*3
    k = 4
    for i in 10:-1:2
        @test NLH.trips_base(NumberCard{i}) == 1610+66*k
        k+=1
    end
end
