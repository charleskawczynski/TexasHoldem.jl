"""
    TexasHoldem

A no-limit Texas Holdem simulator.

# Terminology
 - `game` a single "game", where players are dealt hands,
   winner(s) are declared once.
 - `round` a point or process in the game, including
   `PreFlop`, `Flop`, `Turn`, `River`.
 - `round` the process of each player deciding which
   actions to take, until no further actions are taking.
"""
module TexasHoldem

using PlayingCards
using PlayingCards: Card
using PokerHandEvaluator
using Printf

export AbstractRound, PreFlop, Flop, Turn, River
export Chips

include("custom_logger.jl")

abstract type AbstractGUI end
struct NoGUI <: AbstractGUI end
struct Terminal <: AbstractGUI end

abstract type AbstractRound end
struct PreFlop <: AbstractRound end
struct Flop <: AbstractRound end
struct Turn <: AbstractRound end
struct River <: AbstractRound end

include("chips.jl")
include("goto_player_option.jl")
include("player_type.jl")
include("players.jl")
include("transactions.jl")
include("table.jl")
include("game.jl")
include("player_actions.jl")
include("player_options.jl")
include(joinpath("terminal", "human_player_options.jl"))
include(joinpath("terminal", "config_game.jl"))
include(joinpath("terminal", "ascii_card.jl"))
include(joinpath("terminal", "ascii_player.jl"))
include(joinpath("terminal", "ui.jl"))
include("recreate.jl")

end # module
