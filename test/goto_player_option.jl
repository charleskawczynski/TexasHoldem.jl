using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
const TH = TexasHoldem
import Random
Random.seed!(1234)

QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())
DebugGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.DebugLogger())

include("tester_bots.jl")

##### RiverDreamer
mutable struct RiverDreamer <: AbstractStrategy
    fixed::Bool
end

function TH.player_option(game::Game, player::Player{RiverDreamer}, options)
    round = game.table.round
    if options.name == :CheckRaiseFold
        round == :river || return Check()
        if player.strategy.fixed
            Check()
        else
            player.strategy.fixed = true
            vrr = TH.valid_raise_range(game.table, player)
            raises = sort(map(x->rand(vrr), 1:10))
            actions = (Check(), map(x->Raise(x), raises)..., Fold())
            @test TH.Action(:raise, 5) in actions
            @test TH.Action(:raise, 14) in actions
            rewards = map(actions) do action
                rgame = TH.recreate_game(game, player)
                sf = TH.StartFrom(TH.PlayerOption(player, round, action))
                play!(rgame, sf)
                pidx = findfirst(rgame.table.players) do p
                    TH.seat_number(p) == TH.seat_number(player)
                end
                rgame.table.players[pidx].game_profit
            end
            return Check()
        end
    elseif options.name == :CallRaiseFold
        round == :river || return Call(game, player)
        rgame = TH.recreate_game(game, player)
        Call(game, player)
    elseif options.name == :CallAllInFold
        round == :river || return Call(game, player)
        rgame = TH.recreate_game(game, player)
        Call(game, player)
    elseif options.name == :CallFold
        round == :river || return Call(game, player)
        rgame = TH.recreate_game(game, player)
        Call(game, player)
    else; error("Uncaught case")
    end
end

@testset "Game: Play (FuzzBot vs RiverDreamer)" begin
    fuzz_bots = ntuple(i->Player(TH.FuzzBot(), i), 3)
    players = (fuzz_bots..., Player(RiverDreamer(false), length(fuzz_bots)+1))
    play!(QuietGame(players))
end
