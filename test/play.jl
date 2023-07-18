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
    # Cannot raise small blind on pre-flop! The big blind is the raise min raise, so we must raise at least big-blind
    @test_throws AssertionError("Raise must be between [\$4.0, \$200.0]") play!(game)
end

@testset "Game: Play (BotBetBB)" begin
    play!(Game((Player(BotBetBB(), 1), Player(BotCheckCall(), 2),)))
end

struct NoActionBot <: AbstractAI end

TH.player_option!(game::Game, player::Player{NoActionBot}, ::AbstractGameStage, ::PlayerOptions) = nothing

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
    @test_throws AssertionError("Cannot raise 0.") play!(game)
end

@testset "Player limps all in" begin
    # Note that the order of the players seems to be important here.
    game = Game((Player(BotCheckCall(), 2; bank_roll = 11), Player(BotLimpAllIn(), 1; bank_roll = 1)))
    play!(game)
end

n_check_actions = [0]
n_call_actions = [0]
@testset "N-actions (3 players)" begin
    play!(Game(ntuple(i->Player(BotNActions(), i), 3)))
    @test n_call_actions[1] == 2 # dealer + small blind
    # 1 check pre-flop (big blind)
    # 3 checks (flop)
    # 3 checks (turn)
    # 3 checks (river)
    @test n_check_actions[1] == 10
end

n_check_actions = [0]
n_call_actions = [0]
@testset "N-actions (4 players)" begin
    play!(Game(ntuple(i->Player(BotNActions(), i), 4)))
    @test n_call_actions[1] == 3 # dealer + small blind + 1 other
    # 1 check pre-flop (big blind)
    # 4 checks (flop)
    # 4 checks (turn)
    # 4 checks (river)
    @test n_check_actions[1] == 13
end

n_check_actions = [0]
n_call_actions = [0]
@testset "N-actions (custom 1)" begin
    # Inspired by:
    # [ Info: Initial bank roll summary: (260.0, 0.0, 37.0, 0.0, 203.0)
    # [ Info: Buttons (dealer, small, big, 1ˢᵗToAct): (1, 3, 5, 1)
    play!(Game((
        Player(BotNActions(), 1),
        Player(BotNActions(), 2; bank_roll = 0),
        Player(BotNActions(), 3),
        Player(BotNActions(), 4; bank_roll = 0),
        Player(BotNActions(), 5),
    ); dealer_pidx = 1))

    @test n_call_actions[1] == 2 # dealer + small blind
    # 1 check pre-flop (big blind)
    # 3 checks (flop)
    # 3 checks (turn)
    # 3 checks (river)
    @test n_check_actions[1] == 10
end

n_check_actions = [0]
n_call_actions = [0]
@testset "N-actions (custom 2)" begin
    # Inspired by:
    # [ Info: Initial bank roll summary: (195.0, 0.0, 256.0, 4.0, 45.0)
    # [ Info: Buttons (dealer, small, big, 1ˢᵗToAct): (5, 1, 3, 4)
    play!(Game((
        Player(BotNActions(), 1; bank_roll = 195.0),
        Player(BotCheckCall(), 2; bank_roll = 0),
        Player(BotPreFlopRaise(7.0), 3; bank_roll = 256.0),
        Player(BotCheckCall(), 4; bank_roll = 4.0),
        Player(BotCheckFold(), 5; bank_roll = 45.0),
    ); dealer_pidx = 1))

    @test n_call_actions[1] == 2 # dealer + small blind
    # 1 check pre-flop (big blind)
    # 3 checks (flop)
    # 3 checks (turn)
    # 3 checks (river)
    @test n_check_actions[1] == 3
end
