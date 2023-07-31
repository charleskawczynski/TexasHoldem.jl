#####
##### Player types
#####

export AbstractStrategy, Human, Bot5050
export Player
export bank_roll, round_bank_roll

"""
    AbstractStrategy

An abstract strategy type, which users can
subtype when passing to players.
"""
abstract type AbstractStrategy end

"""
    Human

A human (terminal input) strategy. Use this
strategy if you want to play "live" games,
and not for simulating games.
"""
struct Human <: AbstractStrategy end

"""
    Bot5050

`Bot5050` is a stochastic strategy that
chooses all of its actions based on a
coin flip.

This bot is used for fuzzing in the test
suite and for quick-start game configurations
for users.
"""
struct Bot5050 <: AbstractStrategy end

"""
    Player

Contains the poker player information:
 - strategy
 - cards
 - bank roll
 - pot investment

TODO: some of these fields should be
removed, since they're only needed
for flow control logic.
"""
mutable struct Player{S #=<: AbstractStrategy=#}
    strategy::S
    seat_number::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Int
    game_profit::Int
    action_required::Bool
    all_in::Bool
    round_bank_roll::Int # bank roll at the beginning of the round
    folded::Bool
    pot_investment::Int # accumulation of round_contribution
    checked::Bool
    last_to_raise::Bool
    active::Bool
    round_contribution::Int
end

function Base.show(io::IO, player::Player)
    print(io, "$(name(player)): $(player.cards)")
end

function Player(strategy, seat_number, cards = nothing; bank_roll = 200)
    action_required = true
    all_in = false
    round_bank_roll = bank_roll
    folded = false
    pot_investment = 0
    game_profit = 0
    checked = false
    active = true
    round_contribution = 0
    last_to_raise = false
    S = typeof(strategy)
    args = (
        strategy,
        seat_number,
        cards,
        bank_roll,
        game_profit,
        action_required,
        all_in,
        round_bank_roll,
        folded,
        pot_investment,
        checked,
        last_to_raise,
        active,
        round_contribution,
    )
    Player(args...)
end

name(s::AbstractStrategy) = nameof(typeof(s))
name(player::Player) = "$(name(strategy(player)))[$(seat_number(player))]"
cards(player::Player) = player.cards
bank_roll(player::Player) = player.bank_roll
seat_number(player::Player) = player.seat_number
folded(player::Player) = player.folded
zero_bank_roll(player::Player) = bank_roll(player) == 0
still_playing(player::Player) = active(player) && !folded(player)
not_playing(player::Player) = !still_playing(player)
checked(player::Player) = player.checked
last_to_raise(player::Player) = player.last_to_raise
all_in(player::Player) = player.all_in
action_required(player::Player) = player.action_required
active(player::Player) = player.active
inactive(player::Player) = !active(player)
round_bank_roll(player::Player) = player.round_bank_roll
pot_investment(player::Player) = player.pot_investment
round_contribution(player::Player) = player.round_contribution
strategy(player::Player) = player.strategy

notify_reward(player) = nothing
