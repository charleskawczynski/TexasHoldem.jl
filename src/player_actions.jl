#####
##### Player actions
#####

export fold!, check!, raise_to!, call!
export Fold, Check, Call, Raise

abstract type AbstractAction end
struct PayBlind <: AbstractAction end
struct SitOut <: AbstractAction end
struct Fold <: AbstractAction end
struct Check <: AbstractAction end
struct Call{T} <: AbstractAction
    amt::T
end
struct Raise{T} <: AbstractAction
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

call!(game::Game, player::Player) = call!(game.table, player)

function call!(table::Table, player::Player)
    cra = table.current_raise_amt
    pc = player.round_contribution
    call_amt = cra - pc
    if call_amt ≤ bank_roll(player)
        call_valid_amount!(table, player, call_amt)
    else
        call_valid_amount!(table, player, bank_roll(player))
    end
end

function call_valid_amount!(table::Table, player::Player, amt)
    @debug "$(name(player)) calling $(amt)."
    push!(player.action_history, Call(amt))
    player.action_required = false
    contribute!(table, player, amt, true)
    @info "$(name(player)) called $(amt)."
end

#####
##### Raise
#####

"""
    bound_raise(table::Table, player::Player, amt)

Given a raise amount `amt`, return a valid raise
amount by ensuring the raise:
 - is at least the small blind
 - is less than the player's bank roll
 - is twice the current raise amount
"""
function bound_raise(table::Table, player::Player, amt)
    @debug "Bounding raise amout. Input amount = \$$(amt)"
    amt = max(amt, 2*table.current_raise_amt)
    amt = min(amt, round_bank_roll(player))
    amt = max(amt, blinds(table).small)
    @debug "Bounding raise amout. Output amount = \$$(amt)"
    return amt
end

# TODO: add assertion that raise amount must be
# greater than small blind (unless all-in).
"""
    valid_raise_amount(table::Table, player::Player, amt)

Return back `amt` if `amt` is a valid raise amount.
## Scenario 1 (`2*current_raise_amt > bank_roll(player)`) - only _raise_ option is all-in
## Scenario 2 (`2*current_raise_amt < bank_roll(player)`) - raise option has a range
"""
function valid_raise_amount(table::Table, player::Player, amt)
    @assert !(amt ≈ 0)
    @assert amt ≤ round_bank_roll(player)
    cra = table.current_raise_amt
    pc = player.round_contribution
    br = round_bank_roll(player)
    if cra ≈ 0 # initial raise
        rb = (blinds(table).small, br) # raise bounds
    else # re-raise
        if br > 2*cra
            rb = (2*cra, br) # raise bounds
        else
            rb = (br, br) # raise bounds
        end
    end
    # @assert amt_required_to_call > 0 # right?
    @debug "Attempting to raise to \$$(amt), already contributed \$$(pc). Valid raise bounds: [\$$(rb[1]), \$$(rb[2])]"
    if !(rb[1] ≤ amt ≤ rb[2] || amt ≈ rb[1] ≈ rb[2])
        @debug "cra = $cra"
        @debug "amt = $amt"
        @debug "br = $br"
        @debug "amt ≈ br = $(amt ≈ br)"
        @debug "2*cra ≤ amt ≤ br = $(2*cra ≤ amt ≤ br)"
    end
    @assert rb[1] ≤ amt ≤ rb[2] || amt ≈ rb[1] ≈ rb[2]
    @assert amt - pc > 0 # contribution amount must be > 0!
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
raise_to!(game::Game, player::Player, amt) = raise_to!(game.table, player, amt)

raise_to!(table::Table, player::Player, amt) =
    raise_to_valid_raise_amount!(table, player, valid_raise_amount(table, player, amt))

function raise_to_valid_raise_amount!(table::Table, player::Player, amt)
    @debug "$(name(player)) raising to $(amt)."
    pc = player.round_contribution
    contribute!(table, player, amt - pc, false)
    table.current_raise_amt = amt

    push!(player.action_history, Raise(amt))
    player.action_required = false
    player.last_to_raise = true
    players = players_at_table(table)
    for oponent in players
        oponent.id == player.id && continue
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
