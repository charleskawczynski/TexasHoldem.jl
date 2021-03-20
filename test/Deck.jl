using Test
using NoLimitHoldem
using NoLimitHoldem: suit_list, rank_list
const NLH = NoLimitHoldem

@testset "Deck" begin

  deck = OrderedDeck()
  @test length(deck) == 52
  shuffle!(deck)

  cards = pop!(deck, 2)
  @test length(deck) == 50
  @test length(cards) == 2
end
