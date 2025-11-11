# TexasHoldem.jl

|||
|---------------------:|:----------------------------------------------|
| **Docs Build**       | [![docs build][docs-bld-img]][docs-bld-url]   |
| **Documentation**    | [![dev][docs-dev-img]][docs-dev-url]          |
| **GHA CI**           | [![gha ci][gha-ci-img]][gha-ci-url]           |
| **Code Coverage**    | [![codecov][codecov-img]][codecov-url]        |

[docs-bld-img]: https://github.com/charleskawczynski/TexasHoldem.jl/workflows/Documentation/badge.svg
[docs-bld-url]: https://github.com/charleskawczynski/TexasHoldem.jl/actions?query=workflow%3ADocumentation

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://charleskawczynski.github.io/TexasHoldem.jl/dev/

[gha-ci-img]: https://github.com/charleskawczynski/TexasHoldem.jl/workflows/ci/badge.svg
[gha-ci-url]: https://github.com/charleskawczynski/TexasHoldem.jl/actions?query=workflow%3Aci

[codecov-img]: https://codecov.io/gh/charleskawczynski/TexasHoldem.jl/branch/main/graph/badge.svg
[codecov-url]: https://codecov.io/gh/charleskawczynski/TexasHoldem.jl

A package for simulating no-limit Texas Holdem Poker. Install with

```julia-repl
(@v1.x) pkg> add TexasHoldem
```

# Playing

A single game can be played with `play!` or a tournament-style game with `tournament!`:

```julia
using TexasHoldem
tournament!(configure_game()) # play until 1 player remains
```

# Creating your own bot

Overload `get_action` with your own bot and play against it:

```julia
import TexasHoldem as TH
struct MyBot <: TH.AbstractStrategy end

function TH.get_action(game::TH.Game, player::TH.Player{MyBot}, options::TH.Options)
    if options == TH.CheckRaiseFold
        rand() < 0.5 && return TH.RaiseTo(game, rand(TH.valid_total_bet_range(game)))
        return TH.Check()
        # return TH.Fold() # we can fold, but we can check for free
    elseif options == TH.CallRaiseFold
        rand() < 0.5 && return TH.Call(game)
        rand() < 0.5 && return TH.RaiseTo(game, rand(TH.valid_total_bet_range(game)))
        return TH.Fold()
    elseif options == TH.CallAllInFold
        rand() < 0.5 && return TH.Call(game)
        rand() < 0.5 && return TH.AllIn(game)
        return TH.Fold()
    else
        @assert options == TH.CallFold
        rand() < 0.5 && return TH.Call(game)
        return TH.Fold()
    end
end

import Logging
players = (TH.Player(TH.Human(), 1), TH.Player(MyBot(), 2));
game = TH.Game(players; gui=TH.NoGUI(), logger=TH.InfoLogger())
# Heads-up against MyBot!
TH.tournament!(game)
```

## Orchestrating your own game

Want to orchestrate your own game? TexasHoldem.jl's `play!` implementation is
(very roughly)

```julia
using TexasHoldem: GameState
import TexasHoldem as TH
function play!(game::Game)
    TH.initialize!(game)
    while true
        (options, flow) = play_to_options!(game)::Tuple{Options,GameState.T}
        if flow == GameState.BettingComplete
            continue
        elseif flow == GameState.HandOver
            break
        else
            @assert flow == GameState.NextAction
        end

        action = get_action(game, options)::Action
        validate_action(game, action, options)

        update_given_valid_action!(game, action)
        flow = check_if_game_is_over!(game)
        if flow == GameState.BettingComplete
            continue
        else
            @assert flow == GameState.HandOver
            break
        end
    end
    TH.distribute_winnings!(game)
    game.table.winners.declared = true
    TH.post_game_procedure(game)
    return TH.any_quit_game(game)
end
```

Implement your own for your own needs!

## Related packages

| Package                                                                             |  Development status      |         Purpose                                       |
|------------------------------------------------------------------------------------:|:------------------------:|:------------------------------------------------------|
| [PlayingCards.jl](https://github.com/charleskawczynski/PlayingCards.jl)             | Perhaps stable           | Representing cards                                    |
| [PokerHandEvaluator.jl](https://github.com/charleskawczynski/PokerHandEvaluator.jl) | Perhaps stable           | Comparing any two 5-7 card hands                      |
| [TexasHoldem.jl](https://github.com/charleskawczynski/TexasHoldem.jl)               | Likely changes needed    | Simulating multi-player games of TexasHoldem          |
