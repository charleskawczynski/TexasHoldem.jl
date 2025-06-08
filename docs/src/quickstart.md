# Quickstart

Once you've finished [Installation](@ref), you can start playing games with:

```julia
using TexasHoldem
import TexasHoldem: get_action
struct RandomBot <: AbstractStrategy end
function get_action(game::Game, player::Player{RandomBot}, options)
    if options.name == :CheckRaiseFold
        rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
        return Check()
    elseif options.name == :CallRaiseFold
        rand() < 0.5 && return Call(game.table, player)
        rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
        return Fold()
    elseif options.name == :CallAllInFold
        rand() < 0.5 && return Call(game.table, player)
        rand() < 0.5 && return AllIn(game.table, player)
        return Fold()
    elseif options.name == :CallFold
        rand() < 0.5 && return Call(game.table, player)
        return Fold()
    else; error("Uncaught case")
    end
end

# Play against some bots!
players = (Player(Human(), 1), ntuple(i->Player(RandomBot(), i+1), 4)...)
tournament!(Game(players))
```
