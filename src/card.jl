
export Card
export Suit, Rank
export Club, Spade, Heart, Diamond
export ♣, ♠, ♡, ♢
export Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King

export same_suit,
       same_rank,
       get_string,
       rank_list,
       rank

#### Suit
abstract type Suit end
struct Club <: Suit end
struct Spade <: Suit end
struct Heart <: Suit end
struct Diamond <: Suit end

const ♣ = Club()
const ♠ = Spade()
const ♡ = Heart()
const ♢ = Diamond()

const suit_list = (Club(),Spade(),Heart(),Diamond())

get_string(::Type{Club}) = "♣"
get_string(::Type{Spade}) = "♠"
get_string(::Type{Heart}) = "♡"
get_string(::Type{Diamond}) = "♢"

#### Rank

abstract type Rank end

struct Two <: Rank end;   value(::Type{Two}) = 2
struct Three <: Rank end; value(::Type{Three}) = 3
struct Four <: Rank end;  value(::Type{Four}) = 4
struct Five <: Rank end;  value(::Type{Five}) = 5
struct Six <: Rank end;   value(::Type{Six}) = 6
struct Seven <: Rank end; value(::Type{Seven}) = 7
struct Eight <: Rank end; value(::Type{Eight}) = 8
struct Nine <: Rank end;  value(::Type{Nine}) = 9
struct Ten <: Rank end;   value(::Type{Ten}) = 10
struct Jack <: Rank end;  value(::Type{Jack}) = 11
struct Queen <: Rank end; value(::Type{Queen}) = 12
struct King <: Rank end;  value(::Type{King}) = 13
struct Ace <: Rank end;   value(::Type{Ace}) = 14

low_value(::Type{T}) where {T} = value(T)
low_value(::Type{Ace}) = 1

const FaceCards = (Jack(), Queen(), King(), Ace())

const FaceCardTypes = Union{typeof.(FaceCards)...}

const rank_list = (
    Two(), Three(), Four(),
    Five(), Six(), Seven(),
    Eight(), Nine(), Ten(),
    Jack(), Queen(), King(),
    Ace(),
)

#### Card

struct Card{R <: Rank, S <: Suit}
    rank::R
    suit::S
end

get_string(::Card{R,S}) where {R,S} = string(value(R))*get_string(S)
get_string(::Card{Jack,S}) where {S}  = "J"*get_string(S)
get_string(::Card{Queen,S}) where {S} = "Q"*get_string(S)
get_string(::Card{King,S}) where {S}  = "K"*get_string(S)
get_string(::Card{Ace,S}) where {S}   = "A"*get_string(S)

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

Base.show(io::IO, card::Card) = print(io, get_string(card))
