#####
##### Player types
#####

export AbstractStrategy, Human, Bot5050
export Player
export bank_roll, round_bank_roll, bank_roll_chips

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

#=
    FuzzBot

`FuzzBot` is a stochastic strategy that
chooses all of its actions based on a
coin flip.

This bot is used for fuzzing in the test
suite and for quick-start game configurations
for users.
=#
struct FuzzBot <: AbstractStrategy end

"""
    Bot5050

`Bot5050` is a stochastic strategy that
chooses all of its actions based on a
coin flip.

This bot is used for quick-start game
configurations for users.
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
struct Player{S #=<: AbstractStrategy=#}
    strategy::S
    seat_number::Int
    cards::Vector{Card}
    bank_roll::Chips
    game_profit::Chips
    action_required::Bool
    all_in::Bool
    round_bank_roll::Chips # bank roll at the beginning of the round
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

function Player(strategy, seat_number = -1, cards = Card[joker, joker]; bank_roll = 200)
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
        Card[cards[1], cards[2]],
        Chips(bank_roll),
        Chips(game_profit),
        action_required,
        all_in,
        Chips(round_bank_roll),
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

"""
    bank_roll(::Player)

The player's instantaneous
bank roll.

We access the `Int` in Chips
as the fractional chips are only
handled by the Transactions.
"""
bank_roll(player::Player) = player.bank_roll.n

"""
    bank_roll_chips(::Player)

The player's instantaneous
bank roll in Chips (includes
fractional chips).
"""
bank_roll_chips(player::Player) = player.bank_roll

"""
    round_bank_roll(::Player)

The player's bank roll at the
beginning of the round

We access the `Int` in Chips
as the fractional chips are only
handled by the Transactions.
"""
round_bank_roll(player::Player) = player.round_bank_roll.n

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
pot_investment(player::Player) = player.pot_investment
round_contribution(player::Player) = player.round_contribution
strategy(player::Player) = player.strategy
pot_eligible(player::Player) = !folded(player) && still_playing(player) && active(player)
pot_eligible(player::Nothing) = false
function has_cards(player::Player)
    @assert length(cards(player)) == 2
    return all(c->c == joker, cards(player)) ? false : true
end

notify_reward(player) = nothing
