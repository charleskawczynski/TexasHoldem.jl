using Test
using NoLimitHoldem

@testset "Suit" begin
  s = Club()
  s = Spade()
  s = Heart()
  s = Diamond()
end

@testset "Card" begin
  ace_clubs = Card(Ace(), Club())
  jack_clubs = Card(Jack(), Club())
  jack_hearts = Card(Jack(), Heart())

  @test same_suit(ace_clubs  , jack_clubs) == true
  @test same_suit(jack_hearts, jack_clubs) == false

  @test same_rank(jack_hearts, jack_clubs) == true
  @test same_rank(ace_clubs  , jack_clubs) == false

  @test get_string(jack_clubs) == "(Jack, Club)"
  @test get_string(ace_clubs) == "(Ace, Club)"
end

