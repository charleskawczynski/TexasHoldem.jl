#####
##### Tester bots
#####

using TexasHoldem
import TexasHoldem
const TH = TexasHoldem

##### BotCheckFold
struct BotCheckFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCheckFold}, options)
    on = options.name
    on == :CheckRaiseFold && return Check()
    on == :CallRaiseFold && return Fold()
    on == :CallAllInFold && return Fold()
    on == :CallFold && return Fold()
    error("Uncaught case")
end

##### BotCheckCall
struct BotCheckCall <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCheckCall}, options)
    on = options.name
    on == :CheckRaiseFold && return Check()
    on == :CallRaiseFold && return Call(game.table, player)
    on == :CallAllInFold && return Call(game.table, player)
    on == :CallFold && return Call(game.table, player)
    error("Uncaught case")
end

##### BotFlopRaise
struct BotFlopRaise{T} <: AbstractStrategy
    amt::T
end
BotFlopRaise() = BotFlopRaise(nothing)
# Call blind / check pre-flop, raise on flop

function TH.player_option(game::Game, player::Player{<:BotFlopRaise}, options)
    amt = player.strategy.amt isa Nothing ? floor(Int, bank_roll(player)/2) : player.strategy.amt
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :flop ? Raise(amt) : Check()
    on == :CallRaiseFold && return Call(game.table, player)
    on == :CallAllInFold && return Call(game.table, player)
    on == :CallFold && return Call(game.table, player)
    error("Uncaught case")
end

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.player_option(game::Game, player::Player{BotRaiseAllIn}, options)
    on = options.name
    on == :CheckRaiseFold && return Raise(last(valid_raise_range(game.table, player)))
    on == :CallRaiseFold && return Raise(last(valid_raise_range(game.table, player)))
    on == :CallAllInFold && return Raise(last(valid_raise_range(game.table, player)))
    error("Uncaught case")
end

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractStrategy end
# Call blind / check pre-flop, raise on flop

function TH.player_option(game::Game, player::Player{BotRaiseAlmostAllIn}, options)
    on = options.name
    on == :CheckRaiseFold && return Raise(Int(0.9*round_bank_roll(player)))
    on == :CallRaiseFold && return Raise(Int(0.9*round_bank_roll(player)))
    on == :CallAllInFold && return Raise(Int(0.9*round_bank_roll(player)))
    error("Uncaught case")
end

##### BotBetSB
struct BotBetSB <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotBetSB}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? Raise(TH.blinds(game).small) : Raise(TH.blinds(game).small)
    on == :CallRaiseFold && return Call(game.table, player)
    on == :CallFold && return Call(game.table, player)
    error("Uncaught case")
end

##### BotBetBB
struct BotBetBB <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotBetBB}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? Raise(2*TH.blinds(game).big) : Raise(TH.blinds(game).big)
    on == :CallRaiseFold && return Call(game.table, player)
    on == :CallFold && return Call(game.table, player)
    error("Uncaught case")
end

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCheckOnCallRaiseFold}, options)
    @assert options.name == :CallRaiseFold
    return Check()
end

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCheckOnCallAllInFold}, options)
    @assert options.name == :CallAllInFold
    return Check()
end

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCheckOnCallFold}, options)
    @assert options.name == :CallFold
    Check()
end

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotCallOnCheckRaiseFold}, options)
    round = game.table.round
    on = options.name
    on == :CallRaiseFold && return round == :preflop ? Call(game.table, player) : Call(game.table, player)
    on == :CheckRaiseFold && return Call(game.table, player)
    error("Uncaught case")
end

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotRaiseOnCallFold}, options)
    @assert options.name == :CallFold
    return Raise(bank_roll(player))
end

##### BotLimpAllIn
struct BotLimpAllIn <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotLimpAllIn}, options)
    return Call(game.table, player)
end

##### BotNActions
struct BotNActions <: AbstractStrategy end

function TH.player_option(game::Game, player::Player{BotNActions}, options)
    if options.name == :CheckRaiseFold
        n_check_actions[1]+=1
        return Check()
    elseif options.name == :CallRaiseFold
        n_call_actions[1]+=1
        return Call(game.table, player)
    else
        error("Uncaught case")
    end
end

##### BotPreFlopRaise
struct BotPreFlopRaise{FT} <: AbstractStrategy
    amt::FT
end
# Call blind / check pre-flop, raise on flop

function TH.player_option(game::Game, player::Player{<:BotPreFlopRaise}, options)
    round = game.table.round
    on = options.name
    on == :CheckRaiseFold && return round == :preflop ? Raise(TH.strategy(player).amt) : Check()
    on == :CallRaiseFold && return Raise(TH.strategy(player).amt)
    on == :CallAllInFold && return Call(game.table, player)
    on == :CallFold && return Call(game.table, player)
    error("Uncaught case")
end
