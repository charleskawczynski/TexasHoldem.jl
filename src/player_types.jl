#####
##### Player types
#####

export Player, bank_roll
export Human, round_bank_roll
export AbstractAI, Bot5050

abstract type AbstractLifeForm end

struct Human <: AbstractLifeForm end

abstract type AbstractAI <: AbstractLifeForm end
struct Bot5050 <: AbstractAI end

ai_to_use() = Bot5050()

mutable struct Player{LF}
    life_form::LF
    seat_number::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Float64
    action_history::Vector
    action_required::Bool
    all_in::Bool
    round_bank_roll::Float64 # bank roll at the beginning of the round
    folded::Bool
    pot_investment::Float64 # accumulation of round_contribution
    checked::Bool
    last_to_raise::Bool
    active::Bool
    round_contribution::Float64
end

function Base.show(io::IO, player::Player, include_type = true)
    include_type && println(io, typeof(player))
    println(io, "$(name(player))        = $(player.cards)")
end

function Player(life_form, seat_number, cards = nothing; bank_roll = 200)
    action_history = []
    action_required = true
    all_in = false
    round_bank_roll = Float64(bank_roll)
    folded = false
    pot_investment = Float64(0)
    checked = false
    active = true
    round_contribution = Float64(0)
    last_to_raise = false
    args = (
        life_form,
        seat_number,
        cards,
        Float64(bank_roll),
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
name(player::Player{LF}) where {LF <: AbstractLifeForm} = "$(nameof(LF))[$(seat_number(player))]"
folded(player::Player) = player.folded
zero_bank_roll(player::Player) = bank_roll(player) ≈ 0
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
life_form(player::Player) = player.life_form
