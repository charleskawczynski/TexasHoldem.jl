#### Hand

const DT = DispatchedTuples

export Hand, hand_rank

abstract type AbstractTopHand end

struct StraightFlush <: AbstractTopHand end; export StraightFlush
struct FourOfAKind <: AbstractTopHand end; export FourOfAKind
struct FullHouse <: AbstractTopHand end; export FullHouse
struct Flush <: AbstractTopHand end; export Flush
struct Straight <: AbstractTopHand end; export Straight
struct Trips <: AbstractTopHand end; export Trips
struct TwoPair <: AbstractTopHand end; export TwoPair
struct SinglePair <: AbstractTopHand end; export SinglePair
struct HighCard <: AbstractTopHand end; export HighCard

struct Hand{C,TC,R,H}
    cards::C
    top_cards::TC
    rank::R
    hand::H
    Hand(player_cards::Tuple, table_cards::Tuple) =
        Hand((player_cards..., table_cards...))
    Hand(cards...) = Hand(cards)
    function Hand(cards::Tuple)
        sorted_cards = sort(collect(cards); by=x->value(x))
        top_cards, hand, rank = cards_hand_rank(cards)
        return new{
            typeof(cards),
            typeof(top_cards),
            typeof(hand),
            typeof(rank)}(cards, top_cards, hand, rank)
    end
end

Base.length(hand::Hand) = length(hand.cards)

function Base.iterate(hand::Hand, state = 1)
    state > length(hand) && return nothing
    return (hand.cards[state], state+1)
end

function Base.show(io::IO, hand::Hand)
    print(io, "(")
    s = map(card -> string(card), hand.cards)
    print(io, join(s, ", "))
    print(io, ")")
end

function cards_hand_rank(cards)
    ranks = map(combinations(cards, 5)) do five_card_combo
        (five_card_combo, hand_rank_base(Tuple(five_card_combo))...)
    end
    i_max = argmin(map(x->x[2], ranks))
    return ranks[i_max]
end


function hand_rank_base(cards)
    r = rank(sort(collect(cards); by=x->value(x), rev=true))
    if     is_straight_flush(cards); hand = StraightFlush()
    elseif is_four_of_a_kind(cards); hand = FourOfAKind()
    elseif is_full_house(cards)    ; hand = FullHouse()
    elseif is_flush(cards)         ; hand = Flush()
    elseif is_straight(cards)      ; hand = Straight()
    elseif is_trips(cards)         ; hand = Trips()
    elseif is_two_pair(cards)      ; hand = TwoPair()
    elseif is_pair(cards)          ; hand = SinglePair()
    else                           ; hand = HighCard()
    end
    return (r, hand)
end

is_straight_flush(cards) = is_straight(cards) && is_flush(cards)
is_four_of_a_kind(cards) = has_n_of_a_kind(cards, 4)
function is_flush(cards)
    return any(map(suit_list) do s
        sum(Ref(s) .== suit.(cards))
    end .>= 5)
end

is_trips(cards) = has_n_of_a_kind(cards, 3)
is_full_house(cards) = has_n_of_a_kind(cards, 2) && has_n_of_a_kind(cards, 3)
is_two_pair(cards) =
    has_n_of_a_kind(cards, 2) && n_of_a_kind_value(cards, 2) ≠ n_of_a_kind_value_reversed(cards, 2)

is_pair(cards) = has_n_of_a_kind(cards, 2)

get_n_of_a_kind(cards, n) =
    [i for i in value.(rank_list) if count(v->v==i, value.(cards))==n]

n_of_a_kind_value(cards, n) = first(get_n_of_a_kind(cards, n))

has_n_of_a_kind(cards, n) =
    any([sum(Ref(i) .== value.(cards))==n for i in value.(rank_list)])

n_of_a_kind_value_reversed(cards, n) =
    [i for i in sort(collect(value.(rank_list)); rev=true) if count(v->v==i, value.(cards))==n]

