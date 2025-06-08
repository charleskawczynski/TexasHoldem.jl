#####
##### Player actions
#####

export Fold, Check, Call, Raise, RaiseTo, AllIn
export call_amount, valid_total_bet_range

"""
    Fold()

The fold action, to be returned from [`get_action`](@ref),
when a player wants to fold.
"""
Fold() = Action(:fold, 0)

"""
    Check()

The check action, to be returned from [`get_action`](@ref),
when a player wants to check.
"""
Check() = Action(:check, 0)

"""
    Call(game::Game)

The call action, should be returned from [`get_action`](@ref).
when a player wants to call amount `amt`.

Use [`call_amount`](@ref) to query how much is needed to call.
"""
Call(amt::Int) = Action(:call, amt)
Call(game::Game) = Call(game.table, current_player(game))
Call(game::Game, player::Player) = Call(game.table, player)
function Call(table::Table, player::Player)
    call_amt = call_amount(table, player)
    amt = call_amt ≤ bank_roll(player) ? call_amt : bank_roll(player)
    return Call(amt)
end

"""
    RaiseTo(game::Game, total_bet::Int)

The raise-to action, should be returned from [`get_action`](@ref).
when a player wants to raise the current total bet amount
to `total_bet`.

Use [`valid_total_bet_range`](@ref) to query the valid range
that they are allowed to raise.

When a player returns `RaiseTo(game, 5)`, this means that they want to
raise the current total bet to 5.
"""
function RaiseTo(table::Table, player::Player, total_bet::Int)
    # `total_bet` is validated in `validate_action` so that
    # users can handle this gracefully
    Action(:raiseto, total_bet)
end
RaiseTo(game::Game, total_bet::Int) =
    RaiseTo(game.table, current_player(game), total_bet)

"""
    Raise(game::Game, amt::Int)

The raise action, should be returned from [`get_action`](@ref).
when a player wants to raise to amount `amt`.

Use [`valid_total_bet_range`](@ref) to query the valid range
that they are allowed to raise.

When a player returns `Raise(5)`, this means that they want to
raise 5 above the current total bet.
"""
function Raise(game::Game, amt::Int)
    error("Raise has been deprecated. We plan to add support please use RaiseTo")
    # @assert amt > 0 "Cannot raise less than 0!"
    # Action(:raiseto, amt)
end

"""
    AllIn(game::Game)

The all-in action, should be returned from [`get_action`](@ref).
when a player wants to raise all-in.

`action = AllIn(game)` will contain the amount to go all-in.

Users may call this via `AllIn(game)`.

See [`valid_total_bet_range`](@ref) for querying the valid range
that they are allowed to raise.
"""
function AllIn(amt::Int)
    @assert amt > 0 "Cannot raise less than 0!"
    Action(:all_in, amt)
end
AllIn(table::Table, player::Player) = # convenience function
    AllIn(last(valid_total_bet_range(table, player)))

AllIn(game::Game) = AllIn(game.table, current_player(game))

call_amount(game::Game) = call_amount(game.table, current_player(game))

"""
    call_amount(table::Table, player::Player)

Return the amount to call inside [`get_action`](@ref).
"""
function call_amount(table::Table, player::Player)
    tb = total_bet(table)
    rc = round_contribution(player)
    call_amt = tb - rc
    logger = table.logger
    @cdebug logger "total_bet = $tb, round_contribution = $rc, call_amt = $call_amt"
    if tb == 0
        @assert rc == 0 "Round contribution must be zero if the total bet is zero."
    end
    @assert !(call_amt < 0) "Call amount cannot be negative. call_amt: $call_amt, round_contribution: $rc"
    return call_amt
end

function max_opponent_round_bank_roll(table::Table, player::Player)
    max_orbr = 0
    for opponent in players_at_table(table)
        seat_number(opponent) == seat_number(player) && continue
        not_playing(opponent) && continue
        all_in(opponent) && continue
        max_orbr = max(max_orbr, round_bank_roll(opponent))
    end
    return max_orbr
end

valid_total_bet_range(game::Game) =
    valid_total_bet_range(game.table, current_player(game))

"""
    valid_total_bet_range(table::Table, player::Player)

A `UnitRange{Int}` of valid raises. Note that
sometimes the range's starting and ending values
are the same when, for example, all-in is the
only available option.
"""
function valid_total_bet_range(table::Table, player::Player)
    tb = total_bet(table)
    irra = initial_round_raise_amount(table)
    mra = minimum_raise_amount(table)
    rbr = round_bank_roll(player)
    max_orbr = max_opponent_round_bank_roll(table, player)
    logger = table.logger
    lim = tb == 0 ? mra : (tb+irra)
    @cdebug logger "   lim = $lim"
    br₀ = min(max_orbr, rbr)
    vrr = lim > br₀ ? (br₀, br₀) : (lim, br₀) # somewhat like clamp
    minraise = first(vrr)
    maxraise = last(vrr)
    @cdebug logger begin
        Δbr = rbr - bank_roll(player)
        amt_computed = rbr - round_contribution(player)
        check = amt_computed ≤ bank_roll(player)
        s = ""
        s*="determining valid_total_bet_range\n"
        s*="   round_bank_roll = $rbr\n"
        s*="   max_opponent_round_bank_roll = $max_orbr\n"
        s*="   total_bet == 0 = $(tb == 0)\n"
        s*="   amt_computed = $amt_computed\n"
        s*="   check = $check\n"
        s*="   max_opponent_round_bank_roll > rbr = $(max_orbr > rbr)\n"
        s*="   initial_round_raise_amount = $irra\n"
        s*="   total_bet = $tb\n"
        s*="   (round_bank_roll - bank_roll) = $Δbr\n"
        s*="   (total_bet + initial_round_raise_amount) = $(tb+irra)\n"
        s*="   bank_roll = $(bank_roll(player))\n"
        s*="   round_contribution = $(round_contribution(player))\n"
        s*="   lim = $lim\n"
        s*="   (minraise:maxraise) = $vrr"
        s
    end
    if !(maxraise == minraise == bank_roll(player))
        # We can accept a raise below minimum_raise_amount
        # if it exactly puts us all-in
        @assert maxraise ≥ minraise "Min valid raise bound must be ≤ max valid raise bound."
    end
    return (minraise:maxraise)
end
