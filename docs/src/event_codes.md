# Event codes

If you're training a neural net using TexasHoldem.jl, then you may need a
lossless game log. Here is an example of how you can enable the event code
logging, which will result in collected event codes during game play.


```julia
import TexasHoldem as TH
struct MyBot <: TH.AbstractStrategy end

function TH.get_action(game::TH.Game, player::TH.Player{MyBot}, options::TH.Options)
    if options.name == :CheckRaiseFold
        rand() < 0.5 && return TH.RaiseTo(game, rand(TH.valid_total_bet_range(game)))
        return TH.Check()
        # return TH.Fold() # we can fold, but we can check for free
    elseif options.name == :CallRaiseFold
        rand() < 0.5 && return TH.Call(game)
        rand() < 0.5 && return TH.RaiseTo(game, rand(TH.valid_total_bet_range(game)))
        return TH.Fold()
    elseif options.name == :CallAllInFold
        rand() < 0.5 && return TH.Call(game)
        rand() < 0.5 && return TH.AllIn(game)
        return TH.Fold()
    else
        @assert options.name == :CallFold
        rand() < 0.5 && return TH.Call(game)
        return TH.Fold()
    end
end

import Logging
players = (TH.Player(TH.Human(), 1), TH.Player(MyBot(), 2));

## Critical part:
game = TH.Game(
	players;
	gui=TH.NoGUI(),
	logger=TH.InfoLogger(;
		msg_collector = TH.HumanReadableMessageCollector(Logging.Info; send_to_stdout=false, prepend_msg="GAME_LOG: "),
		event_code_collector = TH.EventCodeCollector(Logging.Info; send_to_stdout=true, prepend_msg="EVENT_CODE: ")
	)
)
TH.tournament!(game)
```


```@docs
TexasHoldem.EventCode
```

## 1. Primary Event Codes

This table defines the main events that structure the game log.
A log is a `Vector{Vector{Int}}`.

| Event Code | Event Name      | Format `[CODE, ...]`                     | Description                                  |
| :---       | :---            | :---                                     | :---                                         |
| `-1`       | Player Stack    | `[-1, player_seat, stack_size]`          | Sets the starting stack for a player.        |
| `-2`       | Set Blinds      | `[-2, button_seat, sb_amt, bb_amt]`      | Defines the blinds and button for the hand.  |
| `-3`       | Deal Hole Cards | `[-3, player_seat, card_1, card_2]`      | Deals two private cards to a player.         |
| `-4`       | Player Action   | `[-4, player_seat, action_code, amount]` | A player takes a betting action.             |
| `-5`       | Deal Flop       | `[-5, card_1, card_2, card_3]`           | Deals the three flop cards.                  |
| `-6`       | Deal Turn       | `[-6, card_1]`                           | Deals the single turn card.                  |
| `-7`       | Deal River      | `[-7, card_1]`                           | Deals the single river card.                 |
| `-8`       | Winnings        | `[-8, player_seat, amount_won]`          | A player wins an amount from the pot.        |

---

```@docs
TexasHoldem.ActionCode
```

## 2. Action Codes (for Event `-4`)

This table defines the `action_code` used in the `[-4, player_seat, action_code, amount]` event.

| Action Code | Action Name | `amount` in `[-4, ...]`                   |
| :---        | :---        | :---                                      |
| `1`         | Fold        | `0`                                       |
| `2`         | Check       | `0`                                       |
| `3`         | Call        | The total amount called (e.g., `2`).      |
| `4`         | Raise To    | The total amount of the bet (e.g., `6`).  |
| `5`         | All-In      | The total amount of the all-in bet.       |

