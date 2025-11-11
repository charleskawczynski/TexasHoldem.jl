#####
##### Tester bots
#####

using TexasHoldem
using TexasHoldem: RoundState
import TexasHoldem
const TH = TexasHoldem

##### BotCheckFold
struct BotCheckFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckFold}, options::TH.Options)
    options == TH.CheckRaiseFold && return Check()
    options == TH.CallRaiseFold && return Fold()
    options == TH.CallAllInFold && return Fold()
    options == TH.CallFold && return Fold()
    error("Uncaught case")
end

##### BotCheckCall
struct BotCheckCall <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckCall}, options::TH.Options)
    options == TH.CheckRaiseFold && return Check()
    options == TH.CallRaiseFold && return Call(game)
    options == TH.CallAllInFold && return Call(game)
    options == TH.CallFold && return Call(game)
    error("Uncaught case")
end

##### BotFlopRaise
struct BotFlopRaise{T} <: AbstractStrategy
    amt::T
end
BotFlopRaise() = BotFlopRaise(nothing)
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{<:BotFlopRaise}, options::TH.Options)
    amt = player.strategy.amt isa Nothing ? floor(Int, bank_roll(player)/2) : player.strategy.amt
    round = game.table.round
    options == TH.CheckRaiseFold && return round == TH.RoundState.Flop ? RaiseTo(game, amt) : Check()
    options == TH.CallRaiseFold && return Call(game)
    options == TH.CallAllInFold && return Call(game)
    options == TH.CallFold && return Call(game)
    error("Uncaught case")
end

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{BotRaiseAllIn}, options::TH.Options)
    options == TH.CheckRaiseFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    options == TH.CallRaiseFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    options == TH.CallAllInFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    error("Uncaught case")
end

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{BotRaiseAlmostAllIn}, options::TH.Options)
    options == TH.CheckRaiseFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    options == TH.CallRaiseFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    options == TH.CallAllInFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    error("Uncaught case")
end

##### BotBetSB
struct BotBetSB <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotBetSB}, options::TH.Options)
    round = game.table.round
    options == TH.CheckRaiseFold && return round == RoundState.Preflop ? RaiseTo(game, TH.blinds(game).small) : RaiseTo(game, TH.blinds(game).small)
    options == TH.CallRaiseFold && return Call(game)
    options == TH.CallFold && return Call(game)
    error("Uncaught case")
end

##### BotBetBB
struct BotBetBB <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotBetBB}, options::TH.Options)
    round = game.table.round
    options == TH.CheckRaiseFold && return round == RoundState.Preflop ? RaiseTo(game, 2*TH.blinds(game).big) : RaiseTo(game, TH.blinds(game).big)
    options == TH.CallRaiseFold && return Call(game)
    options == TH.CallFold && return Call(game)
    error("Uncaught case")
end

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallRaiseFold}, options::TH.Options)
    @assert options == TH.CallRaiseFold "needed CallRaiseFold, got options: $(options)"
    return Check()
end

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallAllInFold}, options::TH.Options)
    @assert options == TH.CallAllInFold "needed CallAllInFold, got options: $(options)"
    return Check()
end

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallFold}, options::TH.Options)
    @assert options == TH.CallFold "needed CallFold, got options: $(options)"
    Check()
end

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCallOnCheckRaiseFold}, options::TH.Options)
    round = game.table.round
    options == TH.CallRaiseFold && return round == RoundState.Preflop ? Call(game) : Call(game)
    options == TH.CheckRaiseFold && return Call(game)
    error("Uncaught case")
end

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotRaiseOnCallFold}, options::TH.Options)
    @assert options == TH.CallFold "needed CallFold, got options: $(options)"
    return RaiseTo(game, bank_roll(player))
end

##### BotLimpAllIn
struct BotLimpAllIn <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotLimpAllIn}, options::TH.Options)
    return Call(game)
end

##### BotNActions
struct BotNActions <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotNActions}, options::TH.Options)
    if options == TH.CheckRaiseFold
        n_check_actions[1]+=1
        return Check()
    elseif options == TH.CallRaiseFold
        n_call_actions[1]+=1
        return Call(game)
    else
        error("Uncaught case")
    end
end

##### BotPreFlopRaise
struct BotPreFlopRaise{FT} <: AbstractStrategy
    amt::FT
end
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{<:BotPreFlopRaise}, options::TH.Options)
    round = game.table.round
    options == TH.CheckRaiseFold && return round == RoundState.Preflop ? RaiseTo(game, TH.strategy(player).amt) : Check()
    options == TH.CallRaiseFold && return RaiseTo(game, TH.strategy(player).amt)
    options == TH.CallAllInFold && return Call(game)
    options == TH.CallFold && return Call(game)
    error("Uncaught case")
end
