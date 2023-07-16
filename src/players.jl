struct Players{PS<:Union{Tuple,AbstractArray}}
    players::PS
end

Base.length(p::Players) = length(p.players)
Base.iterate(players::Players, state = 1) =
    Base.iterate(players.players, state)
Base.@propagate_inbounds Base.getindex(players::Players, i::Int) =
    Base.getindex(players.players, i)
Base.filter(fn, players::Players) = Base.filter(fn, players.players)

sorted(players::Players) =
    Players(sort(collect(players.players); by = x->bank_roll(x)))
n_players(players::Players) = length(players)

#=
import TupleTools as TT
# sorted(players::Players) =
#     Players(map(p->players.players[p], sortperm(players)))

Base.sortperm(players::Players) =
    TT.sortperm(map(x->bank_roll(x), players.players))
=#


