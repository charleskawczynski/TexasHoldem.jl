"""
    ActionType

An action enum type, to be used with `Action`.

Users are expected to return an action from
[`get_action`](@ref) by calling one of `Action`'s
convenience methods:

 - `NoOptions`
 - `Waiting`
 - `Fold`
 - `Check`
 - `Call`
 - `Raise`
 - `AllIn`
"""
EnumX.@enumx ActionType begin
    NoOptions = -1
    Waiting = 0
    Fold = 1
    Check = 2
    Call = 3
    Raise = 4
    AllIn = 5
end

"""
    Action

An action type, to be returned by [`get_action`](@ref)
during each players turn to act. This is an internal
type, but documented for user understanding.

Users are expected to return an action from
[`get_action`](@ref) by calling one of `Action`'s
convenience methods:

 - [`Fold`](@ref)
 - [`Check`](@ref)
 - [`Call`](@ref)
 - [`RaiseTo`](@ref)
 - [`AllIn`](@ref)
"""
struct Action
    action_type::ActionType.T
    amt::Int
end

"""
    Options

An options enum type, to be returned by [`get_options`](@ref). Users can use
this to determine which action to give back to `play`.

Helper functions to return allowable options include:
 - `NoOptions`
 - `CheckRaiseFold`
 - `CallRaiseFold`
 - `CallAllInFold`
 - `CallFold`
"""
@enum Options begin
    NoOptions = 0
    CheckRaiseFold = 1
    CallRaiseFold = 2
    CallAllInFold = 3
    CallFold = 4
end
