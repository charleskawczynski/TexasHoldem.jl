
import Base

export NumberCard,
    Jack,
    Queen,
    King,
    Ace

export Club,
    Spade,
    Heart,
    Diamond

export Card
export Suit, Rank
export full_deck
export suit, value, rank_type
export ♣, ♠, ♡, ♢

export rank_list, rank

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
    @eval (export $sc; const $sc = Card($typ,$ss))
end
for s in "♣♢♡♠"
    ss, sc = Symbol(s), Symbol("T$s")
    @eval (export $sc; const $sc = Card(NumberCard{10}(),$ss))
end

#####
##### Methods
#####

Base.string(::Club) = "♣"
Base.string(::Spade) = "♠"
Base.string(::Heart) = "♡"
Base.string(::Diamond) = "♢"

Base.string(card::Card) = string(value(card.rank))*string(card.suit)
Base.string(r::NumberCard{N}) where {N}  = "$N"
Base.string(r::Jack)  = "J"
Base.string(r::Queen) = "Q"
Base.string(r::King)  = "K"
Base.string(r::Ace)   = "A"
Base.string(card::Card{Jack})  = string(card.rank)*string(card.suit)
Base.string(card::Card{Queen}) = string(card.rank)*string(card.suit)
Base.string(card::Card{King})  = string(card.rank)*string(card.suit)
Base.string(card::Card{Ace})   = string(card.rank)*string(card.suit)

Base.show(io::IO, card::Card) = print(io, string(card))

# TODO: define Base.isless ? Problem: high Ace vs. low Ace

value(r::Rank) = value(typeof(r))
value(::NumberCard{V}) where {V} = V
value(::Type{NumberCard{N}}) where {N} = N
value(::Type{Jack}) = 11
value(::Type{Queen}) = 12
value(::Type{King}) = 13
value(::Type{Ace}) = 14

low_value(::Type{T}) where {T} = value(T)
low_value(::Type{Ace}) = 1

rank_type(::Card{R,S}) where {R,S} = R
suit_type(::Card{R,S}) where {R,S} = S
rank_type(::Type{Card{R,S}}) where {R,S} = R
suit_type(::Type{Card{R,S}}) where {R,S} = S

value(c::Card) = value(c.rank)
rank(c::Card) = c.rank
suit(c::Card) = c.suit

#####
##### Hand eval methods
#####

up_type(::Type{NumberCard{N}}) where {N} = NumberCard{N+1}
up_type(::Type{NumberCard{10}}) = Jack
up_type(::Type{Jack}) = Queen
up_type(::Type{Queen}) = King
up_type(::Type{King}) = Ace
up_type(::Type{Ace}) = NumberCard{2}

dn_type(::Type{Ace}) = King
dn_type(::Type{King}) = Queen
dn_type(::Type{Queen}) = Jack
dn_type(::Type{Jack}) = NumberCard{10}
dn_type(::Type{NumberCard{N}}) where {N} = NumberCard{N-1}
dn_type(::Type{NumberCard{2}}) = Ace

recurse_up(card::Card) = recurse_up(typeof(card.rank))

# How far (0:12) are we from Ace?
recurse_up(::Type{Ace}, base) = base
recurse_up(::Type{T}, base=0) where {T} = recurse_up(up_type(T), base+1)

# How far (0:12) are we from Ace, excluding given type?
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Tmatch}, base) where {Tdiag, Tmatch} = base+1
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Titer} = Ace, base=0) where {Tdiag,Tmatch,Titer} =
    dist_to_ace_skip_diag(Tdiag, Tmatch, dn_type(Titer), base+1)
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Tdiag}, base) where {Tdiag, Tmatch} =
    dist_to_ace_skip_diag(Tdiag, Tmatch, dn_type(Tdiag), base)

type_up(card::Card, n::Int) = type_up(typeof(card.rank), n)
type_dn(card::Card, n::Int) = type_dn(typeof(card.rank), n)

# Nth type up from T
type_up(::Type{T}, n::Int) where {T} = type_up(T, Val(n))
type_up(::Type{T}, ::Val{0}) where {T} = T
type_up(::Type{T}, ::Val{N}) where {T, N} = type_up(up_type(T), Val(N-1))

# Nth type down from T
type_dn(::Type{T}, n::Int) where {T} = type_dn(T, Val(n))
type_dn(::Type{T}, ::Val{0}) where {T} = T
type_dn(::Type{T}, ::Val{N}) where {T, N} = type_dn(dn_type(T), Val(N-1))

#####
##### Lists
#####

const rank_list = (
    map(i->NumberCard{i}(), 2:10)...,
    Jack(), Queen(), King(),
    Ace(),
)

const rank_type_list_rev = typeof.(rank_list[end:-1:1])
const suit_list = (♣, ♠, ♡, ♢)
const full_deck = [Card(r,s) for r in rank_list for s in suit_list]

#####
##### Card eval
#####

include("cards_eval.jl")

