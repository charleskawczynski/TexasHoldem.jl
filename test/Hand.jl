using Test
using NoLimitHoldem
const NLH = NoLimitHoldem

@testset "Hand constructor and properties" begin
    cards = (
        Card(Ace(), Club()),
        Card(Two(), Club()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Five(), Club())
    )
    hand = Hand(cards)
    hand = Hand(cards...)
    @test NLH.rank_count(hand) == hand.rc
    @test NLH.suit_count(hand) == hand.sc
    @test NLH.rank_count_sum(hand) == hand.∑rc
    @test NLH.suit_count_sum(hand) == hand.∑sc
    @test length(hand) == 5
end

@testset "Hand extending" begin
    cards = (
        Card(Ace(), Club()),
        Card(Two(), Club()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Five(), Club())
    )
    hand = Hand(cards)
    @test Tuple(card for card in hand) == ntuple(i->cards[i], length(cards))
    sprint(show, hand)
end

@testset "Top Hands" begin
    @test StraightFlush() isa NLH.AbstractTopHand
    @test FourOfAKind() isa NLH.AbstractTopHand
    @test FullHouse() isa NLH.AbstractTopHand
    @test Flush() isa NLH.AbstractTopHand
    @test Straight() isa NLH.AbstractTopHand
    @test Trips() isa NLH.AbstractTopHand
    @test TwoPair() isa NLH.AbstractTopHand
    @test SinglePair() isa NLH.AbstractTopHand
    @test HighCard(1) isa NLH.AbstractTopHand
    @test HighCard(1).rank == 1
end

@testset "Hand comparisons" begin

    straight_flush = Hand(
        Card(Ace(), Club()),
        Card(Two(), Club()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Five(), Club()),
    )

    four_of_a_kind = Hand(
        Card(King(), Club()),
        Card(King(), Diamond()),
        Card(King(), Club()),
        Card(King(), Heart()),
        Card(Five(), Heart()),
    )

    full_house = Hand(
        Card(Ace(), Club()),
        Card(Ace(), Spade()),
        Card(Three(), Club()),
        Card(Three(), Heart()),
        Card(Three(), Club()),
    )

    flush_hand = Hand(
        Card(Ace(), Club()),
        Card(Two(), Club()),
        Card(King(), Club()),
        Card(Five(), Club()),
        Card(Six(), Club()),
    )

    straight = Hand(
        Card(Ace(), Club()),
        Card(Two(), Diamond()),
        Card(Three(), Spade()),
        Card(Four(), Heart()),
        Card(Five(), Club()),
    )

    trips = Hand(
        Card(Ace(), Club()),
        Card(Ace(), Diamond()),
        Card(Ace(), Spade()),
        Card(Four(), Heart()),
        Card(Five(), Club()),
    )

    two_pair = Hand(
        Card(Ace(), Club()),
        Card(Ace(), Heart()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Four(), Club()),
    )

    one_pair = Hand(
        Card(Ace(), Club()),
        Card(Ace(), Heart()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Five(), Club()),
    )

    high_card = Hand(
        Card(Ten(), Club()),
        Card(King(), Heart()),
        Card(Three(), Club()),
        Card(Four(), Club()),
        Card(Five(), Club()),
    )

    # ---- Building blocks

    # has_n_of_a_kind
    @test NLH.has_n_of_a_kind(one_pair, 2)
    @test NLH.has_n_of_a_kind(trips, 3)
    @test !NLH.has_n_of_a_kind(high_card, 4)
    @test !NLH.has_n_of_a_kind(full_house, 2)
    @test !NLH.has_n_of_a_kind(full_house, 3)
    # ----

    # Sneaky cases
    @test !NLH.is_four_of_a_kind(high_card)

    # Testing from best to worst
    @test NLH.is_straight_flush(straight_flush)
    @test NLH.is_four_of_a_kind(four_of_a_kind)
    @test NLH.is_full_house(full_house)
    @test NLH.is_flush(flush_hand)
    @test NLH.is_straight(straight)
    @test NLH.is_trips(trips)
    @test NLH.is_two_pair(two_pair)
    @test NLH.is_one_pair(one_pair)
    @test top_hand(high_card) isa HighCard

end
