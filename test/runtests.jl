using Logging

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

submodules = [
    "players",
    "transactions",
    "table",
    "game",
    "play",
]

tests_to_debug = ["play"]
# tests_to_debug = submodules

for submodule in submodules
    println("Starting tests for $submodule")
    t = 0
    local logger
    if any(submodule in tests_to_debug)
        logger = ConsoleLogger(stderr,Logging.Info)
        # logger = ConsoleLogger(stderr,Logging.Debug;meta_formatter=metafmt)
    else
        logger = NullLogger()
    end
    with_logger(logger) do
        t = @elapsed include(submodule*".jl")
    end
    println("Completed tests for $submodule, $(round(Int, t)) seconds elapsed")
end
