using Test
using PlayingCards
using TexasHoldem

@testset "Game: play! (3 Bot5050's)" begin
    for n in 1:n_fuzz
        play!(Game(ntuple(i->Player(Bot5050(), i), 3)))
    end
end

@testset "Game: play! (10 Bot5050's)" begin
    for n in 1:n_fuzz_10_players
        play!(Game(ntuple(i->Player(Bot5050(), i), 10)))
    end
end

@testset "Game: tournament! (2 Bot5050's)" begin
    for n in 1:n_fuzz
        tournament!(Game(ntuple(i->Player(Bot5050(), i; bank_roll = 6), 2)))
    end
end

@testset "Game: tournament! (3 Bot5050's)" begin
    for n in 1:n_fuzz_10_players
        tournament!(Game(ntuple(i->Player(Bot5050(), i; bank_roll = 6), 3)))
    end
end

# Too many things are broken to support this.
# @testset "Game: tournament! (10 Bot5050's)" begin
#     for n in 1:n_fuzz_10_players
#         tournament!(Game(ntuple(i->Player(Bot5050(), i; bank_roll = 6), 10)))
#     end
# end
