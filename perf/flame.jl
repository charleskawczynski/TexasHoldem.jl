import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools
using Logging

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(BotCheckCall(), i)), 4)

function do_work!(games)
    with_logger(NullLogger()) do
        for game in games
            play!(Game(players()))
        end
    end
    return nothing
end

import Profile
import ProfileCanvas

games = map(x->Game(players()), 1:10000);
do_work!(games) # compile first

games = map(x->Game(players()), 1:10000);
Profile.clear()
prof = Profile.@profile begin
    do_work!(games)
end

results = Profile.fetch()
Profile.clear()
ProfileCanvas.html_file(joinpath("flame.html"), results)
