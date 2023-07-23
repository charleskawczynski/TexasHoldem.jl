using Test
using PlayingCards
using TexasHoldem
import Random
import Logging

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

#=
Make a collection of games, run them,
and if any fail, return the indices of
the games that fail. This is helpful
to enforce tests that work.
=#
function fuzz(;fun, n_players, n_games, bank_roll=200)
    Random.seed!(1234)
    players = ntuple(i->Player(Bot5050(), i; bank_roll=bank_roll), n_players)
    games = map(x-> Game(deepcopy(players);logger=TexasHoldem.ByPassLogger()), 1:n_games)
    crashes = Int[]
    for n in 1:length(games)
        try
            fun(games[n])
        catch
            push!(crashes, n)
        end
    end
    return crashes
end

function get_games(; n_games, crashes, players)
    return map(1:n_games) do x
        logger = x in crashes ? TexasHoldem.InfoLogger() : TexasHoldem.ByPassLogger()
        Game(deepcopy(players);logger=logger)
    end
end

#=
Run a collection of games, if they fail,
re-run the exact same collection, except:
swap the logger to debug level for the
indices that fail.
=#
function fuzz_debug(;fun,n_players, n_games, bank_roll=200)
    crashes = fuzz(;fun,n_players, n_games, bank_roll)
    Random.seed!(1234)
    players = ntuple(i->Player(Bot5050(), i; bank_roll), n_players)
    @time begin
        games = get_games(; n_games, crashes, players)
    end
    for n in 1:length(games)
        try
            game = games[n]
            if game.table.logger isa TexasHoldem.ByPassLogger
                fun(game)
            else
                logger = Logging.ConsoleLogger(stderr,Logging.Debug;meta_formatter=metafmt)
                Logging.with_logger(logger) do
                    fun(game)
                end
            end
        catch e
            rethrow(e)
            break
        end
    end
    error("Caught and printed debug info, n_crashes found: $(length(crashes))")
    return crashes
end
