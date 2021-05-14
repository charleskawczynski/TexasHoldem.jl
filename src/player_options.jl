export PlayerOptions,
    CheckRaiseFold,
    CallRaiseFold,
    CallAllInFold,
    CallFold

abstract type PlayerOptions end
struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end
struct CallAllInFold <: PlayerOptions end
struct CallFold <: PlayerOptions end

validate_action(::Fold, ::CheckRaiseFold) = nothing
validate_action(::Fold, ::CallRaiseFold) = nothing
validate_action(::Fold, ::CallAllInFold) = nothing
validate_action(::Fold, ::CallFold) = nothing

validate_action(::Check, ::CheckRaiseFold) = nothing
validate_action(::Check, ::CallRaiseFold) = error("Cannot check. Available options: CallRaiseFold")
validate_action(::Check, ::CallAllInFold) = error("Cannot check. Available options: CallAllInFold")
validate_action(::Check, ::CallFold) = error("Cannot check. Available options: CallFold")

# We catch this error before `call!` completes, so we don't need to catch here.
# validate_action(::Call, ::CheckRaiseFold) = error("Cannot call. Available options: CheckRaiseFold")
validate_action(::Call, ::CallRaiseFold) = nothing
validate_action(::Call, ::CallAllInFold) = nothing
validate_action(::Call, ::CallFold) = nothing

validate_action(::Raise, ::CheckRaiseFold) = nothing
validate_action(::Raise, ::CallRaiseFold) = nothing
validate_action(::Raise, ::CallAllInFold) = nothing
validate_action(::Raise, ::CallFold) = error("Cannot Raise. Available options: CallFold")

function player_option!(game::Game, player::Player)
    table = game.table
    call_amt = call_amount(table, player)
    game_state = state(table)
    if !(call_amt ≈ 0) # must call to stay in
        if bank_roll(player) > call_amt # raise possible
            vrb = valid_raise_bounds(table, player)
            if first(vrb) ≈ last(vrb) # only all-in raise possible
                option = CallAllInFold()
            else
                option = CallRaiseFold()
            end
        else # only all-in possible
            option = CallFold()
        end
    else
        option = CheckRaiseFold()
    end
    @debug "option = $option"

    n_actions = length(action_history(player))

    player_option!(game, player, game_state, option)

    # exactly 1 action must be taken
    player_action = action_history(player)
    @assert n_actions + 1 == length(player_action) "Must take exactly 1 action."
    validate_action(last(player_action), option)
end

#####
##### Human player options (ask via prompts)
#####

function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CheckRaiseFold, io::IO=stdin)
    table = game.table
    vrb = valid_raise_bounds(table, player)
    options = ["Check", "Raise [\$$(minimum(vrb)), \$$(maximum(vrb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && check!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(table, player, io))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallRaiseFold, io::IO=stdin)
    table = game.table
    vrb = valid_raise_bounds(table, player)
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise [\$$(minimum(vrb)), \$$(maximum(vrb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(game.table, player, io))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallAllInFold)
    table = game.table
    call_amt = call_amount(table, player)
    all_in_amt = round_bank_roll(player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise all-in (\$$(all_in_amt))", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_all_in!(game, player)
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallFold)
    table = game.table
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && fold!(game, player)
end

function input_raise_amt(table, player::Player{Human}, io::IO=stdin)
    raise_amt = nothing
    while true
        println(io, "Enter raise amt:")
        raise_amt = readline(io)
        try
            raise_amt = parse(Float64, raise_amt)
            is_valid, msg = is_valid_raise_amount(table, player, raise_amt)
            is_valid && break
            println(io, msg)
        catch
            println(io, "Raise must be a Float64")
        end
    end
    @assert raise_amt ≠ nothing
    amt = valid_raise_amount(table, player, raise_amt)
    return amt
end

#####
##### AbstractAI
#####

##### Bot5050

function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CheckRaiseFold)
    if rand() < 0.5
        check!(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        amt = bound_raise(game.table, player, amt)
        raise_to!(game, player, amt)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallRaiseFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            amt = Int(round(rand()*bank_roll(player), digits=0))
            amt = bound_raise(game.table, player, amt)
            raise_to!(game, player, amt)
        end
    else
        fold!(game, player)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallAllInFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            raise_all_in!(game, player)
        end
    else
        fold!(game, player)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallFold)
    if rand() < 0.5
        call!(game, player)
    else
        fold!(game, player)
    end
end
