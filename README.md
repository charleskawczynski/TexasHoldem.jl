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

Four methods (variants of `player_option`) need to be defined to create and play your own bot:

```julia
using TexasHoldem
import TexasHoldem: player_option

struct MyBot <: AbstractStrategy end

function player_option(game::Game, player::Player{MyBot}, ::CheckRaiseFold)
    # options:
    rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
    return Check()
    # return Fold() # we can fold, but we can check for free
end
function player_option(game::Game, player::Player{MyBot}, ::CallRaiseFold)
    # options:
    rand() < 0.5 && return Call(game.table, player)
    rand() < 0.5 && return Raise(rand(valid_raise_range(game.table, player)))
    return Fold()
end
function player_option(game::Game, player::Player{MyBot}, ::CallAllInFold)
    # options:
    rand() < 0.5 && return Call(game.table, player)
    rand() < 0.5 && return AllIn(game.table, player)
    return Fold()
end
function player_option(game::Game, player::Player{MyBot}, ::CallFold)
    # options:
    rand() < 0.5 && return Call()
    return Fold()
end

# Heads-up against MyBot!
tournament!(Game((Player(Human(), 1), Player(MyBot(), 2))))
```

## Related packages

| Package                                                                             |  Development status      |         Purpose                                       |
|------------------------------------------------------------------------------------:|:------------------------:|:------------------------------------------------------|
| [PlayingCards.jl](https://github.com/charleskawczynski/PlayingCards.jl)             | Perhaps stable           | Representing cards                                    |
| [PokerHandEvaluator.jl](https://github.com/charleskawczynski/PokerHandEvaluator.jl) | Perhaps stable           | Comparing any two 5-7 card hands                      |
| [TexasHoldem.jl](https://github.com/charleskawczynski/TexasHoldem.jl)               | Likely changes needed    | Simulating multi-player games of TexasHoldem          |
| [PokerBots.jl](https://github.com/charleskawczynski/PokerBots.jl)                   | _very_ early development | Battling bots with prescribed (or learned) strategies |
| [PokerGUI.jl](https://github.com/charleskawczynski/PokerGUI.jl)                     | _very_ early development | Visualizing TexasHoldem games via a GUI               |
