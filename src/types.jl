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
 - [`Raise`](@ref)
 - [`AllIn`](@ref)

Options names (`(options::Options).name`) are `Symbol`s that can be only one of:

 - `:NoOptions`
 - `:CheckRaiseFold`
 - `:CallRaiseFold`
 - `:CallAllInFold`
 - `:CallFold`
"""
struct Action
    name::Symbol
    amt::Int
end

"""
    Options

An options type, returned by [`get_options`](@ref).
Users can use this to determine which action to give
back to `play`.

Helper functions to return allowable options include:
 - [`NoOptions`](@ref)
 - [`CheckRaiseFold`](@ref)
 - [`CallRaiseFold`](@ref)
 - [`CallAllInFold`](@ref)
 - [`CallFold`](@ref)

Actions names (`(action::Action).name`) are `Symbol`s that can be only one of:

 - `:Fold`
 - `:Check`
 - `:Call`
 - `:Raise`
 - `:AllIn`
"""
struct Options
    name::Symbol
end
