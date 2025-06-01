#####
##### Tester bots
#####

using TexasHoldem
import TexasHoldem
const TH = TexasHoldem

##### BotCheckFold
struct BotCheckFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckFold}, round, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{BotCheckFold}, round, ::CallRaiseFold) = Fold()
TH.player_option(game::Game, player::Player{BotCheckFold}, round, ::CallAllInFold) = Fold()
TH.player_option(game::Game, player::Player{BotCheckFold}, round, ::CallFold) = Fold()

##### BotCheckCall
struct BotCheckCall <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckCall}, round, ::CheckRaiseFold) = Check()
TH.player_option(game::Game, player::Player{BotCheckCall}, round, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCheckCall}, round, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCheckCall}, round, ::CallFold) = Call(game.table, player)

##### BotFlopRaise
struct BotFlopRaise <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotFlopRaise}, round, ::CheckRaiseFold) = round == :flop ? Raise(Int(bank_roll(player)/2)) : Check()
TH.player_option(game::Game, player::Player{BotFlopRaise}, round, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotFlopRaise}, round, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotFlopRaise}, round, ::CallFold) = Call(game.table, player)

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotRaiseAllIn}, round, ::CheckRaiseFold) = Raise(last(valid_raise_range(game.table, player)))
TH.player_option(game::Game, player::Player{BotRaiseAllIn}, round, ::CallRaiseFold) = Raise(last(valid_raise_range(game.table, player)))
TH.player_option(game::Game, player::Player{BotRaiseAllIn}, round, ::CallAllInFold) = Raise(last(valid_raise_range(game.table, player)))

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, round, ::CheckRaiseFold) = Raise(Int(0.9*round_bank_roll(player)))
TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, round, ::CallRaiseFold) = Raise(Int(0.9*round_bank_roll(player)))
TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, round, ::CallAllInFold) = Raise(Int(0.9*round_bank_roll(player)))

##### BotBetSB
struct BotBetSB <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotBetSB}, round, ::CheckRaiseFold) = round == :preflop ? Raise(TH.blinds(game).small) : Raise(TH.blinds(game).small)
TH.player_option(game::Game, player::Player{BotBetSB}, round, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotBetSB}, round, ::CallFold) = Call(game.table, player)

##### BotBetBB
struct BotBetBB <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotBetBB}, round, ::CheckRaiseFold) = round == :preflop ? Raise(2*TH.blinds(game).big) : Raise(TH.blinds(game).big)
TH.player_option(game::Game, player::Player{BotBetBB}, round, ::CallRaiseFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{BotBetBB}, round, ::CallFold) = Call(game.table, player)

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallRaiseFold}, round, ::CallRaiseFold) = Check()

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallAllInFold}, round, ::CallAllInFold) = Check()

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCheckOnCallFold}, round, ::CallFold) = Check()

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotCallOnCheckRaiseFold}, round, ::CallRaiseFold) = round == :preflop ? Call(game.table, player) : Call(game.table, player)
TH.player_option(game::Game, player::Player{BotCallOnCheckRaiseFold}, round, ::CheckRaiseFold) = Call(game.table, player)

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotRaiseOnCallFold}, round, ::CallFold) = Raise(bank_roll(player))

##### BotLimpAllIn
struct BotLimpAllIn <: AbstractStrategy end

TH.player_option(game::Game, player::Player{BotLimpAllIn}, round, ::AbstractPlayerOptions) = Call(game.table, player)

##### BotNActions
struct BotNActions <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotNActions}, round, ::CheckRaiseFold)
    n_check_actions[1]+=1
    Check()
end

function TH.player_option(game::Game, player::Player{BotNActions}, round, ::CallRaiseFold)
    n_call_actions[1]+=1
    Call(game.table, player)
end

##### BotPreFlopRaise
struct BotPreFlopRaise{FT} <: AbstractStrategy
    amt::FT
end
# Call blind / check pre-flop, raise on flop

TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, round, ::CheckRaiseFold) = round == :preflop ? Raise(TH.strategy(player).amt) : Check()
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, round, ::CallRaiseFold) = Raise(TH.strategy(player).amt)
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, round, ::CallAllInFold) = Call(game.table, player)
TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, round, ::CallFold) = Call(game.table, player)
