#####
##### Tester bots
#####

using TexasHoldem
import TexasHoldem
const TH = TexasHoldem

##### BotCheckFold
struct BotCheckFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckFold}, options)
    on = options.name
    on == :CheckRaiseFold && return Check()
    on == :CallRaiseFold && return Fold()
    on == :CallAllInFold && return Fold()
    on == :CallFold && return Fold()
    error("Uncaught case")
end

##### BotCheckCall
struct BotCheckCall <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckCall}, options)
    on = options.name
    on == :CheckRaiseFold && return Check()
    on == :CallRaiseFold && return Call(game)
    on == :CallAllInFold && return Call(game)
    on == :CallFold && return Call(game)
    error("Uncaught case")
end

##### BotFlopRaise
struct BotFlopRaise{T} <: AbstractStrategy
    amt::T
end
BotFlopRaise() = BotFlopRaise(nothing)
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{<:BotFlopRaise}, options)
    amt = player.strategy.amt isa Nothing ? floor(Int, bank_roll(player)/2) : player.strategy.amt
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :flop ? RaiseTo(game, amt) : Check()
    on == :CallRaiseFold && return Call(game)
    on == :CallAllInFold && return Call(game)
    on == :CallFold && return Call(game)
    error("Uncaught case")
end

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{BotRaiseAllIn}, options)
    on = options.name
    on == :CheckRaiseFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    on == :CallRaiseFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    on == :CallAllInFold && return RaiseTo(game, last(valid_total_bet_range(game)))
    error("Uncaught case")
end

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.get_action(game::Game, player::Player{BotRaiseAlmostAllIn}, options)
    on = options.name
    on == :CheckRaiseFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    on == :CallRaiseFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    on == :CallAllInFold && return RaiseTo(game, floor(Int, 0.9*round_bank_roll(player)))
    error("Uncaught case")
end

##### BotBetSB
struct BotBetSB <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotBetSB}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? RaiseTo(game, TH.blinds(game).small) : RaiseTo(game, TH.blinds(game).small)
    on == :CallRaiseFold && return Call(game)
    on == :CallFold && return Call(game)
    error("Uncaught case")
end

##### BotBetBB
struct BotBetBB <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotBetBB}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? RaiseTo(game, 2*TH.blinds(game).big) : RaiseTo(game, TH.blinds(game).big)
    on == :CallRaiseFold && return Call(game)
    on == :CallFold && return Call(game)
    error("Uncaught case")
end

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallRaiseFold}, options)
    @assert options.name == :CallRaiseFold "needed :CallRaiseFold, got options.name: $(options.name)"
    return Check()
end

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallAllInFold}, options)
    @assert options.name == :CallAllInFold "needed :CallAllInFold, got options.name: $(options.name)"
    return Check()
end

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCheckOnCallFold}, options)
    @assert options.name == :CallFold "needed :CallFold, got options.name: $(options.name)"
    Check()
end

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotCallOnCheckRaiseFold}, options)
    round = game.table.round
    on = options.name
    on == :CallRaiseFold && return round == :preflop ? Call(game) : Call(game)
    on == :CheckRaiseFold && return Call(game)
    error("Uncaught case")
end

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotRaiseOnCallFold}, options)
    @assert options.name == :CallFold "needed :CallFold, got options.name: $(options.name)"
    return RaiseTo(game, bank_roll(player))
end

##### BotLimpAllIn
struct BotLimpAllIn <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotLimpAllIn}, options)
    return Call(game)
end

##### BotNActions
struct BotNActions <: AbstractStrategy end

function TH.get_action(game::Game, player::Player{BotNActions}, options)
    if options.name == :CheckRaiseFold
        n_check_actions[1]+=1
        return Check()
    elseif options.name == :CallRaiseFold
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

function TH.get_action(game::Game, player::Player{<:BotPreFlopRaise}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? RaiseTo(game, TH.strategy(player).amt) : Check()
    on == :CallRaiseFold && return RaiseTo(game, TH.strategy(player).amt)
    on == :CallAllInFold && return Call(game)
    on == :CallFold && return Call(game)
    error("Uncaught case")
end
