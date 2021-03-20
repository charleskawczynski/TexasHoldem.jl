#### Hand
using DispatchedTuples
const DT = DispatchedTuples

export Hand, top_hand

# Results of top_hand
export StraightFlush, FourOfAKind, FullHouse,
    Flush, Straight, Trips,
    TwoPair, SinglePair, HighCard

struct Hand{N, NT <: NTuple{N,Card}, RC, ∑RC, SC, ∑SC}
    "Cards"
    cards::NT
    "Rank count"
    rc::RC
    "∑Rank count"
    ∑rc::∑RC
    "Suit count"
    sc::SC
    "∑Suit count"
    ∑sc::∑SC
    Hand(cards...) = Hand(cards)
    function Hand(cards::Union{Tuple,Vector})
        rc, ∑rc = tally(cards, rank)
        sc, ∑sc = tally(cards, suit)
        N = length(cards)
        return new{N,
            typeof(cards),
            typeof(rc),
            typeof(∑rc),
            typeof(sc),
            typeof(∑sc)}(cards, rc, ∑rc, sc, ∑sc)
    end
end

Base.length(hand::Hand) = length(hand.cards)

function Base.iterate(hand::Hand, state = 1)
    state > length(hand) && return nothing
    return (hand.cards[state], state+1)
end

function Base.show(io::IO, cards::Tuple{<:Card,<:Card,<:Card,<:Card,<:Card})
    print(io, "(")
    s = map(card -> get_string(card), cards)
    print(io, join(s, ", "))
    print(io, ")")
end

Base.show(io::IO, hand::Hand) = show(io, hand.cards)

rank_count(hand::Hand) = hand.rc
suit_count(hand::Hand) = hand.sc

rank_count_sum(hand::Hand) = hand.∑rc
suit_count_sum(hand::Hand) = hand.∑sc

function tally(cards::Tuple, fun)
    fun_count = DispatchedTuple(
    map(cards) do card
        (fun(card), 1)
    end, 0)

    ∑fun_count = DispatchedSet(
    map(DT.unique_keys(fun_count)) do k
        (k, sum(fun_count[k]))
    end, 0)
    return fun_count, ∑fun_count
end

abstract type AbstractTopHand end

struct StraightFlush <: AbstractTopHand end
struct FourOfAKind <: AbstractTopHand end
struct FullHouse <: AbstractTopHand end
struct Flush <: AbstractTopHand end
struct Straight <: AbstractTopHand end
struct Trips <: AbstractTopHand end
struct TwoPair <: AbstractTopHand end
struct SinglePair <: AbstractTopHand end
struct HighCard{R <: Int} <: AbstractTopHand
    rank::R
end

function top_hand(hand::Hand)
    is_straight_flush(hand) && return StraightFlush()
    is_four_of_a_kind(hand) && return FourOfAKind()
    is_full_house(hand)     && return FullHouse()
    is_flush(hand)          && return Flush()
    is_straight(hand)       && return Straight()
    is_trips(hand)          && return Trips()
    is_two_pair(hand)       && return TwoPair()
    is_one_pair(hand)       && return SinglePair()
    return HighCard(maximum(value.(rank_type.(hand))))
end

is_straight_flush(hand::Hand) = is_straight(hand) && is_flush(hand)
is_four_of_a_kind(hand::Hand) = has_n_of_a_kind(hand, 4)
is_flush(hand::Hand) = any(values(suit_count_sum(hand)) .== 5)

consecutive(tup) = all(ntuple(i->tup[i]+1==tup[i+1], 4))
function is_straight(hand::Hand)
    ranks = sort(collect(value.(rank_type.(hand.cards))))
    ranks_low = sort(collect(low_value.(rank_type.(hand.cards))))
    high_straight = consecutive(ranks)
    low_straight = consecutive(ranks_low)
    return low_straight || high_straight
end

is_trips(hand::Hand) = has_n_of_a_kind(hand, 3)
is_full_house(hand::Hand) = has_nm_of_a_kind(hand, 3, 2)
is_two_pair(hand::Hand) = has_nm_of_a_kind(hand, 2, 2)
is_one_pair(hand::Hand) = has_n_of_a_kind(hand, 2)

function has_n_of_a_kind(hand::Hand, n)
    ∑rc = rank_count_sum(hand)
    match_n_found = false
    match_count = map(keys(∑rc)) do k
        ∑rc_card = ∑rc[k]
        ∑rc_card == n && (match_n_found = true)
        ∑rc_card == n || ∑rc_card == 1
    end
    return all(match_count) && match_n_found
end

function has_nm_of_a_kind(hand::Hand, n, m)
    ∑rc = rank_count_sum(hand)
    match_n_found = false
    match_m_found = false
    match_count = map(keys(∑rc)) do k
        ∑rc_card = ∑rc[k]
        ∑rc_card == n && (match_n_found = true)
        ∑rc_card == m && (match_m_found = true)
        ∑rc_card == n || ∑rc_card == m || ∑rc_card == 1
    end
    return all(match_count) && match_n_found && match_m_found
end

