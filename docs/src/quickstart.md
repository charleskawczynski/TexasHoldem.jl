# Quickstart

Once you've finished [Installation](@ref), you can start playing games with:

```julia
using TexasHoldem
import TexasHoldem: get_action
struct RandomBot <: AbstractStrategy end
function get_action(game::Game, player::Player{RandomBot}, options)
    if options == TH.CheckRaiseFold
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        return Check()
    elseif options == TH.CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        return Fold()
    elseif options == TH.CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game)
        return Fold()
    elseif options == TH.CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    else; error("Uncaught case")
    end
end

# Play against some bots!
players = (Player(Human(), 1), ntuple(i->Player(RandomBot(), i+1), 4)...)
tournament!(Game(players))
```
