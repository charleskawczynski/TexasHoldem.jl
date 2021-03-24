
import Base

export Card
export Suit, Rank
export ♣, ♠, ♡, ♢

export same_suit,
       same_rank,
       rank_list,
       rank

#####
##### Types
#####

abstract type Suit end
struct Club <: Suit end
struct Spade <: Suit end
struct Heart <: Suit end
struct Diamond <: Suit end

const ♣ = Club()
const ♠ = Spade()
const ♡ = Heart()
const ♢ = Diamond()

abstract type Rank end
struct NumberCard{N} <: Rank end
struct Jack <: Rank end
struct Queen <: Rank end
struct King <: Rank end
struct Ace <: Rank end
NumberCard(n::Int) = NumberCard{n}()

struct Card{R <: Rank, S <: Suit}
    rank::R
    suit::S
end

# Allow constructing cards with, e.g., `3♡`
Base.:*(r::Integer, s::Suit) = Card(NumberCard{r}(), s)

# And for face cards:
# Not to be confused with
# ♡, ♡
# ♢, ♢
for s in "♣♢♡♠", (f,typ) in zip((:J,:Q,:K,:A),(Jack(),Queen(),King(),Ace()))
    ss, sc = Symbol(s), Symbol("$f$s")
    @show ss, sc, typ
    @eval (export $sc; const $sc = Card($typ,$ss))
end

#####
##### Methods
#####

Base.string(::Club) = "♣"
Base.string(::Spade) = "♠"
Base.string(::Heart) = "♡"
Base.string(::Diamond) = "♢"

Base.show(io::IO, card::Card) = print(io, string(card))

value(::NumberCard{V}) where {V} = V
value(::Type{NumberCard{N}}) where {N} = N
value(::Type{Jack}) = 11
value(::Type{Queen}) = 12
value(::Type{King}) = 13
value(::Type{Ace}) = 14

low_value(::Type{T}) where {T} = value(T)
low_value(::Type{Ace}) = 1

Base.string(card::Card) = string(value(card.rank))*string(card.suit)
Base.string(card::Card{Jack})  = "J"*string(card.suit)
Base.string(card::Card{Queen}) = "Q"*string(card.suit)
Base.string(card::Card{King})  = "K"*string(card.suit)
Base.string(card::Card{Ace})   = "A"*string(card.suit)

rank_type(::Card{R,S}) where {R,S} = R
suit_type(::Card{R,S}) where {R,S} = S
rank_type(::Type{Card{R,S}}) where {R,S} = R
suit_type(::Type{Card{R,S}}) where {R,S} = S

rank(c::Card) = c.rank
suit(c::Card) = c.suit

# Default
same_suit(A::Card{NA,SA}, B::Card{NB,SB}) where {SA<:Suit,NA,SB<:Suit,NB} = false
# Match
same_suit(A::Card{NA,S}, B::Card{NB,S}) where {S<:Suit,NA,NB} = true

# Default
same_rank(A::Card{NA,SA}, B::Card{NB,SB}) where {SA<:Suit,NA,SB<:Suit,NB} = false
# Match
same_rank(A::Card{N,SA}, B::Card{N,SB}) where {N,SA<:Suit,SB<:Suit} = true

#####
##### Lists
#####

const suit_list = (♣, ♠, ♡, ♢)

const FaceCards = (Jack(), Queen(), King(), Ace())

const FaceCardTypes = Union{typeof.(FaceCards)...}

const rank_list = (
    map(i->NumberCard{i}(), 2:10)...,
    Jack(), Queen(), King(),
    Ace(),
)
