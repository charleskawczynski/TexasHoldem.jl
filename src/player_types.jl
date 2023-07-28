#####
##### Player types
#####

export Player, bank_roll
export Human, round_bank_roll
export AbstractAI, Bot5050

abstract type AbstractStrategy end

struct Human <: AbstractStrategy end

abstract type AbstractAI <: AbstractStrategy end
struct Bot5050 <: AbstractAI end

ai_to_use() = Bot5050()

mutable struct Player{S}
    strategy::S
    seat_number::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Int
    action_history::Vector
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

function Base.show(io::IO, player::Player, include_type = true)
    include_type && println(io, typeof(player))
    println(io, "$(name(player))        = $(player.cards)")
end

function Player(strategy, seat_number, cards = nothing; bank_roll = 200)
    action_history = []
    action_required = true
    all_in = false
    round_bank_roll = bank_roll
    folded = false
    pot_investment = 0
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
        action_history,
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

cards(player::Player) = player.cards
bank_roll(player::Player) = player.bank_roll
seat_number(player::Player) = player.seat_number
name(player::Player{S}) where {S <: AbstractStrategy} = "$(nameof(S))[$(seat_number(player))]"
folded(player::Player) = player.folded
zero_bank_roll(player::Player) = bank_roll(player) == 0
still_playing(player::Player) = active(player) && !folded(player)
not_playing(player::Player) = !still_playing(player)
action_history(player::Player) = player.action_history
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

