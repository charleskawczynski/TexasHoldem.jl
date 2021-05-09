using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
TH = TexasHoldem

@testset "Game: Play (invalid number of players)" begin
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 1))
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 11))
end

@testset "Game: Play (BotCheckCall)" begin
    play(Game(ntuple(i->Player(BotCheckCall(), i), 3)))
end

@testset "Game: Play (BotCheckFold)" begin
    play(Game(ntuple(i->Player(BotCheckFold(), i), 3)))
end

@testset "Game: Play (BotSitOut)" begin
    players = (
        Player(BotSitOut(), 1),
        Player(Bot5050(), 2),
        Player(Bot5050(), 3),
    )
    play(Game(players))
end

struct BotBetSB <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotBetSB}, ::AbstractGameState, ::CheckRaiseFold) =
    raise_to!(game, player, blinds(game).small)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::PreFlop, ::CheckRaiseFold) =
    raise_to!(game, player, blinds(game).small)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::AbstractGameState, ::CallRaiseFold) =
    call!(game, player)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::AbstractGameState, ::CallFold) =
    call!(game, player)

@testset "Game: Play (BotBetSB) - breaks lowest allowable bet" begin
    game = Game((Player(BotBetSB()), Player(BotCheckCall())))
    # Cannot raise small blind on pre-flop, must raise at least big-blind
    @test_throws AssertionError("Invalid raise amount") play(game)
end

struct BotBetBB <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotBetBB}, ::PreFlop, ::CheckRaiseFold) =
    raise_to!(game, player, 2*blinds(game).big)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AbstractGameState, ::CheckRaiseFold) =
    raise_to!(game, player, blinds(game).big)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AbstractGameState, ::CallRaiseFold) =
    call!(game, player)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AbstractGameState, ::CallFold) =
    call!(game, player)

@testset "Game: Play (BotBetBB)" begin
    play(Game((Player(BotBetBB(), 1), Player(BotCheckCall(), 2),)))
end

