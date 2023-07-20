"""
    Players

A collection of players. This collection may
be a Tuple or a vector:

    (player[1], player[2], player[3])
    [player[1], player[2], player[3]]

These indices correspond to the player index (`pidx`).

Both the player's seat number and index
must be unique, but they need not be equal:

    pidx                 : (player[1], player[2], player[3])
    seat_number.(players): (   6     ,    3     ,    2     )

Also, the seat number need not be consecutive
when sorted, whereas the player indexes must
be consecutive when sorted.

Since players are allowed to have different
composition, we provide iterators over the
players index, rather than the players
themselves, for type-stability.
"""
struct Players{PS<:Union{Tuple,AbstractArray}}
    players::PS
end

"""
    cyclic_player_index(::Players, pidx)
    cyclic_player_index(n_players, pidx)

A circular index for indexing into `players`.
`pidx = 1` corresponds to `player[1]`.
"""
cyclic_player_index(players::Players, i) =
    cyclic_player_index(length(players.players), i)
cyclic_player_index(n_players, i) = mod(i-1, n_players)+1

Base.length(p::Players) = length(p.players)
Base.iterate(players::Players, ncpidx = 1) =
    Base.iterate(players.players, ncpidx)
Base.@propagate_inbounds Base.getindex(players::Players, i::Int) =
    Base.getindex(players.players, i)
Base.filter(fn, players::Players) = Base.filter(fn, players.players)
Base.findfirst(fn::Function, players::Players) =
    Base.findfirst(fn, players.players)

function Base.sort!(players::Players{<:AbstractArray})
    Base.sort!(players.players; by=x->bank_roll(x))
    return nothing
end
sorted_collect(players::Players) =
    Players(sort(collect(players.players); by = x->bank_roll(x)))
n_players(players::Players) = length(players)

import TupleTools
Base.sortperm(players::Players{<:AbstractArray}) =
    Base.sortperm(map(x->bank_roll(x), players.players))

Base.sortperm(players::Players{<:Tuple}) =
    TupleTools.sortperm(map(x->bank_roll(x), players.players))

#=
# sorted(players::Players) =
#     Players(map(p->players.players[p], sortperm(players)))

=#


