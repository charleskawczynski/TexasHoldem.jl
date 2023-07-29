#=
using Revise;
include("test/fuzz_utils.jl")

to debug cases, use (for example):
fuzz_debug(;fun=tournament!,n_players=10,bank_roll=30,n_games=3788)
where `3788` was found from 
fuzz(;fun=tournament!,n_players=10,bank_roll=30,n_games=10000)

fuzz(; fun = play!, n_players = 3, bank_roll = 200, n_games = 2373)
fuzz_debug(; fun = tournament!, n_players = 3, bank_roll = 6, n_games = 38)
fuzz_debug(; fun = play!, n_players = 3, bank_roll = 200, n_games = 2373)
=#
include("fuzz_utils.jl")

@testset "Game: play! (3 Bot5050's)" begin
    @test isempty(fuzz(;fun=play!,n_players=3, bank_roll=200, n_games=100_000))
end

@testset "Game: play! (10 Bot5050's)" begin
    @test isempty(fuzz(;fun=play!,n_players=10, bank_roll=200, n_games=10_000))
end

@testset "Game: tournament! (2 Bot5050's)" begin
    @test isempty(fuzz(;fun=tournament!,n_players=2, bank_roll=6, n_games=10_000))
    @test isempty(fuzz(;fun=tournament!,n_players=2, bank_roll=30,n_games=100_000))
end

@testset "Game: tournament! (3 Bot5050's)" begin
    @test isempty(fuzz(;fun=tournament!,n_players=3, bank_roll=6,  n_games=10_000))
    @test isempty(fuzz(;fun=tournament!,n_players=3, bank_roll=30, n_games=100_000))
end

@testset "Game: tournament! (10 Bot5050's)" begin
    # https://github.com/charleskawczynski/TexasHoldem.jl/issues/151
    @test isempty(fuzz(;fun=tournament!,n_players=10,bank_roll=30,n_games=3788))
end

@testset "Game: tournament! (10 Bot5050's)" begin
    # https://github.com/charleskawczynski/TexasHoldem.jl/issues/151
    @test isempty(fuzz(;fun=tournament!,n_players=10,bank_roll=30,n_games=3788))
end

