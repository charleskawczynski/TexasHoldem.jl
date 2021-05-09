#####
##### Player types
#####

export Player, bank_roll
export Human
export AbstractAI, Bot5050, BotSitOut, BotCheckFold, BotCheckCall

abstract type AbstractLifeForm end

struct Human <: AbstractLifeForm end

abstract type AbstractAI <: AbstractLifeForm end
struct Bot5050 <: AbstractAI end
struct BotSitOut <: AbstractAI end
struct BotCheckFold <: AbstractAI end
struct BotCheckCall <: AbstractAI end

ai_to_use() = Bot5050()

mutable struct Player{LF}
    life_form::LF
    id::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Float64
    action_history::Vector
    action_required::Bool
    all_in::Bool
    round_bank_roll::Float64
    folded::Bool
    pot_investment::Float64 # accumulation of round_contribution, TODO: needs to be added to reset_game!
    checked::Bool
    last_to_raise::Bool
    sat_out::Bool
    round_contribution::Float64
end

function Base.show(io::IO, player::Player, include_type = true)
    include_type && println(io, typeof(player))
    println(io, "$(name(player))        = $(player.cards)")
end

function Player(life_form, id=0, cards = nothing; bank_roll = 200)
    action_history = []
    action_required = true
    all_in = false
    round_bank_roll = Float64(bank_roll)
    folded = false
    pot_investment = Float64(0)
    checked = false
    sat_out = false
    round_contribution = Float64(0)
    last_to_raise = false
    args = (
        life_form,
        id,
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
        sat_out,
        round_contribution,
    )
    Player(args...)
end

cards(player::Player) = player.cards
bank_roll(player::Player) = player.bank_roll
player_id(player::Player) = player.id
name(player::Player{LF}) where {LF <: AbstractLifeForm} = "$(nameof(LF))[$(player.id)]"
folded(player::Player) = player.folded
still_playing(player::Player) = !player.folded
action_history(player::Player) = player.action_history
checked(player::Player) = player.checked
last_to_raise(player::Player) = player.last_to_raise
all_in(player::Player) = player.all_in
action_required(player::Player) = player.action_required
sat_out(player::Player) = player.sat_out
round_bank_roll(player::Player) = player.round_bank_roll
pot_investment(player::Player) = player.pot_investment
round_contribution(player::Player) = player.round_contribution
