"""
    Players

A collection of players. This collection may
be a Tuple or a vector:

    (player[1], player[2], player[3])
    [player[1], player[2], player[3]]

Each player has a unique `seat_id` (stored as `seat_number`).
The seat_id is the primary identifier used throughout the game logic
and is user-facing, making it easy for poker bots to understand
their position relative to other players.

Players are stored in the order they were provided, without sorting.
Use `find_player_by_seat_id` to locate a player by their seat_id.
"""
struct Players{PS<:Union{Tuple,AbstractArray}}
    players::PS
    function Players(players)
        n = length(players)
        if all(x->seat_number(x)==-1, players)
            for i in 1:n
                players[i].seat_number = i
            end
        end
        @assert allunique(map(x->seat_number(x), players)) "All seat numbers must be unique"
        return new{typeof(players)}(players)
    end
end

"""
    find_player_by_seat_id(players::Players, seat_id::Int)

Find the index of a player with the given seat_id.
Returns `nothing` if not found.
"""
function find_player_by_seat_id(players::Players, seat_id::Int)
    for (i, player) in enumerate(players.players)
        seat_number(player) == seat_id && return i
    end
    return nothing
end

"""
    get_player_by_seat_id(players::Players, seat_id::Int)

Get the player with the given seat_id.
Returns `nothing` if not found.
"""
function get_player_by_seat_id(players::Players, seat_id::Int)
    idx = find_player_by_seat_id(players, seat_id)
    idx === nothing && return nothing
    return players.players[idx]
end

# Helper function for cases where we expect the player to exist
# (throws error if not found, but doesn't mutate so no !)
function _get_player_by_seat_id_or_error(players::Players, seat_id::Int)
    idx = find_player_by_seat_id(players, seat_id)
    idx === nothing && error("Player with seat_id $seat_id not found")
    return players.players[idx]
end

# Helper function for cases where we expect the index to exist
function _find_player_by_seat_id_or_error(players::Players, seat_id::Int)
    idx = find_player_by_seat_id(players, seat_id)
    idx === nothing && error("Player with seat_id $seat_id not found")
    return idx
end

"""
    active_seat_ids(players::Players)

Return a sorted vector of seat_ids for all active players.
Active players are those with `active(player) == true`.
"""
function active_seat_ids(players::Players)
    seat_ids = Int[]
    for player in players.players
        active(player) && push!(seat_ids, seat_number(player))
    end
    return sort(seat_ids)
end

"""
    active_seat_ids_ordered(players::Players)

Return a vector of seat_ids for all active players, in the order
they appear in the players collection.
"""
function active_seat_ids_ordered(players::Players)
    seat_ids = Int[]
    for player in players.players
        active(player) && push!(seat_ids, seat_number(player))
    end
    return seat_ids
end

"""
    cyclic_seat_id(seat_ids::Vector{Int}, current_seat_id::Int, offset::Int=1)

Given a sorted list of seat_ids and a current seat_id, return the next
seat_id in cyclic order (wrapping around). The offset determines how many
steps to take (default 1 for next player).

This handles the cyclic nature of poker table positions while filtering
out inactive players.
"""
function cyclic_seat_id(seat_ids::Vector{Int}, current_seat_id::Int, offset::Int=1)
    isempty(seat_ids) && error("No active players")
    idx = findfirst(==(current_seat_id), seat_ids)
    idx === nothing && error("Current seat_id $current_seat_id not in active seat_ids")
    next_idx = mod(idx - 1 + offset, length(seat_ids)) + 1
    return seat_ids[next_idx]
end

"""
    next_active_seat_id(players::Players, current_seat_id::Int)

Get the next active player's seat_id in cyclic order.
"""
function next_active_seat_id(players::Players, current_seat_id::Int)
    seat_ids = active_seat_ids(players)
    return cyclic_seat_id(seat_ids, current_seat_id, 1)
end

"""
    seat_id_to_dense_index(players::Players, seat_id::Int)

Convert a seat_id to a dense array index (1..n) for use in arrays.
This assumes seat_ids are assigned sequentially starting from 1,
which is the default behavior when seat_number is -1.

For non-dense seat_ids, this will return the position in the players array.
"""
function seat_id_to_dense_index(players::Players, seat_id::Int)
    return _find_player_by_seat_id_or_error(players, seat_id)
end

Base.length(p::Players) = length(p.players)
Base.iterate(players::Players, state = 1) =
    Base.iterate(players.players, state)
Base.@propagate_inbounds Base.getindex(players::Players, i::Int) =
    Base.getindex(players.players, i)
Base.filter(fn, players::Players) = Base.filter(fn, players.players)
Base.findfirst(fn::Function, players::Players) =
    Base.findfirst(fn, players.players)

function Base.sort!(players::Players{<:AbstractArray})
    Base.sort!(players.players; by=x->bank_roll(x))
    return nothing
end
n_players(players::Players) = length(players)

import TupleTools
Base.sortperm(players::Players{<:AbstractArray}) =
    Base.sortperm(map(x->bank_roll(x), players.players))

Base.sortperm(players::Players{<:Tuple}) =
    TupleTools.sortperm(map(x->bank_roll(x), players.players))
