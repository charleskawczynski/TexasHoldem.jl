using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
TH = TexasHoldem

include("tester_bots.jl")

@testset "Game: Play (invalid number of players)" begin
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 1))
    @test_throws AssertionError("Invalid number of players") Game(ntuple(i->Player(Bot5050(), i), 11))
end

@testset "Game: Play (BotCheckCall)" begin
    play!(Game(ntuple(i->Player(BotCheckCall(), i), 3)))
end

@testset "Game: Play (BotCheckFold)" begin
    play!(Game(ntuple(i->Player(BotCheckFold(), i), 3)))
end

@testset "Game: Play (BotBetSB) - breaks lowest allowable bet" begin
    game = Game((Player(BotBetSB(),1), Player(BotCheckCall(),2)))
    # Cannot raise small blind on pre-flop, must raise at least big-blind
    @test_throws AssertionError("Raise must be between [\$4.0, \$200.0]") play!(game)
end

@testset "Game: Play (BotBetBB)" begin
    play!(Game((Player(BotBetBB(), 1), Player(BotCheckCall(), 2),)))
end

struct NoActionBot <: AbstractAI end

TH.player_option!(game::Game, player::Player{NoActionBot}, ::AbstractGameState, ::PlayerOptions) = nothing

@testset "Game: Play (NoActionBot)" begin
    game = Game((Player(BotCheckCall(), 1), Player(NoActionBot(), 2),))
    @test_throws AssertionError("Must take exactly 1 action.") play!(game)
end

@testset "Non-valid option using BotCheckOnCallRaiseFold" begin
    game = Game((Player(BotCheckCall(), 1), Player(BotCheckOnCallRaiseFold(), 2),))
    @test_throws ErrorException("Cannot check. Available options: CallRaiseFold") play!(game)
end
@testset "Non-valid option using BotCheckOnCallAllInFold" begin
    game = Game((Player(BotCheckOnCallAllInFold(), 1), Player(BotRaiseAlmostAllIn(), 2)))
    @test_throws ErrorException("Cannot check. Available options: CallAllInFold") play!(game)
end
@testset "Non-valid option using BotCheckOnCallFold" begin
    game = Game((Player(BotCheckOnCallFold(), 1), Player(BotRaiseAllIn(), 2)))
    @test_throws ErrorException("Cannot check. Available options: CallFold") play!(game)
end
@testset "Non-valid option using BotCallOnCheckRaiseFold" begin
    game = Game((Player(BotCheckCall(), 1), Player(BotCallOnCheckRaiseFold(), 2),))
    # We catch this incorrect option error before it's completed,
    # so we can't error in `validate_action`
    # @test_throws ErrorException("Cannot call. Available options: CheckRaiseFold") play!(game)
    @test_throws AssertionError("Cannot contribute \$0.0 to the pot!") play!(game)
end
@testset "Non-valid option using BotRaiseOnCallFold" begin
    game = Game((Player(BotRaiseOnCallFold(), 1), Player(BotRaiseAllIn(), 2)))
    @test_throws AssertionError("Only allowable raise is \$200.0 (all-in)") play!(game)
end

