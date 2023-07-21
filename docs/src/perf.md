# Performance

Here is a benchmark showcasing the performance of TexasHoldem:

```@example
import TexasHoldem as TH
using TexasHoldem
using BenchmarkTools
import Logging

struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

players() = ntuple(i->(Player(BotCheckCall(), i)), 4)

function do_work!()
    Logging.with_logger(Logging.NullLogger()) do
        play!(Game(players();logger=TH.ByPassLogger()))
    end
    return nothing
end

trial = @benchmark do_work!()
show(stdout, MIME("text/plain"), trial)
```
