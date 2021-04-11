using Test
using PlayingCards
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
    @test sprint(show, hand) == "(A♣, K♣, Q♣, J♣, T♣)"
end
