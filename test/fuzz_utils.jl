using Test
using PlayingCards
using TexasHoldem
const TH = TexasHoldem
import Random
import Logging

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

function seeded_game(; fun, n_games, players)
    Random.seed!(1234)
    games = map(x->Game(deepcopy(players);logger=TexasHoldem.ByPassLogger(), gui=TH.NoGUI()), 1:n_games)
    for n in 1:length(games)
        game = games[n]
        fun(game)
    end
    return games
end

#=
Make a collection of games, run them,
and if any fail, return the indices of
the games that fail. This is helpful
to enforce tests that work.
=#
function fuzz(;fun, n_players, n_games, bank_roll=200)
    Random.seed!(1234)
    players = ntuple(i->Player(TH.FuzzBot(), i; bank_roll=bank_roll), n_players)
    return fuzz_given_players(;fun, n_games, players)
end

function fuzz_given_players(;fun, n_games, players)
    Random.seed!(1234)
    games = map(x-> Game(deepcopy(players);logger=TH.ByPassLogger(), gui=TH.NoGUI()), 1:n_games)
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
        Game(deepcopy(players);logger=logger, gui=TH.NoGUI())
    end
end

#=
Run a collection of games, if they fail,
re-run the exact same collection, except:
swap the logger to debug level for the
indices that fail.
=#
function fuzz_debug(;fun,n_players, n_games, bank_roll=200)
    players = ntuple(i->Player(TH.FuzzBot(), i; bank_roll=bank_roll), n_players)
    fuzz_given_players_debug(;fun,n_games, players)
end

function fuzz_given_players_debug(;fun,n_games, players)
    crashes = fuzz_given_players(;fun=fun,players=deepcopy(players), n_games=n_games)
    Random.seed!(1234)
    @time begin
        games = get_games(; n_games=n_games, crashes=crashes, players=deepcopy(players))
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
