#####
##### Tester bots
#####

using TexasHoldem
import TexasHoldem
const TH = TexasHoldem
const AGS = AbstractRound

##### BotCheckFold
struct BotCheckFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckFold}, ::AGS, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallRaiseFold) = Fold()
TH.player_option(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallAllInFold) = Fold()
TH.player_option(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallFold) = Fold()

##### BotCheckCall
struct BotCheckCall <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckCall}, ::AGS, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallFold) = Call(game.table, player)

##### BotFlopRaise
struct BotFlopRaise <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallFold) = Call(game.table, player)

TH.player_option(game::Game, player::Player{BotFlopRaise}, ::Flop, ::CheckRaiseFold) = Raise(Int(bank_roll(player)/2))

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CheckRaiseFold) = Raise(last(valid_raise_range(game.table, player)))
TH.player_option(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CallRaiseFold) = Raise(last(valid_raise_range(game.table, player)))
TH.player_option(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CallAllInFold) = Raise(last(valid_raise_range(game.table, player)))

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CheckRaiseFold) = Raise(Int(0.9*round_bank_roll(player)))
TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CallRaiseFold) = Raise(Int(0.9*round_bank_roll(player)))
TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CallAllInFold) = Raise(Int(0.9*round_bank_roll(player)))

##### BotBetSB
struct BotBetSB <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotBetSB}, ::AGS, ::CheckRaiseFold) = Raise(TH.blinds(game).small)
TH.player_option(game::Game, player::Player{BotBetSB}, ::PreFlop, ::CheckRaiseFold) = Raise(TH.blinds(game).small)
TH.player_option(game::Game, player::Player{BotBetSB}, ::AGS, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotBetSB}, ::AGS, ::CallFold) = Call(game.table, player)

##### BotBetBB
struct BotBetBB <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotBetBB}, ::PreFlop, ::CheckRaiseFold) = Raise(2*TH.blinds(game).big)
TH.player_option(game::Game, player::Player{BotBetBB}, ::AGS, ::CheckRaiseFold) = Raise(TH.blinds(game).big)
TH.player_option(game::Game, player::Player{BotBetBB}, ::AGS, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotBetBB}, ::AGS, ::CallFold) = Call(game.table, player)

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallRaiseFold}, ::AGS, ::CallRaiseFold) = Check()

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallAllInFold}, ::AGS, ::CallAllInFold) = Check()

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallFold}, ::AGS, ::CallFold) = Check()

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCallOnCheckRaiseFold}, ::PreFlop, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCallOnCheckRaiseFold}, ::AGS, ::CheckRaiseFold) = Call(game.table, player)

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotRaiseOnCallFold}, ::AGS, ::CallFold) = Raise(bank_roll(player))

##### BotLimpAllIn
struct BotLimpAllIn <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotLimpAllIn}, ::AGS, ::AbstractPlayerOptions) = Call(game.table, player)

##### BotNActions
struct BotNActions <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotNActions}, ::AGS, ::CheckRaiseFold)
    n_check_actions[1]+=1
    Check()
end

function TH.player_option(game::Game, player::Player{BotNActions}, ::AGS, ::CallRaiseFold)
    n_call_actions[1]+=1
    Call(game.table, player)
end

##### BotPreFlopRaise
struct BotPreFlopRaise{FT} <: AbstractStrategy
    amt::FT
end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, ::AGS, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, ::AGS, ::CallRaiseFold) = Raise(TH.strategy(player).amt)
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, ::AGS, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, ::AGS, ::CallFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, ::PreFlop, ::CheckRaiseFold) = Raise(TH.strategy(player).amt)
