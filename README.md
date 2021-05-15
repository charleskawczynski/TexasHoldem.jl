# TexasHoldem.jl

|||
|---------------------:|:----------------------------------------------|
| **Docs Build**       | [![docs build][docs-bld-img]][docs-bld-url]   |
| **Documentation**    | [![dev][docs-dev-img]][docs-dev-url]          |
| **GHA CI**           | [![gha ci][gha-ci-img]][gha-ci-url]           |
| **Code Coverage**    | [![codecov][codecov-img]][codecov-url]        |
| **Bors enabled**     | [![bors][bors-img]][bors-url]                 |

[docs-bld-img]: https://github.com/charleskawczynski/TexasHoldem.jl/workflows/Documentation/badge.svg
[docs-bld-url]: https://github.com/charleskawczynski/TexasHoldem.jl/actions?query=workflow%3ADocumentation

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://charleskawczynski.github.io/TexasHoldem.jl/dev/

[gha-ci-img]: https://github.com/charleskawczynski/TexasHoldem.jl/workflows/ci/badge.svg
[gha-ci-url]: https://github.com/charleskawczynski/TexasHoldem.jl/actions?query=workflow%3Aci

[codecov-img]: https://codecov.io/gh/charleskawczynski/TexasHoldem.jl/branch/main/graph/badge.svg
[codecov-url]: https://codecov.io/gh/charleskawczynski/TexasHoldem.jl

[bors-img]: https://bors.tech/images/badge_small.svg
[bors-url]: https://app.bors.tech/repositories/32732

An experimental package for simulating no-limit Texas Holdem Poker. We're not registered yet, so install with

```julia-repl
(@v1.x) pkg> add https://github.com/charleskawczynski/TexasHoldem.jl
```

# Playing

Games can be played with:

```julia
using TexasHoldem
play!(configure_game())
```

# Creating your own bot

Four methods (variants of `player_option!`) need to be defined to create and play your own bot:

```julia
using TexasHoldem
import TexasHoldem
TH = TexasHoldem

struct MyBot <: AbstractAI end

function TH.player_option!(game::Game, player::Player{MyBot}, ::AbstractGameState, ::CheckRaiseFold)
    # options are:
    #    check!(game, player)
    #    raise!(game, player, amt::Float64)
    #    raise_all_in!(game, player)
    #    fold!(game, player)
    if rand() < 0.5
        check!(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        amt = TH.bound_raise(game.table, player, amt) # to properly bound raise amount
        raise_to!(game, player, amt)
    end
end
function TH.player_option!(game::Game, player::Player{MyBot}, ::AbstractGameState, ::CallRaiseFold)
    # options are:
    #    call!(game, player)
    #    raise!(game, player, amt::Float64)
    #    raise_all_in!(game, player)
    #    fold!(game, player)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            amt = Int(round(rand()*bank_roll(player), digits=0))
            amt = TH.bound_raise(game.table, player, amt) # to properly bound raise amount
            raise_to!(game, player, amt)
        end
    else
        fold!(game, player)
    end
end
function TH.player_option!(game::Game, player::Player{MyBot}, ::AbstractGameState, ::CallAllInFold)
    # options are:
    #    call!(game, player)
    #    raise_all_in!(game, player)
    #    fold!(game, player)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            raise_all_in!(game, player)
        end
    else
        fold!(game, player)
    end
end
function TH.player_option!(game::Game, player::Player{MyBot}, ::AbstractGameState, ::CallFold)
    # options are:
    #    call!(game, player)
    #    fold!(game, player)
    if rand() < 0.5
        call!(game, player)
    else
        fold!(game, player)
    end
end

# Heads-up against the MyBot!
play!(Game((Player(Human(), 1), Player(MyBot(), 2))))
```