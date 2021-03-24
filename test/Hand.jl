using Test
using NoLimitHoldem
const NLH = NoLimitHoldem

@testset "Hand constructor and properties" begin
    cards = (A♣, 2♣, 3♣, 4♣, 5♣)
    hand = Hand(cards)
    hand = Hand(cards...)
    @test NLH.rank_count(hand) == hand.rc
    @test NLH.suit_count(hand) == hand.sc
    @test NLH.rank_count_sum(hand) == hand.∑rc
    @test NLH.suit_count_sum(hand) == hand.∑sc
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
    @test HighCard(1) isa NLH.AbstractTopHand
    @test HighCard(1).rank == 1
end

@testset "Hand comparisons" begin

    straight_flush = Hand(A♣, 2♣, 3♣, 4♣, 5♣)
    four_of_a_kind = Hand(K♣, K♢, K♣, K♡, 5♡)
    full_house = Hand(A♣, A♠, 3♣, 3♡, 3♣)
    flush_hand = Hand(A♣, 2♣, K♣, 5♣, 6♣)
    straight = Hand(A♣, 2♢, 3♠, 4♡, 5♣)
    trips = Hand(A♣, A♢, A♠, 4♡, 5♣)
    two_pair = Hand(A♣, A♡, 3♣, 4♣, 4♣)
    one_pair = Hand(A♣, A♡, 3♣, 4♣, 5♣)
    high_card = Hand(10♣, K♡, 3♣, 4♣, 5♣)

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
