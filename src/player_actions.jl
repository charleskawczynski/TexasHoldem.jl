#####
##### Player actions
#####

export Fold, Check, Call, Raise, AllIn
export call_amount, valid_raise_range

"""
    Ready()
The action used to pass to `play` when first starting a game.
"""
Ready() = Action(:ready, 0)

"""
    Fold()

The fold action, to be returned from [`player_option`](@ref),
when a player wants to fold.
"""
Fold() = Action(:fold, 0)

"""
    Check()

The check action, to be returned from [`player_option`](@ref),
when a player wants to check.
"""
Check() = Action(:check, 0)

"""
    Call(amt::Int)
    Call(table::Table, player::Player)

The call action, should be returned from [`player_option`](@ref).
when a player wants to call amount `amt`.

Use [`call_amount`](@ref) to query how much is needed to call.
"""
Call(amt::Int) = Action(:call, amt)
Call(game::Game, player::Player) = Call(game.table, player)
function Call(table::Table, player::Player)
    call_amt = call_amount(table, player)
    amt = call_amt ≤ bank_roll(player) ? call_amt : bank_roll(player)
    return Call(amt)
end

"""
    Raise(amt::Int)

The raise action, should be returned from [`player_option`](@ref).
when a player wants to raise to amount `amt`.

Use [`valid_raise_range`](@ref) to query the valid range
that they are allowed to raise.
"""
function Raise(amt::Int)
    @assert amt > 0 "Cannot raise less than 0!"
    Action(:raise, amt)
end

"""
    AllIn(amt::Int)
    AllIn(table::Table, player::Player)

The all-in action, should be returned from [`player_option`](@ref).
when a player wants to raise all in (to amount `amt`).

Users may call this via `AllIn(last(valid_raise_range(table, player)))`
or use the convenience function `AllIn(table, player)`.

See [`valid_raise_range`](@ref) for querying the valid range
that they are allowed to raise.
"""
function AllIn(amt::Int)
    @assert amt > 0 "Cannot raise less than 0!"
    Action(:all_in, amt)
end
AllIn(table::Table, player::Player) = # convenience function
    AllIn(last(valid_raise_range(table, player)))

"""
    call_amount(table::Table, player::Player)

Return the amount to call inside [`player_option`](@ref).
"""
function call_amount(table::Table, player::Player)
    cra = current_raise_amt(table)
    prc = round_contribution(player)
    call_amt = cra - prc
    logger = table.logger
    @cdebug logger "current_raise_amt = $cra, round_contribution = $prc, call_amt = $call_amt"
    if cra == 0
        @assert prc == 0 "Round contribution must be zero if current raise is zero."
    end
    @assert !(call_amt < 0) "Call amount cannot be negative"
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

"""
    valid_raise_range(table::Table, player::Player)

A `UnitRange{Int}` of valid raises. Note that
sometimes the range's starting and ending values
are the same when, for example, all-in is the
only available option.
"""
function valid_raise_range(table::Table, player::Player)
    cra = current_raise_amt(table)
    irra = initial_round_raise_amt(table)
    mra = minimum_raise_amt(table)
    rbr = round_bank_roll(player)
    max_orbr = max_opponent_round_bank_roll(table, player)
    logger = table.logger
    lim = cra == 0 ? mra : (cra+irra)
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
        s*="determining valid_raise_range\n"
        s*="   round_bank_roll = $rbr\n"
        s*="   max_opponent_round_bank_roll = $max_orbr\n"
        s*="   current_raise_amt == 0 = $(cra == 0)\n"
        s*="   amt_computed = $amt_computed\n"
        s*="   check = $check\n"
        s*="   max_opponent_round_bank_roll > rbr = $(max_orbr > rbr)\n"
        s*="   initial_round_raise_amt = $irra\n"
        s*="   current_raise_amt = $cra\n"
        s*="   (round_bank_roll - bank_roll) = $Δbr\n"
        s*="   (current_raise_amt + initial_round_raise_amt) = $(cra+irra)\n"
        s*="   bank_roll = $(bank_roll(player))\n"
        s*="   round_contribution = $(round_contribution(player))\n"
        s*="   lim = $lim\n"
        s*="   (minraise:maxraise) = $vrr"
        s
    end
    @assert maxraise ≥ minraise "Min valid raise bound must be ≤ max valid raise bound."
    return (minraise:maxraise)
end
