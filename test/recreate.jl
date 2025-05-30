using Test
using PlayingCards
using Accessors
using TexasHoldem
import TexasHoldem
const TH = TexasHoldem
import Random
Random.seed!(1234)

include("tester_bots.jl")

sort_cards(cards) =
    sort(sort(collect(cards); by=x->PlayingCards.rank(x));by=x->PlayingCards.suit(x).i)

@testset "Recreate game" begin
    players = TH.Players(ntuple(i->Player(BotCheckCall(), i), 3))
    game = Game(players; logger=TH.ByPassLogger())
    (; table) = game
    table = TH.deal(table, TH.blinds(game.table))
    player = table.players[1]
    @reset game.table = table
    rgame = TH.recreate_game(game, player)

    # deep copy, should be pointing to separate memory
    @test !(player === rgame.table.players[1])

    # For a recreated game:
    #  - player[1]'s cards should be the same for every sample
    #  - Opponents cards should be different upon different sampling
    #  - visible table cards should be the same
    #  - unobserved table cards should be different
    opponent_cards = players[2].cards
    n_player_cards_variation = 0
    n_unobserved_opponent_cards_variation = 0
    n_observed_table_variation = 0
    n_unobserved_table_variation = 0
    n_samples = 10_000
    for i in 1:n_samples
        rgame = TH.recreate_game(game, player)
        if !all(sort_cards(rgame.table.players[1].cards) .== sort_cards(player.cards))
            n_player_cards_variation+=1
        end
        if !all(sort_cards(rgame.table.players[2].cards) .== sort_cards(opponent_cards))
            n_unobserved_opponent_cards_variation+=1
        end
        if !all(sort_cards(TH.observed_cards(rgame.table)) .== sort_cards(TH.observed_cards(game.table)))
            n_observed_table_variation+=1
        end
        if !all(sort_cards(TH.unobserved_cards(rgame.table)) .== sort_cards(TH.unobserved_cards(game.table)))
            n_unobserved_table_variation+=1
        end
    end
    @test n_player_cards_variation == 0
    @test n_unobserved_opponent_cards_variation ≠ 0
    @test n_unobserved_opponent_cards_variation > n_samples/25 # we shouldn't be getting the same hand more than 25% of the time
    @test n_unobserved_opponent_cards_variation ≠ n_samples # sometimes (but very rarely) we get the same hand!
    @test n_observed_table_variation == 0

    @test n_unobserved_table_variation ≠ 0
    @test n_unobserved_table_variation > n_samples/25 # we shouldn't be getting the same table cards more than 25% of the time
    # @test n_unobserved_table_variation ≠ n_samples # we need n_samples ~ 3*10^9 to test this, and that would take ~10 hours on my local machine :(
end
