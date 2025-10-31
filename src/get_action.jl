export NoOptions,
    CheckRaiseFold,
    CallRaiseFold,
    CallAllInFold,
    CallFold

"""
    NoOptions

The option when a player has no options (e.g.,
they are all-in).
"""
NoOptions() = Options(:NoOptions)

"""
    CheckRaiseFold

The option when a player is only able to
check, raise, or fold.
"""
CheckRaiseFold() = Options(:CheckRaiseFold)

"""
    CallRaiseFold

The option when a player is only able to
call, raise, or fold.
"""
CallRaiseFold() = Options(:CallRaiseFold)

"""
    CallAllInFold

The option when a player is only able to
call, raise all-in, or fold.
"""
CallAllInFold() = Options(:CallAllInFold)

"""
    CallFold

The option when a player is only able to
call or fold.
"""
CallFold() = Options(:CallFold)

"""
    validate_action(game::Game, action::Action, options::Options)

This method will assert that the given action is
valid under the given options.
"""
function validate_action(game::Game, a::Action, options::Options)
    on = options.name
    if on == :CheckRaiseFold
        @assert a.name in (:check, :raiseto, :all_in, :fold)
    elseif on == :CallRaiseFold
        @assert a.name in (:call, :raiseto, :all_in, :fold)
    elseif on == :CallAllInFold
        @assert a.name in (:call, :all_in, :fold)
    elseif on == :CallFold
        @assert a.name in (:call, :fold)
    else
        @assert on == :NoOptions "Expected on == :NoOptions, got $(on) == :NoOptions" # needed for, e.g., all-in
    end
    if a.name == :raiseto
        vtbr = valid_total_bet_range(game.table, current_player(game))
        total_bet = a.amt
        @assert total_bet in vtbr "Cannot raise $(total_bet). Raise must be between [$(first(vtbr)), $(last(vtbr))]"
    end
end

function is_valid_raise(game, action::Action)
    if action.name == :raiseto
        return action.amt in valid_total_bet_range(game.table, current_player(game))
    else
        return true
    end
end

"""
    is_valid_action(game, a::Action, options::Options)

Returns a Bool indicating that the given action is
valid given the options
"""
function is_valid_action(game, a::Action, options::Options)
    on = options.name
    on == :CheckRaiseFold && return a.name in (:check, :raiseto, :all_in, :fold) && is_valid_raise(game, action)
    on == :CallRaiseFold && return a.name in (:call, :raiseto, :all_in, :fold) && is_valid_raise(game, action)
    on == :CallAllInFold && return a.name in (:call, :all_in, :fold) && is_valid_raise(game, action)
    on == :CallFold && return a.name in (:call, :fold)
    on == :NoOptions && return a.name == :none
    error("Uncaught case")
end

is_valid_raise_amount(game, amt) =
    is_valid_raise_amount(game.table, current_player(game), amt)

"""
    is_valid, msg = is_valid_raise_amount(table::Table, player::Player, amt)

A `Tuple` of two elements:
 - A `Bool`, `is_valid`, indicating if the raise amount is valid or not
 - A `String`, `msg`, of the error message (`msg` = "" if `is_valid = true`).
"""
function is_valid_raise_amount(table::Table, player::Player, amt::Int)
    logger = table.logger
    prc = round_contribution(player)
    rbr = round_bank_roll(player)
    vrr = valid_total_bet_range(table, player)
    @cdebug logger "vrr = $vrr, amt = $amt, prc = $prc, rbr=$rbr, br=$(bank_roll(player))"
    minraise = first(vrr)
    maxraise = last(vrr)

    @assert !(minraise == maxraise == 0) "Cannot raise 0."
    if amt == 0
        return false, "Cannot raise $amt. Raise must be between [$minraise, $maxraise]"
    end
    if !(amt ≤ rbr)
        return false, "Insufficient funds ($rbr) to raise $amt. Raise must be between [$minraise, $maxraise]"
    end
    if !(minraise ≤ amt ≤ maxraise || amt == minraise == maxraise)
        if minraise == maxraise
            return false, "Only allowable raise is $(minraise) (all-in), attempting to raise $amt"
        else
            return false, "Cannot raise $amt. Raise must be between [$minraise, $maxraise]"
        end
    end
    if !(amt - prc > 0)
        return false, "Cannot contribute $(amt - prc) to the pot."
    end
    return true, ""
end

"""
    valid_raise_amount(table::Table, player::Player, amt)

Return back `amt` if `amt` is a valid raise amount.
"""
function valid_raise_amount(table::Table, player::Player, amt::Int)
    is_valid, msg = is_valid_raise_amount(table, player, amt)
    @assert is_valid "$msg"
    return amt
end

#=Not performance critical (only needed for info log)=#
function opponents_being_put_all_in(table::Table, player::Player, amt::Int)
    opponents = filter(players_at_table(table)) do opponent
        rbr = round_bank_roll(opponent)
        cond1 = !all_in(opponent)
        cond2 = still_playing(opponent)
        cond3 = seat_number(opponent) ≠ seat_number(player)
        cond4 = amt > rbr || amt == rbr
        all((cond1, cond2, cond3, cond4))
    end
    return name.(opponents)
end

function update_given_raise!(table, player, amt)
    logger = table.logger
    @cdebug logger "$(name(player)) raising to $(amt)."
    prc = round_contribution(player)
    @cdebug logger "round_contribution = $prc"
    @cdebug logger "contributing = $(amt - prc)"
    @cdebug logger "bank_roll = $(bank_roll(player))"
    contribute!(table, player, amt - prc, false)
    table.total_bet = amt

    players = players_at_table(table)
    if all(player -> !player.last_to_raise, players)
        table.initial_round_raise_amount = amt
    end
    player.last_to_raise = true
    for opponent in players
        seat_number(opponent) == seat_number(player) && continue
        opponent.last_to_raise = false
        not_playing(opponent) && continue
        if !all_in(opponent)
            opponent.action_required = true
        end
    end
    @cdebug logger begin
        pbpai = opponents_being_put_all_in(table, player, amt)
        s = "opponents_being_put_all_in: $pbpai\n"
        s *= "bank_rolls: $(bank_roll.(players))\n"
        s *= "round_bank_roll: $(round_bank_roll.(players))\n"
        s
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

"""
    an_opponent_can_call_a_raise(table::Table, player::Player)

A `Bool` indicating that at least one of `player`'s
opponents can call a raise by `player`.
"""
function an_opponent_can_call_a_raise(table::Table, player::Player)
    occr = false
    for opponent in players_at_table(table)
        seat_number(opponent) == seat_number(player) && continue
        not_playing(opponent) && continue
        all_in(opponent) && continue
        if round_bank_roll(opponent) > total_bet(table)
            occr = true
        end
    end
    return occr
end

update_given_valid_action!(game::Game, action::Action) =
    update_given_valid_action!(game.table, current_player(game), action)

update_given_valid_action!(game::Game, player::Player, action::Action) =
    update_given_valid_action!(game.table, player, action)
function update_given_valid_action!(table::Table, player::Player, action::Action)
    logger = table.logger
    @assert action.name in (:fold, :raiseto, :call, :check, :all_in)
    if action.name == :fold
        player.performed_action = :folded
        player.folded = true
        check_for_and_declare_winner!(table)
        @cinfo logger "$(name(player)) folded!"
    elseif action.name == :raiseto || action.name == :all_in
        _amt = valid_raise_amount(table, player, action.amt) # asserts valid requested raise amount
        update_given_raise!(table, player, _amt)
        player.performed_action = :raiseto
    elseif action.name == :call
        amt = action.amt
        @cdebug logger "$(name(player)) calling $(amt)."
        player.performed_action = :called
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
        player.performed_action = :checked
        @cinfo logger "$(name(player)) checked!"
    else
        error("Uncaught case")
    end
    player.action_required = false

end

get_options(game) = get_options(game, current_player(game))

"""
    get_options(game[, current_player])
    get_options(game, player)

Retuns the [`Options`](@ref) available to player `player`
for the given game (state) `game`.
"""
function get_options(game, player)
    logger = game.table.logger
    table = game.table
    call_amt = call_amount(table, player)
    if !(call_amt == 0) # must call to stay in
        cond_1 = bank_roll(player) > call_amt
        cond_2 = an_opponent_can_call_a_raise(table, player)
        raise_possible = cond_1 && cond_2
        if raise_possible # raise possible
            vrr = valid_total_bet_range(table, player)
            if first(vrr) == last(vrr) # only all-in raise possible
                return CallAllInFold()
            else
                return CallRaiseFold()
            end
        else # only all-in possible
            return CallFold()
        end
    else
        return CheckRaiseFold()
    end
end

"""
    get_action(game::Game, player::Player, options::Options)

Returns a valid action (see [`Action`](@ref)),
given the allowable options. `TexasHoldem` calls `get_action`
for each player on the table during each round. This
function is entirely where the strategy logic resides.

Users may overload this method to develop their
own poker bots. The options type is of type [`Options`](@ref)
and has one of the following names

 - `options.name == :CheckRaiseFold`
 - `options.name == :CallRaiseFold`
 - `options.name == :CallAllInFold`
 - `options.name == :CallFold`
"""
function get_action end

get_action(game::Game, options::Options) =
    get_action(game, current_player(game), options)

#####
##### AbstractStrategy
#####

##### FuzzBot

function get_action(game::Game, player::Player{FuzzBot}, options)
    if options.name == :CheckRaiseFold
        rand() < 0.5 && return Check()
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        # while we can check for free, this bot is used for fuzzing,
        # so we want to explore the most diverse set of possible cases.
        return Fold()
    elseif options.name == :CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game))) # re-raise
        return Fold()
    elseif options.name == :CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game) # re-raise
        return Fold()
    elseif options.name == :CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    end
    error("Uncaught case")
end

##### Bot5050

function get_action(game::Game, player::Player{Bot5050}, options)
    if options.name == :CheckRaiseFold
        rand() < 0.5 && return Check()
        return RaiseTo(game, rand(valid_total_bet_range(game)))
    elseif options.name == :CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game))) # re-raise
        return Fold()
    elseif options.name == :CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game) # re-raise
        return Fold()
    elseif options.name == :CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    end
    error("Uncaught case")
end
