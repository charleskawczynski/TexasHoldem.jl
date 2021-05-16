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
    t_elapsed = @elapsed begin
        for n in 1:n_games
            players = ntuple(i->(Player(BotCheckCall(), i)), 10)
            play(Game(players))
        end
    end
    Δt_per_game = t_elapsed / n_games
    @show Δt_per_game
end

main(1) # Compile first:
main(10) # time
