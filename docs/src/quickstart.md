# Quickstart

Once you've finished [Installation](@ref), you can start playing games with:

```julia
using TexasHoldem
import TexasHoldem: player_option
struct RandomBot <: AbstractStrategy end
function player_option(game::Game, player::Player{RandomBot}, ::CheckRaiseFold)
    rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
    return Check()
end
function player_option(game::Game, player::Player{RandomBot}, ::CallRaiseFold)
    rand() < 0.5 && return Call(game.table, player)
    rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
    return Fold()
end
function player_option(game::Game, player::Player{RandomBot}, ::CallAllInFold)
    rand() < 0.5 && return Call(game.table, player)
    rand() < 0.5 && return AllIn(game.table, player)
    return Fold()
end
function player_option(game::Game, player::Player{RandomBot}, ::CallFold)
    rand() < 0.5 && return Call()
    return Fold()
end
# Play against some bots!
players = (Player(Human(), 1), ntuple(i->Player(RandomBot(), i+1), 4)...)
tournament!(Game(players))
```
