using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
import Random
const TH = TexasHoldem
import Random

include("tester_bots.jl")
QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())
DebugGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.DebugLogger())

##### ActionBot
struct ActionBot <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{ActionBot}, options)
    if options.name == :CheckRaiseFold
        return RaiseTo(game, 200) # all-in
    elseif options.name == :CallRaiseFold
        return Call(game)
    elseif options.name == :CallAllInFold
        return Call(game)
    elseif options.name == :CallFold
        return Call(game)
    end
    error("Uncaught case")
end

struct ActionBot2 <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{ActionBot2}, options)
    if options.name == :CheckRaiseFold
        return RaiseTo(game, last(TH.valid_total_bet_range(game))) # all-in
    elseif options.name == :CallRaiseFold
        return Call(game)
    elseif options.name == :CallAllInFold
        return Call(game)
    elseif options.name == :CallFold
        return Call(game)
    end
    error("Uncaught case")
end

@testset "Actions" begin
    game = QuietGame(ntuple(i->Player(i==1 ? ActionBot() : BotCheckCall(), i), 2))
    game = TH.initialize!(game)

    (options, flow) = TH.play_to_options!(game)
    action = TH.get_action(game, options)::TH.Action
    TH.validate_action(game, action, options)
    TH.update_given_valid_action!(game, action)
    flow = TH.check_if_game_is_over!(game)

    (options, flow) = TH.play_to_options!(game)
    action = TH.get_action(game, options)::TH.Action
    TH.validate_action(game, action, options)
    TH.update_given_valid_action!(game, action)
    flow = TH.check_if_game_is_over!(game)
    @test TH.total_bet(game) == 200

end

@testset "ActionBot2" begin
    game = QuietGame(ntuple(i->Player(i==1 ? ActionBot2() : BotCheckCall(), i), 2))
    game = TH.initialize!(game)

    (options, flow) = TH.play_to_options!(game)
    action = TH.get_action(game, options)::TH.Action
    TH.validate_action(game, action, options)
    TH.update_given_valid_action!(game, action)
    flow = TH.check_if_game_is_over!(game)

    (options, flow) = TH.play_to_options!(game)
    action = TH.get_action(game, options)::TH.Action
    TH.validate_action(game, action, options)
    TH.update_given_valid_action!(game, action)
    flow = TH.check_if_game_is_over!(game)
    @test TH.total_bet(game) == 200

end
