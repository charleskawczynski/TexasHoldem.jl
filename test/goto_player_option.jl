using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
const TH = TexasHoldem
import Random
Random.seed!(1234)

QuietGame(args...; kwargs...) = Game(args...; kwargs..., logger=TH.ByPassLogger())

include("tester_bots.jl")

##### RiverDreamer
mutable struct RiverDreamer <: AbstractStrategy
    fixed::Bool
end

TH.player_option(game::Game, player::Player{RiverDreamer}, ::AGS, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{RiverDreamer}, ::AGS, ::CallRaiseFold) = Call(game, player)
TH.player_option(game::Game, player::Player{RiverDreamer}, ::AGS, ::CallAllInFold) = Call(game, player)
TH.player_option(game::Game, player::Player{RiverDreamer}, ::AGS, ::CallFold) = Call(game, player)

function TH.player_option(game::Game, player::Player{RiverDreamer}, round::River, option::CheckRaiseFold)
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
        # @show rewards
        return Check()
    end
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, round::River, option::CallRaiseFold)
    rgame = TH.recreate_game(game, player)
    Call(game, player)
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, round::River, option::CallAllInFold)
    rgame = TH.recreate_game(game, player)
    Call(game, player)
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, round::River, option::CallFold)
    rgame = TH.recreate_game(game, player)
    Call(game, player)
end

@testset "Game: Play (FuzzBot vs RiverDreamer)" begin
    fuzz_bots = ntuple(i->Player(TH.FuzzBot(), i), 3)
    players = (fuzz_bots..., Player(RiverDreamer(false), length(fuzz_bots)+1))
    play!(QuietGame(players))
end
