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
"""
struct Action
    name::Symbol
    amt::Int
end
