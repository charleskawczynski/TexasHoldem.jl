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
end

#####
##### Check
#####

function check!(game::Game, player::Player)
    push!(player.action_history, Check())
    player.action_required = false
    player.checked = true
end

#####
##### Call
#####

call!(game::Game, player::Player, amt) = call!(game.table, player, amt)

function call!(table::Table, player::Player, amt;debug=false)
    push!(player.action_history, Call(amt))
    player.action_required = false
    contribute!(table, player, amt, true;debug=debug)
end

#####
##### Raise
#####

raise_to!(game::Game, player::Player, amt) = raise_to!(game.table, player, amt)

# TODO: add assertion that raise amount must be
# greater than small blind (unless all-in).
function raise_to!(table::Table, player::Player, amt;debug=false)
    @assert !(amt ≈ 0) # more checks are performed in `contribute!`
    contribute!(table, player, amt, false;debug=debug)
    table.current_raise_amt += amt

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
end
