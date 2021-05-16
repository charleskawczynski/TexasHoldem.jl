using Profile
using PlayingCards
using TexasHoldem
import TexasHoldem
const TH = TexasHoldem

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallFold) = call!(game, player)

function main(n_games)
    players = ntuple(i->(Player(BotCheckCall(), i)), 10)
    play(Game(players))
end

main(1) # Compile first:
@profile main(10) # time
# Profile.print()
