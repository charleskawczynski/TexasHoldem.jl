using Test
using PlayingCards
using TexasHoldem
import TexasHoldem
const TH = TexasHoldem

QuietGame(args...; kwargs...) = Game(args...; kwargs..., logger=TH.ByPassLogger())


##### RiverDreamer
struct RiverDreamer <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{RiverDreamer}, ::AbstractRound, ::CheckRaiseFold)
    return Check()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::AbstractRound, ::CallRaiseFold)
    return Call()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::AbstractRound, ::CallAllInFold)
    return Call()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::AbstractRound, ::CallFold)
    return Call()
end

function TH.player_option(game::Game, player::Player{RiverDreamer}, ::River, ::CheckRaiseFold)
    return Check()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::River, ::CallRaiseFold)
    return Call()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::River, ::CallAllInFold)
    return Call()
end
function TH.player_option(game::Game, player::Player{RiverDreamer}, ::River, ::CallFold)
    rgame = 
    return Call()
end

@testset "Play-out functionality" begin
    play!(QuietGame(ntuple(i->Player(BotCheckCall(), i), 3)))

end
