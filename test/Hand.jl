using Test
using NoLimitHoldem
const NLH = NoLimitHoldem

@testset "Hand constructor and properties" begin
    cards = (A♣, 2♣, 3♣, 4♣, 5♣)
    hand = Hand(cards)
    hand = Hand(cards...)
    @test length(hand) == 5
end

@testset "Hand extending" begin
    cards = (A♣, 2♣, 3♣, 4♣, 5♣)
    hand = Hand(cards)
    @test Tuple(card for card in hand) == ntuple(i->cards[i], length(cards))
    hand = Hand(A♣, K♣, Q♣, J♣, 10♣)
    @test sprint(show, hand) == "(A♣, K♣, Q♣, J♣, 10♣)"
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
    @test HighCard() isa NLH.AbstractTopHand
end

@testset "Hand comparisons" begin

    straight_flush = Hand(A♣, 2♣, 3♣, 4♣, 5♣)
    four_of_a_kind = Hand(K♣, K♢, K♣, K♡, 5♡)
    full_house = Hand(K♣, K♠, Q♣, Q♡, Q♣)
    higher_full_house = Hand(A♣, A♠, 2♣, 2♡, 2♣)
    flush_hand = Hand(A♣, 2♣, K♣, 5♣, 6♣)
    straight = Hand(A♣, 2♢, 3♠, 4♡, 5♣)
    higher_straight = Hand(2♣, 3♢, 4♠, 5♡, 6♣)
    trips = Hand(A♣, A♢, A♠, 4♡, 5♣)
    two_pair = Hand(A♣, A♡, 3♣, 4♣, 4♣)
    one_pair = Hand(A♣, A♡, 3♣, 4♣, 5♣)
    high_card = Hand(10♣, K♡, 3♣, 4♣, 5♣)

    # has_n_of_a_kind
    @test NLH.has_n_of_a_kind(one_pair.cards, 2)
    @test NLH.has_n_of_a_kind(one_pair.cards, 2)
    @test NLH.has_n_of_a_kind(trips.cards, 3)
    @test !NLH.has_n_of_a_kind(high_card.cards, 4)

    # # Testing from best to worst
    @test NLH.is_straight_flush(straight_flush.cards)
    @test NLH.is_four_of_a_kind(four_of_a_kind.cards)
    @test NLH.is_full_house(full_house.cards)
    @test NLH.is_flush(flush_hand.cards)
    @test NLH.is_straight(straight.cards)
    @test NLH.is_trips(trips.cards)
    @test NLH.is_two_pair(two_pair.cards)
    @test NLH.is_pair(one_pair.cards)
    @test high_card.hand isa HighCard

    # Failing:
    # @test straight.rank < higher_straight.rank
    # @test full_house.rank < higher_full_house.rank

end
