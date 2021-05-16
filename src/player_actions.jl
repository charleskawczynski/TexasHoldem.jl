#####
##### Player actions
#####

export fold!, check!, raise_to!, call!, raise_all_in!
export Fold, Check, Call, Raise
export call_amount

abstract type AbstractAction end
struct Fold <: AbstractAction end
struct Check <: AbstractAction end
struct Call{T <: Real} <: AbstractAction
    amt::T
end
struct Raise{T <: Real} <: AbstractAction
    amt::T
end

#####
##### Fold
#####

function fold!(game::Game, player::Player)
    push!(player.action_history, Fold())
    player.action_required = false
    player.folded = true
    check_for_winner!(game.table)
    @info "$(name(player)) folded!"
end

#####
##### Check
#####

function check!(game::Game, player::Player)
    push!(player.action_history, Check())
    player.action_required = false
    player.checked = true
    @info "$(name(player)) checked!"
end

#####
##### Call
#####

function call_amount(table::Table, player::Player)
    cra = current_raise_amt(table)
    prc = round_contribution(player)
    if cra ≈ 0
        @assert prc ≈ 0 "Round contribution must be zero if current raise is zero."
    end
    call_amt = cra - prc
    @debug "cra = $cra, prc = $prc, call_amt = $call_amt"
    @assert !(call_amt < 0) "Call amount cannot be negative"
    return call_amt
end

call!(game::Game, player::Player) = call!(game.table, player)

function call!(table::Table, player::Player)
    call_amt = call_amount(table, player)
    if call_amt ≤ bank_roll(player)
        call_valid_amount!(table, player, call_amt)
    else
        call_valid_amount!(table, player, bank_roll(player))
    end
end

function call_valid_amount!(table::Table, player::Player, amt::Real)
    @debug "$(name(player)) calling $(amt)."
    push!(player.action_history, Call(amt))
    player.action_required = false
    player.checked = false
    blind_str = is_blind_call(table, player, amt) ? " (blind)" : ""
    contribute!(table, player, amt, true)
    if all_in(player)
        @info "$(name(player)) called $(amt)$blind_str (now all-in)."
    else
        @info "$(name(player)) called $(amt)$blind_str."
    end
end

#####
##### Raise
#####

"""
    bound_raise(table::Table, player::Player, amt)

Given a raise amount `amt`, return a valid raise amount.
"""
bound_raise(table::Table, player::Player, amt::Real) =
    clamp(amt, valid_raise_bounds(table, player)...)

"""
    valid_raise_bounds(table::Table, player::Player)

A tuple of valid raise bounds. Note that
all-in is the only option if both elements
are equal.
"""
function valid_raise_bounds(table::Table, player::Player)
    cra = current_raise_amt(table)
    rbr = round_bank_roll(player)
    if cra ≈ 0 # initial raise
        vrb = (blinds(table).small, rbr)
    else # re-raise
        if rbr > 2*cra
            vrb = (2*cra, rbr)
        else
            vrb = (rbr, rbr)
        end
    end
    return vrb
end

"""
    is_valid, msg = is_valid_raise_amount(table::Table, player::Player, amt)

A `Tuple` of two elements:
 - A `Bool`, `is_valid`, indicating if the raise amount is valid or not
 - A `String`, `msg`, of the error message (`msg` = "" if `is_valid = true`).
"""
function is_valid_raise_amount(table::Table, player::Player, amt::Real)
    prc = round_contribution(player)
    rbr = round_bank_roll(player)
    vrb = valid_raise_bounds(table, player)
    if amt ≈ 0
        return false, "Cannot raise $amt. Raise must be between [\$$(vrb[1]), \$$(vrb[2])]"
    end
    if !(amt ≤ rbr)
        return false, "Insufficient funds (\$$rbr) to raise \$$amt. Raise must be between [\$$(vrb[1]), \$$(vrb[2])]"
    end
    if !(vrb[1] ≤ amt ≤ vrb[2] || amt ≈ vrb[1] ≈ vrb[2])
        if vrb[1] ≈ vrb[2]
            return false, "Only allowable raise is \$$(vrb[1]) (all-in)"
        else
            return false, "Raise must be between [\$$(vrb[1]), \$$(vrb[2])]"
        end
    end
    if !(amt - prc > 0)
        return false, "Cannot contribute \$$(amt - prc) to the pot."
    end
    return true, ""
end

"""
    valid_raise_amount(table::Table, player::Player, amt)

Return back `amt` if `amt` is a valid raise amount.
"""
function valid_raise_amount(table::Table, player::Player, amt::Real)
    is_valid, msg = is_valid_raise_amount(table, player, amt)
    @assert is_valid "$msg"
    return amt
end

"""
    raise_to!(game::Game, player::Player, amt)

Raise bet, for the _round_, to amount `amt`. Example:
```
# Flop
Player[1] raise to 10 (`amt = 10`, contribute 10)
Player[2] raise to 20 (`amt = 20`, contribute 20)
Player[3] raise to 40 (`amt = 40`, contribute 40)
Player[1] raise to 80 (`amt = 80`, contribute 80-10=70)
Player[2] call
Player[3] call
# Turn
Player[1] raise to 1 (`amt = 1`, contribute 1)
Player[2] raise to 2 (`amt = 2`, contribute 2)
Player[3] raise to 4 (`amt = 4`, contribute 4)
Player[1] raise to 8 (`amt = 8`, contribute 8-1=7)
Player[2] call
Player[3] call
```
"""
raise_to!(game::Game, player::Player, amt::Real) = raise_to!(game.table, player, amt)

raise_to!(table::Table, player::Player, amt::Real) =
    raise_to_valid_raise_amount!(table, player, valid_raise_amount(table, player, amt))

function raise_to_valid_raise_amount!(table::Table, player::Player, amt::Real)
    @debug "$(name(player)) raising to $(amt)."
    prc = round_contribution(player)
    contribute!(table, player, amt - prc, false)
    table.current_raise_amt = amt

    push!(player.action_history, Raise(amt))
    player.action_required = false
    player.last_to_raise = true
    player.checked = false
    players = players_at_table(table)
    for oponent in players
        seat_number(oponent) == seat_number(player) && continue
        folded(oponent) && continue
        oponent.action_required = true
        oponent.last_to_raise = false
    end
    if bank_roll(player) ≈ 0
        @info "$(name(player)) raised to $(amt) (all-in)."
    else
        @info "$(name(player)) raised to $(amt)."
    end
end

raise_all_in!(game::Game, player::Player) = raise_all_in!(game.table, player)
raise_all_in!(table::Table, player::Player) =
    raise_to!(table, player, round_bank_roll(player))
