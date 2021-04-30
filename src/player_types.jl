#####
##### Player types
#####

export Human
export BotRandom, bank_roll

abstract type AbstractLifeForm end

struct Human <: AbstractLifeForm end

abstract type AbstractAI <: AbstractLifeForm end
struct BotRandom <: AbstractAI end

mutable struct Player{LF}
    life_form::LF
    id::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Float64
    action_history::Vector
    action_required::Bool
    all_in::Bool
    folded::Bool
end

function Player(life_form, id, cards = nothing; bank_roll = 200)
    action_history = []
    action_required = true
    all_in = false
    folded = false
    args = (life_form, id, cards, Float64(bank_roll), action_history, action_required, all_in, folded)
    Player(args...)
end

cards(player::Player) = player.cards
bank_roll(player::Player) = player.bank_roll
player_id(player::Player) = player.id
name(player::Player{LF}) where {LF <: AbstractLifeForm} = "$(nameof(LF))[$(player.id)]"
