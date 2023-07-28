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

validate_action(a::Action, ::CheckRaiseFold) = @assert a.name in (:check, :raise, :all_in, :fold)
validate_action(a::Action, ::CallRaiseFold) = @assert a.name in (:call, :raise, :all_in, :fold)
validate_action(a::Action, ::CallAllInFold) = @assert a.name in (:call, :all_in, :fold)
validate_action(a::Action, ::CallFold) = @assert a.name in (:call, :fold)

function update_given_raise!(table, player, amt)
    logger = table.logger
    @cdebug logger "$(name(player)) raising to $(amt)."
    prc = round_contribution(player)
    @cdebug logger "round_contribution = $prc"
    @cdebug logger "contributing = $(amt - prc)"
    @cdebug logger "bank_roll = $(bank_roll(player))"
    contribute!(table, player, amt - prc, false)
    table.current_raise_amt = amt

    players = players_at_table(table)
    if all(player -> !player.last_to_raise, players)
        table.initial_round_raise_amt = amt
    end
    player.action_required = false
    player.last_to_raise = true
    player.checked = false
    for opponent in players
        seat_number(opponent) == seat_number(player) && continue
        not_playing(opponent) && continue
        if !all_in(opponent)
            opponent.action_required = true
        end
        opponent.last_to_raise = false
        # TODO: there's got to be a cleaner way
        opponent.checked = false # to avoid exiting on all_all_in_or_checked(table).
    end
    @cinfo logger begin
        pbpai = opponents_being_put_all_in(table, player, amt)
        if bank_roll(player) == 0
            if isempty(pbpai)
                "$(name(player)) raised to $(amt) (all-in)."
            else
                "$(name(player)) raised to $(amt). Puts player(s) $(join(pbpai, ", ")) all-in."
            end
        else
            if isempty(pbpai)
                "$(name(player)) raised to $(amt)."
            else
                "$(name(player)) raised to $(amt). Puts player(s) $(join(pbpai, ", ")) all-in."
            end
        end
    end
end

update_given_valid_action!(game::Game, player::Player, action::Action) =
    update_given_valid_action!(game.table, player, action)

function update_given_valid_action!(table::Table, player::Player, action::Action)
    logger = table.logger
    @assert action.name in (:fold, :raise, :call, :check, :all_in)
    if action.name == :fold
        player.action_required = false
        player.folded = true
        check_for_and_declare_winner!(table)
        @cinfo logger "$(name(player)) folded!"
    elseif action.name == :raise || action.name == :all_in
        amt = valid_raise_amount(table, player, action.amt) # asserts valid requested raise amount
        update_given_raise!(table, player, amt)
    elseif action.name == :call
        # call_valid_amount!(table, player, action.amt)
        amt = action.amt
        @cdebug logger "$(name(player)) calling $(amt)."
        player.action_required = false
        player.checked = false
        contribute!(table, player, amt, true)
        @cinfo logger begin
            blind_str = is_blind_call(table, player, amt) ? " (blind)" : ""
            if all_in(player)
                "$(name(player)) called $(amt)$blind_str (now all-in)."
            else
                "$(name(player)) called $(amt)$blind_str."
            end
        end

    elseif action.name == :check
        player.action_required = false
        player.checked = true
        @cinfo logger "$(name(player)) checked!"
    end

end

function predict_option(game, player)
    logger = game.table.logger
    table = game.table
    call_amt = call_amount(table, player)
    if !(call_amt == 0) # must call to stay in
        cond_1 = bank_roll(player) > call_amt
        cond_2 = an_opponent_can_call_a_raise(table, player)
        raise_possible = cond_1 && cond_2
        if raise_possible # raise possible
            vrb = valid_raise_bounds(table, player)
            if first(vrb) == last(vrb) # only all-in raise possible
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
    return option
end

function player_option(game::Game, player::Player)
    logger = game.table.logger
    @cdebug logger "predicted option = $(predict_option(game, player))"
    table = game.table
    call_amt = call_amount(table, player)
    local action
    if !(call_amt == 0) # must call to stay in
        cond_1 = bank_roll(player) > call_amt
        cond_2 = an_opponent_can_call_a_raise(table, player)
        raise_possible = cond_1 && cond_2
        if raise_possible # raise possible
            vrb = valid_raise_bounds(table, player)
            if first(vrb) == last(vrb) # only all-in raise possible
                action = player_option(game, player, CallAllInFold())::Action
                validate_action(action, CallAllInFold())
            else
                action = player_option(game, player, CallRaiseFold())::Action
                validate_action(action, CallRaiseFold())
            end
        else # only all-in possible
            action = player_option(game, player, CallFold())::Action
            validate_action(action, CallFold())
        end
    else
        action = player_option(game, player, CheckRaiseFold())::Action
        validate_action(action, CheckRaiseFold())
    end
    update_given_valid_action!(table, player, action)
end

# By default, forward to `player_option` with
# game stage:
player_option(game::Game, player::Player, option) =
    player_option(game, player, stage(game.table), option)

#####
##### Human player options (ask via prompts)
#####

function player_option(game::Game, player::Player{Human}, ::CheckRaiseFold, io::IO=stdin)
    table = game.table
    vrb = valid_raise_bounds(table, player)
    options = ["Check", "Raise [\$$(minimum(vrb)), \$$(maximum(vrb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return check(game, player)
    choice == 2 && return raise_to(game, player, input_raise_amt(table, player, io))
    choice == 3 && return fold(game, player)
end
function player_option(game::Game, player::Player{Human}, ::CallRaiseFold, io::IO=stdin)
    table = game.table
    vrb = valid_raise_bounds(table, player)
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise [\$$(minimum(vrb)), \$$(maximum(vrb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return call(game, player)
    choice == 2 && return raise_to(game, player, input_raise_amt(game.table, player, io))
    choice == 3 && return fold(game, player)
end
function player_option(game::Game, player::Player{Human}, ::CallAllInFold)
    table = game.table
    call_amt = call_amount(table, player)
    all_in_amt = round_bank_roll(player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise all-in (\$$(all_in_amt))", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return call(game, player)
    choice == 2 && return raise_all_in(game, player)
    choice == 3 && return fold(game, player)
end
function player_option(game::Game, player::Player{Human}, ::CallFold)
    table = game.table
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return call(game, player)
    choice == 2 && return fold(game, player)
end

# io only works for tests, but does not for user input
# so we have a switch for the test suite
use_input_io() = false
println_io(io::IO, msg) = use_input_io() ? println(io, msg) : println(msg)

function input_raise_amt(table, player::Player{Human}, io::IO=stdin)
    raise_amt = nothing
    while true
        println_io(io, "Enter raise amt:")
        raise_amt = readline(io)
        try
            raise_amt = parse(Int, raise_amt)
            is_valid, msg = is_valid_raise_amount(table, player, raise_amt)
            is_valid && break
            println_io(io, msg)
        catch
            println_io(io, "Raise must be a Int")
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

function player_option(game::Game, player::Player{Bot5050}, ::CheckRaiseFold)
    if rand() < 0.5
        return check(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        amt = bound_raise(game.table, player, amt)
        return raise_to(game, player, amt)
    end
end
function player_option(game::Game, player::Player{Bot5050}, ::CallRaiseFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            return call(game, player)
        else # re-raise
            amt = Int(round(rand()*bank_roll(player), digits=0))
            amt = bound_raise(game.table, player, amt)
            return raise_to(game, player, amt)
        end
    else
        return fold(game, player)
    end
end
function player_option(game::Game, player::Player{Bot5050}, ::CallAllInFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            return call(game, player)
        else # re-raise
            return raise_all_in(game, player)
        end
    else
        return fold(game, player)
    end
end
function player_option(game::Game, player::Player{Bot5050}, ::CallFold)
    if rand() < 0.5
        return call(game, player)
    else
        return fold(game, player)
    end
end
