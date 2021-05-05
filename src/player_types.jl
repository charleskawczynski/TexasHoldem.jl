#####
##### Player types
#####

export Human
export BotRandom, bank_roll

abstract type AbstractLifeForm end

struct Human <: AbstractLifeForm end

abstract type AbstractAI <: AbstractLifeForm end
struct BotRandom <: AbstractAI end

ai_to_use() = BotRandom()

mutable struct Player{LF}
    life_form::LF
    id::Int
    cards::Union{Nothing,Tuple{<:Card,<:Card}}
    bank_roll::Float64
    action_history::Vector
    action_required::Bool
    all_in::Bool
    folded::Bool
    checked::Bool
    last_to_raise::Bool
end

function Base.show(io::IO, player::Player, include_type = true)
    include_type && println(io, typeof(player))
    println(io, "$(name(player))        = $(player.cards)")
end

function Player(life_form, id, cards = nothing; bank_roll = 200)
    action_history = []
    action_required = true
    all_in = false
    folded = false
    checked = false
    last_to_raise = false
    args = (life_form, id, cards, Float64(bank_roll), action_history, action_required, all_in, folded, checked, last_to_raise)
    Player(args...)
end

cards(player::Player) = player.cards
bank_roll(player::Player) = player.bank_roll
player_id(player::Player) = player.id
name(player::Player{LF}) where {LF <: AbstractLifeForm} = "$(nameof(LF))[$(player.id)]"
folded(player::Player) = player.folded
action_history(player::Player) = player.action_history
checked(player::Player) = player.checked
last_to_raise(player::Player) = player.last_to_raise
all_in(player::Player) = player.all_in
action_required(player::Player) = player.action_required
