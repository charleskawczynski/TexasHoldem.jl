import Logging

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

submodules = [
    "players",
    "transactions",
    "call_raise_validation",
    "human_player_option",
    "table",
    "game",
    "play",
    "fuzz_play",
    "reproducibility",
]

tests_to_debug = ["play", "fuzz_play"]
# tests_to_debug = submodules

for submodule in submodules
    println("Starting tests for $submodule")
    t = 0
    local logger
    if any(submodule in tests_to_debug)
        logger = Logging.ConsoleLogger(stderr,Logging.Info)
        # logger = ConsoleLogger(stderr,Logging.Debug;meta_formatter=metafmt)
    else
        logger = Logging.NullLogger()
    end
    Logging.with_logger(logger) do
        t = @elapsed include(submodule*".jl")
    end
    println("Completed tests for $submodule, $(round(Int, t)) seconds elapsed")
end
