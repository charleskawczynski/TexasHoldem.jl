# API

```@docs
TexasHoldem
```

## Game-level functions
```@docs
move_buttons
play
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

```@docs
TexasHoldem.Action
Check
Fold
Call
call_amount
Raise
AllIn
valid_raise_range
```

## Player options

```@docs
TexasHoldem.AbstractPlayerOptions
TexasHoldem.CheckRaiseFold
TexasHoldem.CallRaiseFold
TexasHoldem.CallAllInFold
TexasHoldem.CallFold
TexasHoldem.player_option
```

## Training

There are additional functionalities added for training purposes

```@docs
TexasHoldem.recreate_game
```
