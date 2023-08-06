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

## Player type
```@docs
AbstractStrategy
Human
Bot5050
Player
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
