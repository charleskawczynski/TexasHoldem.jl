using Test
using TexasHoldem
const TH = TexasHoldem
import Random

function seeded_game(; fun, n_players, n_games, bank_roll=200)
    Random.seed!(1234)
    players = ntuple(i->Player(TH.FuzzBot(), i; bank_roll=bank_roll), n_players)
    games = map(x->Game(deepcopy(players);logger=TexasHoldem.ByPassLogger()), 1:n_games)
    for n in 1:length(games)
        game = games[n]
        fun(game)
    end
    return games
end

@testset "Reproducibility for play" begin
    n_games = 1000
    n_players = 10
    games1 = seeded_game(;fun=play,n_players=n_players, n_games=n_games, bank_roll=200)
    games2 = seeded_game(;fun=play,n_players=n_players, n_games=n_games, bank_roll=200)
    for (g1, g2) in zip(games1, games2)
        for (p1, p2) in zip(g1.table.players, g2.table.players)
            @test bank_roll(p1) == bank_roll(p2)
        end
    end
end

@testset "Reproducibility for tournament!" begin
    n_games = 10000
    n_players = 3
    games1 = seeded_game(;fun=tournament!,n_players=n_players, n_games=n_games, bank_roll=200)
    games2 = seeded_game(;fun=tournament!,n_players=n_players, n_games=n_games, bank_roll=200)
    for (g1, g2) in zip(games1, games2)
        for (p1, p2) in zip(g1.table.players, g2.table.players)
            @test bank_roll(p1) == bank_roll(p2)
        end
    end

    n_games = 1000
    n_players = 10
    games1 = seeded_game(;fun=tournament!,n_players=n_players, n_games=n_games, bank_roll=200)
    games2 = seeded_game(;fun=tournament!,n_players=n_players, n_games=n_games, bank_roll=200)
    for (g1, g2) in zip(games1, games2)
        for (p1, p2) in zip(g1.table.players, g2.table.players)
            @test bank_roll(p1) == bank_roll(p2)
        end
    end
end
