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
using TexasHoldem
using TexasHoldem: Options
import TexasHoldem: get_action

struct MyBot <: AbstractStrategy end

function get_action(game::Game, player::Player{MyBot}, options::Options)
    if options.name == :CheckRaiseFold
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        return Check()
        # return Fold() # we can fold, but we can check for free
    elseif options.name == :CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        return Fold()
    elseif options.name == :CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game)
        return Fold()
    else
        @assert options.name == :CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    end
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
