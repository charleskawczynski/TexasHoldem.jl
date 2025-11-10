# API

```@docs
TexasHoldem
```

## Game-level functions
```@docs
move_buttons!
play!
tournament!
```

## Chips

```@docs
Chips
```

## Player type and methods

```@docs
AbstractStrategy
Human
Bot5050
Player
bank_roll
bank_roll_chips
round_bank_roll
```

## Player actions

The call, raise, and all-in functions follow the convetion:

 - `call_amount = total_bet - round_contribution`
 - `pot_investment = sum(round_contribution, rounds)`
 - `pot` the sum of all round contributions
 - `initial_round_raise_amount` minimum raise amount for all betting cycles in the round
 - `minimum_raise_amount` the minimum raise amount.
 - `Call(game)` will match the amount of the last bet made in the current betting round. By calling, you stay in the hand.
 - `RaiseTo(game, 5)` raise the current total bet to 5.
 - `AllIn(game)` raise all-in (all of your remaining chips). Note that `AllIn(game).amt` will contain the raise _above_ the current total bet.
 - `bank_roll(game)`

```@docs
TexasHoldem.Action
TexasHoldem.ActionType
Check
Fold
Call
call_amount
RaiseTo
AllIn
valid_total_bet_range
TexasHoldem.get_action
```

Additional helpers:
```@docs
TexasHoldem.total_bet
TexasHoldem.is_valid_action
TexasHoldem.validate_action
TexasHoldem.round_contribution
```

## Player options

```@docs
TexasHoldem.Options
TexasHoldem.get_options
```

## Action and Options symbols

An `Action` has an `action_type` and an amount `amt`. The `action_type` is an `enum` type, with the following values:

 - `Fold`
 - `Check`
 - `Call`
 - `Raise`
 - `AllIn`

The allowable `enum` `Options` are:

 - `NoOptions`
 - `CheckRaiseFold`
 - `CallRaiseFold`
 - `CallAllInFold`
 - `CallFold`

`get_options(game::Game)` will always yield a valid `Options` object, TexasHoldem
cannot guarantee that a user will yield a valid action. Use
`is_valid_action(game::Game, action::Action, options::Options)::Bool` to determine if a given
action is valid or not.

## Training

There are additional functionalities added for training purposes

```@docs
TexasHoldem.recreate_game
```
