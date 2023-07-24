"""
    TexasHoldem

A no-limit Texas Holdem simulator.

# Terminology
 - `game` a single "game", where players are dealt hands,
   winner(s) are declared once.
 - `stage` a point or process in the game, including
   `PreFlop`, `Flop`, `Turn`, `River`.
 - `round` the process of each player deciding which
   actions to take, until no further actions are taking.
"""
module TexasHoldem

using PlayingCards
using PlayingCards: Card
using PokerHandEvaluator
using Printf

export AbstractGameStage, PreFlop, Flop, Turn, River

include("custom_logger.jl")

abstract type AbstractGameStage end
struct PreFlop <: AbstractGameStage end
struct Flop <: AbstractGameStage end
struct Turn <: AbstractGameStage end
struct River <: AbstractGameStage end

include("player_types.jl")
include("players.jl")
include("transactions.jl")
include("table.jl")
include("game.jl")
include("player_actions.jl")
include("player_options.jl")
include("config_game.jl")

end # module
