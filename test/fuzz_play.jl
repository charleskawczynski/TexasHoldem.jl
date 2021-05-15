using Test
using PlayingCards
using TexasHoldem
TH = TexasHoldem

@testset "Game: Play (3 Bot5050's)" begin
    for n in 1:n_fuzz
        play!(Game(ntuple(i->Player(Bot5050(), i), 3)))
    end
end

@testset "Game: Play (10 Bot5050's)" begin
    for n in 1:n_fuzz_10_players
        play!(Game(ntuple(i->Player(Bot5050(), i), 10)))
    end
end
