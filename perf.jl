import TexasHoldem
const TH = TexasHoldem
using TexasHoldem
using BenchmarkTools

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(BotCheckCall(), i)), 4)
@benchmark play!(Game(players()))
