"""
    TexasHoldem

A no-limit Texas Holdem simulator.

# Terminology
 - `game` a single "game", where players are dealt hands,
   winner(s) are declared once.
 - `state` a point or process in the game, including
   `PreFlop`, `Flop`, `Turn`, `River`.
 - `round` the process of each player deciding which
   actions to take, until no further actions are taking.
"""
module TexasHoldem

using PlayingCards
using PokerHandEvaluator
using PokerHandEvaluator.HandTypes
using Printf

export AbstractGameState, PreFlop, Flop, Turn, River

abstract type AbstractGameState end
struct PreFlop <: AbstractGameState end
struct Flop <: AbstractGameState end
struct Turn <: AbstractGameState end
struct River <: AbstractGameState end

include("player_types.jl")
include("transactions.jl")
include("table.jl")
include("game.jl")
include("player_actions.jl")
include("player_options.jl")
include("config_game.jl")

end # module
