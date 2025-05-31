#=
using Revise; include("test/fuzz_utils.jl")
@eval Main using TexasHoldem # don't qualify types in log
@eval Main using TexasHoldem:SidePot # don't qualify types in log

to debug cases, use (for example):
fuzz_debug(;fun=tournament!,n_players=10,bank_roll=30,n_games=3788)
where `3788` was found from 
fuzz(;fun=tournament!,n_players=10,bank_roll=30,n_games=10000)

players = (
    Player(TH.FuzzBot(), 1; bank_roll=9),
    Player(TH.FuzzBot(), 2; bank_roll=5),
    Player(TH.FuzzBot(), 3; bank_roll=4),
)
fuzz_given_players_debug(;fun=play, players, n_games=138)
fuzz_debug(; fun = tournament!, n_players = 10, bank_roll = 30, n_games = 1310)
fuzz_debug(; fun = tournament!, n_players = 2, bank_roll = 6, n_games = 1)
fuzz_debug(; fun = tournament!, n_players = 3, bank_roll = 6, n_games = 38)
fuzz_debug(; fun = play, n_players = 3, bank_roll = 200, n_games = 2373)
=#
include("fuzz_utils.jl")

@testset "Game: play (3 FuzzBot's)" begin
    @test isempty(fuzz(;fun=play,n_players=3, bank_roll=200, n_games=100_000))
end

@testset "Game: play (10 FuzzBot's)" begin
    @test isempty(fuzz(;fun=play,n_players=10, bank_roll=200, n_games=10_000))
end

@testset "Game: play (3 FuzzBot's)" begin
    players = (
        Player(TH.FuzzBot(), 1; bank_roll=9),
        Player(TH.FuzzBot(), 2; bank_roll=5),
        Player(TH.FuzzBot(), 3; bank_roll=4),
    )
    @test isempty(fuzz_given_players(;fun=play, players, n_games=10_000))
end

@testset "Game: tournament! (2 FuzzBot's)" begin
    @test isempty(fuzz(;fun=tournament!,n_players=2, bank_roll=6, n_games=10_000))
    @test isempty(fuzz(;fun=tournament!,n_players=2, bank_roll=30,n_games=100_000))
end

@testset "Game: tournament! (3 FuzzBot's)" begin
    @test isempty(fuzz(;fun=tournament!,n_players=3, bank_roll=6,  n_games=10_000))
    @test isempty(fuzz(;fun=tournament!,n_players=3, bank_roll=30, n_games=100_000))
end

@testset "Game: tournament! (10 FuzzBot's)" begin
    # https://github.com/charleskawczynski/TexasHoldem.jl/issues/151
    @test isempty(fuzz(;fun=tournament!,n_players=10,bank_roll=30,n_games=3788))
end

@testset "Fuzz for seat number player index orthogonality" begin
    # seat number should not affect games?
    n_games = 1000
    n_players = 10
    br = 30
    rperm = Random.randperm(n_players)
    games1 = seeded_game(;fun=play, n_games, players =
            ntuple(i->Player(TH.FuzzBot(), i; bank_roll=br), n_players))
    games2 = seeded_game(;fun=play, n_games, players =
            ntuple(i->Player(TH.FuzzBot(), rperm[i]; bank_roll=br), n_players))

    for (g1, g2) in zip(games1, games2)
        for (p1, p2) in zip(g1.table.players, g2.table.players)
            @test bank_roll(p1) == bank_roll(p2)
        end
    end
end
