"""
    ActionValidationCode

An action validation code enum type.

 - `NoOptions`
 - `Waiting`
 - `Fold`
 - `Check`
 - `Call`
 - `Raise`
 - `AllIn`
"""
EnumX.@enumx ActionValidationCode begin
    ValidAction
    InvalidActionType
    RaiseTooLarge
    RaiseTooSmall
    CallTooLarge
    CallTooSmall
    InsufficientFunds
    CannotRaise0
    OnlyAllInIsAllowed
    RaiseNotInValidRange
    MustContributePositiveAmount
end


"""
    action_validation_code(game::Game, action::Action, options::Options)

Returns an ActionValidationCode for the given action and options.
"""
function action_validation_code(game::Game, a::Action, options::Options)
    # First, validate action type given options:
    at = a.action_type
    if options == CheckRaiseFold
        if at in (ActionType.Check, ActionType.Fold)
            return ActionValidationCode.ValidAction
        elseif at in (ActionType.Raise, ActionType.AllIn)
            return raise_validation_code(game, a, options)
        else
            return ActionValidationCode.InvalidActionType
        end
    elseif options == CallRaiseFold
        if at == ActionType.Fold
            return ActionValidationCode.ValidAction
        elseif at == ActionType.Call
            return call_validation_code(game, a, options)
        elseif at in (ActionType.Raise, ActionType.AllIn)
            return raise_validation_code(game, a, options)
        else
            return ActionValidationCode.InvalidActionType
        end
    elseif options == CallAllInFold
        if at == ActionType.Fold
            return ActionValidationCode.ValidAction
        elseif at == ActionType.Call
            return call_validation_code(game, a, options)
        elseif at == ActionType.AllIn
            return raise_validation_code(game, a, options)
        else
            return ActionValidationCode.InvalidActionType
        end
    elseif options == CallFold
        if at == ActionType.Fold
            return ActionValidationCode.ValidAction
        elseif at == ActionType.Call
            return call_validation_code(game, a, options)
        else
            return ActionValidationCode.InvalidActionType
        end
    else
        @assert options == NoOptions
        a.action_type == ActionType.NoOptions || return ActionValidationCode.InvalidActionType
    end
end

call_validation_code(game::Game, a::Action, options::Options) =
    call_validation_code(game, current_player(game), a, options)

function call_validation_code(game::Game, player::Player, a::Action, options::Options)
    @assert a.action_type == ActionType.Call
    ca = call_amount(game)
    if a.amt == ca
        return ActionValidationCode.ValidAction
    elseif a.amt < ca && a.amt == bank_roll(player)
        return ActionValidationCode.ValidAction
    elseif a.amt < ca
        return ActionValidationCode.CallTooSmall
    else
        @assert a.amt > ca
        return ActionValidationCode.CallTooLarge
    end
end

"""
    is_valid_action(game, a::Action, options::Options)

Returns a Bool indicating that the given action is
valid given the options
"""
is_valid_action(game, a::Action, options::Options) = action_validation_code(game, a, options) == ActionValidationCode.ValidAction

raise_validation_info(game::Game, action::Action, options::Options) =
    raise_validation_info(game, current_player(game), action, options)

"""
    (; amt, rbr, minraise, maxraise, prc) = raise_validation_code(game::Game, action::Action, options::Options)

A NamedTuple containing:
 - `amt` - the candidate raise amount
 - `rbr` - the player's round bank roll
 - `minraise` - the minimum valid total bet
 - `maxraise` - the maximum valid total bet
 - `prc` - the player's round contribution
"""
function raise_validation_info(game::Game, player::Player, action::Action, options::Options)
    amt = action.amt
    table = game.table
    logger = table.logger
    prc = round_contribution(player)
    rbr = round_bank_roll(player)
    vrr = valid_total_bet_range(table, player)
    @cdebug logger "vrr = $vrr, amt = $amt, prc = $prc, rbr=$rbr, br=$(bank_roll(player))"
    minraise = first(vrr)
    maxraise = last(vrr)
    return (; amt, rbr, minraise, maxraise, prc)
end

raise_validation_code(game::Game, action::Action, options::Options) =
    raise_validation_code(game, current_player(game), action, options)

"""
    code = raise_validation_code(game::Game, action::Action, options::Options)

Returns the ActionValidation code for raises.
"""
function raise_validation_code(game::Game, player::Player, action::Action, options::Options)
    (; amt, rbr, minraise, maxraise, prc) = raise_validation_info(game, player, action, options)
    if amt == 0 || (minraise == maxraise == 0)
        return ActionValidationCode.CannotRaise0
    end
    if !(amt ≤ rbr)
        return ActionValidationCode.InsufficientFunds
    end
    if !(minraise ≤ amt ≤ maxraise || amt == minraise == maxraise)
        if minraise == maxraise
            return ActionValidationCode.OnlyAllInIsAllowed
        else
            return ActionValidationCode.RaiseNotInValidRange
        end
    end
    if !(amt - prc > 0)
        return ActionValidationCode.MustContributePositiveAmount
    end
    return ActionValidationCode.ValidAction
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
    @assert action.action_type in (ActionType.Fold, ActionType.Raise, ActionType.Call, ActionType.Check, ActionType.AllIn)
    amt = action.amt
    if action.action_type == ActionType.Fold
        player.performed_action = ActionType.Fold
        player.folded = true
        check_for_and_declare_winner!(table)
        @cinfo logger "$(name(player)) folded!"
        @log_event_code logger Int.([CodePlayerAction, seat_number(player), CodeFold])
    elseif action.action_type == ActionType.Raise || action.action_type == ActionType.AllIn
        if action.action_type == ActionType.Raise
            @log_event_code logger Int.([CodePlayerAction, seat_number(player), CodeRaiseTo, amt])
        else
            @log_event_code logger Int.([CodePlayerAction, seat_number(player), CodeAllIn, amt])
        end
        update_given_raise!(table, player, amt)
        player.performed_action = ActionType.Raise
        action = ActionType.Raise
    elseif action.action_type == ActionType.Call
        @cdebug logger "$(name(player)) calling $(amt)."
        @log_event_code logger Int.([CodePlayerAction, seat_number(player), CodeCall])
        player.performed_action = ActionType.Call
        contribute!(table, player, amt, true)
        @cinfo logger begin
            blind_str = is_blind_call(table, player, amt) ? " (blind)" : ""
            if all_in(player)
                "$(name(player)) called $(amt)$blind_str (now all-in)."
            else
                "$(name(player)) called $(amt)$blind_str."
            end
        end

    elseif action.action_type == ActionType.Check
        player.performed_action = ActionType.Check
        @cinfo logger "$(name(player)) checked!"
        @log_event_code logger Int.([CodePlayerAction, seat_number(player), CodeCheck])
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
                return CallAllInFold
            else
                return CallRaiseFold
            end
        else # only all-in possible
            return CallFold
        end
    else
        return CheckRaiseFold
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

 - `CheckRaiseFold`
 - `CallRaiseFold`
 - `CallAllInFold`
 - `CallFold`
"""
function get_action end

get_action(game::Game, options::Options) =
    get_action(game, current_player(game), options)

#####
##### AbstractStrategy
#####

##### FuzzBot

function get_action(game::Game, player::Player{FuzzBot}, options)
    if options == CheckRaiseFold
        rand() < 0.5 && return Check()
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game)))
        # while we can check for free, this bot is used for fuzzing,
        # so we want to explore the most diverse set of possible cases.
        return Fold()
    elseif options == CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game))) # re-raise
        return Fold()
    elseif options == CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game) # re-raise
        return Fold()
    elseif options == CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    end
    error("Uncaught case")
end

##### Bot5050

function get_action(game::Game, player::Player{Bot5050}, options)
    if options == CheckRaiseFold
        rand() < 0.5 && return Check()
        return RaiseTo(game, rand(valid_total_bet_range(game)))
    elseif options == CallRaiseFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return RaiseTo(game, rand(valid_total_bet_range(game))) # re-raise
        return Fold()
    elseif options == CallAllInFold
        rand() < 0.5 && return Call(game)
        rand() < 0.5 && return AllIn(game) # re-raise
        return Fold()
    elseif options == CallFold
        rand() < 0.5 && return Call(game)
        return Fold()
    end
    error("Uncaught case")
end
