#####
##### Player actions
#####

export fold!, check!, raise!, call!
export Fold, Check, Call, Raise

abstract type AbstractAction end
struct Fold <: AbstractAction end
struct Check <: AbstractAction end
struct Call{T} <: AbstractAction
    amt::T
end
struct Raise{T} <: AbstractAction
    amt::T
end

function fold!(game::Game, player::Player)
    push!(player.action_history, Fold())
    player.action_required = false
    player.folded = true
    check_for_winner!(game)
end
function check!(game::Game, player::Player)
    push!(player.action_history, Check())
    player.action_required = false
end
function call!(game::Game, player::Player, amt)
    push!(player.action_history, Call(amt))
    player.action_required = false

    if player.bank_roll > amt
        player.bank_roll -= amt
        game.table.pot += amt
    else
        player.bank_roll = 0
        game.table.pot += player.bank_roll
        player.all_in = true
    end
end
function raise!(game::Game, player::Player, amt)
    if player.bank_roll >= amt
        player.bank_roll -= amt
        game.table.pot += amt
        player.bank_roll == amt && (player.all_in = true)
        game.current_raise_amt += amt
    else
        msg1 = "Player $(player.id) has insufficient bank"
        msg2 = "roll ($(player.bank_roll)) to add $amt to pot."
        error(msg1*msg2)
    end

    push!(player.action_history, Raise(amt))
    player.action_required = false
    for oponent in game.players
        oponent.id == player.id && continue
        folded(oponent) && continue
        oponent.action_required = true
    end
end
