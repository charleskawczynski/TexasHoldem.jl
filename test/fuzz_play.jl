using Test
using PlayingCards
using TexasHoldem
import Random
import Logging

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

function get_games(players, n_games)
    return map(1:n_games) do x
        # if x==2098 # useful for debugging games
        #     Game(deepcopy(players);logger=TexasHoldem.StandardLogger())
        # else
            Game(deepcopy(players);logger=TexasHoldem.ByPassLogger())
        # end
    end
end

#=This unfortunately doesn't seem to generate/replay the same exact games=#
function replay_with_debugger(crashes, e;fun,n_players, n_games, bank_roll)
    if !isempty(crashes)
        @show first(crashes)
        Random.seed!(1234)
        players = ntuple(i->Player(Bot5050(), i; bank_roll), n_players)
        games = get_games(players, n_games)
        logger = Logging.ConsoleLogger(stderr,Logging.Debug;meta_formatter=metafmt)
        Logging.with_logger(logger) do
            fun(games[first(crashes)])
        end
    end
    rethrow(e)
end

function fuzz(;fun,n_players, n_games, bank_roll=200)
    Random.seed!(1234)
    players = ntuple(i->Player(Bot5050(), i; bank_roll), n_players)
    # games = map(x->Game(deepcopy(players);logger=TexasHoldem.ByPassLogger()), 1:n_games)
    games = get_games(players, n_games)
    crashes = Int[]
    for n in 1:length(games)
        # try
            game = games[n]
            if game.table.logger isa TexasHoldem.ByPassLogger
                fun(game)
            else
                logger = Logging.ConsoleLogger(stderr,Logging.Debug;meta_formatter=metafmt)
                Logging.with_logger(logger) do
                    fun(game)
                end
            end
        # catch e
        #     push!(crashes, n)
        #     @show first(crashes) # print the n-th game that is failing
        #     # ideally, we would replay the game, but this doesn't seem to work.
        #     # Leaving this commented out in hopes that we can get this working.
        #     replay_with_debugger(crashes, e;fun,n_players, n_games, bank_roll)
        # end
    end
    # @test isempty(crashes)
end

function fuzz_working(;fun,n_players, n_games, bank_roll=200)
    Random.seed!(1234)
    players = ntuple(i->Player(Bot5050(), i; bank_roll), n_players)
    games = map(x->Game(deepcopy(players);logger=TexasHoldem.ByPassLogger()), 1:n_games)
    crashes = Int[]
    for n in 1:length(games)
        try
            fun(games[n])
        catch e
            push!(crashes, n)
            replay_with_debugger(crashes, e;fun,n_players, n_games, bank_roll)
        end
    end
    @test isempty(crashes)
end

@testset "Game: play! (3 Bot5050's)" begin
    fuzz_working(;fun=play!,n_players=3, n_games=100_000)
end

@testset "Game: play! (10 Bot5050's)" begin
    fuzz_working(;fun=play!,n_players=10, n_games=10_000)
end

@testset "Game: tournament! (2 Bot5050's)" begin
    fuzz_working(;fun=tournament!,n_players=2, bank_roll = 6, n_games=10_000)
end

@testset "Game: tournament! (3 Bot5050's)" begin
    fuzz_working(;fun=tournament!,n_players=3, bank_roll = 6, n_games=10_000)
end

@testset "Game: tournament! (10 Bot5050's)" begin
    fuzz(;fun=tournament!,n_players=10, bank_roll = 6, n_games=1_000)
end

#=

This fails:
@testset "Game: tournament! (2 Bot5050's)" begin
    fuzz_working(;fun=tournament!,n_players=2, bank_roll = 30, n_games=10_000)
end

@testset "Game: tournament! (3 Bot5050's)" begin
    fuzz_working(;fun=tournament!,n_players=3, bank_roll = 30, n_games=10_000)
end

@testset "Game: tournament! (10 Bot5050's)" begin
    fuzz(;fun=tournament!,n_players=10, bank_roll = 30, n_games=10_000)
end

=#
