"""
    Action

An action type, to be returned by [`player_option`](@ref)
during each players turn to act. This is an internal
type, but documented for user understanding.

Users are expected to return an action from
[`player_option`](@ref) by calling one of `Action`'s
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
