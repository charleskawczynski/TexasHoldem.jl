#####
##### Player actions
#####

export Fold, Check, Call, Raise, AllIn
export call_amount, valid_raise_range

"""
    Action

An action type, to be returned by [`player_option`](@ref)
during each players turn to act. This is an internal
type, but documented for user understanding.

Users are expected to return an action from
[`player_option`](@ref) by calling one of `Action`'s
convenience methods:

 - [`Fold`](@ref)
 - [`Check`](@ref)
 - [`Call`](@ref)
 - [`Raise`](@ref)
 - [`AllIn`](@ref)
"""
struct Action
    name::Symbol
    amt::Int
end

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

Use [`valid_raise_range`](@ref) to query the valid range that
they are allowed to raise.
"""
function Raise(amt::Int)
    @assert amt > 0 "Cannot raise less than 0!"
    Action(:raise, amt)
end

"""
    AllIn(amt::Int)
    AllIn(table::Table, player::Player)

The call action, should be returned from [`player_option`](@ref).
when a player wants to raise to amount `amt`.

When `AllIn` is a player's only raise option, [`valid_raise_range`](@ref)
will return a unit range of `br:br`, which is the player's
appropriate (i.e., allowable) all-in bet.

For example, if players A and B have 150 and 100 bank rolls
respectively, and player B bets 100, then player A's all-in
raise amount would be 50 (on-top of the 100 call). This number
is determined automatically.

So, users may simply use `AllIn(table, player)`, which enters
`last(valid_raise_range(table, player))` as the amount.
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
    @cdebug logger "cra = $cra, prc = $prc, call_amt = $call_amt"
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
sometimes the range is `n:n` when all-in is the
only available option.

See `valid_raise_range_simple` in the test suite
for a more verbose but simpler implementation.
"""
function valid_raise_range(table::Table, player::Player)
    cra = current_raise_amt(table)
    irra = initial_round_raise_amt(table)
    mra = minimum_raise_amt(table)
    rbr = round_bank_roll(player)
    max_orbr = max_opponent_round_bank_roll(table, player)
    logger = table.logger
    @cdebug logger begin
        Δbr = rbr - bank_roll(player)
        amt_computed = rbr - round_contribution(player)
        check = amt_computed ≤ bank_roll(player)
        s = ""
        s*="determining valid_raise_range\n"
        s*="   rbr = $rbr, max_orbr = $max_orbr\n"
        s*="   cra == 0 = $(cra == 0)\n"
        s*="   amt_computed = $amt_computed\n"
        s*="   check = $check\n"
        s*="   max_orbr > rbr = $(max_orbr > rbr)\n"
        s*="   irra = $irra\n"
        s*="   cra = $cra\n"
        s*="   Δbr = $Δbr\n"
        s*="   (cra+irra) = $(cra+irra)\n"
        s*="   br = $(bank_roll(player))\n"
        s*="   br = $(bank_roll(player))\n"
        s*="   rc = $(round_contribution(player))\n"
        s
    end
    lim = cra == 0 ? mra : (cra+irra)
    @cdebug logger "   lim = $lim"
    br₀ = min(max_orbr, rbr)
    vrr = lim > br₀ ? (br₀, br₀) : (lim, br₀) # somewhat like clamp
    @cdebug logger "   vrr = $vrr"
    minraise = first(vrr)
    maxraise = last(vrr)
    @assert maxraise ≥ minraise "Min valid raise bound must be ≤ max valid raise bound."
    return (minraise:maxraise)
end
