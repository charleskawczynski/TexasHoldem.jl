function table_card_inds(round)
    if round == RoundState.Preflop; return ntuple(i->i, 5)
    elseif round == RoundState.Flop; return (4, 5)
    elseif round == RoundState.Turn; return (5,)
    elseif round == RoundState.River; return ()
    else; error("Uncaught case")
    end
end

function restore_unobserved_table_cards!(table::Table, inds)
    @inbounds for i in inds
        PlayingCards.restore!(table.deck, table.cards[i])
    end
    return nothing
end

function resample_unobserved_table_cards!(table::Table, inds)
    @inbounds for i in inds
        table.cards[i] = SB.sample!(table.deck)
    end
    return nothing
end

function restore_player_cards!(table::Table, player::Player)
    has_cards(player) || return false
    for (i, c) in enumerate(player.cards)
        PlayingCards.restore!(table.deck, c)
        player.cards[i] = joker
    end
    return true
end

function resample_player_cards!(table::Table, player::Player)
    @assert !has_cards(player)
    @inbounds for i in 1:2
        player.cards[i] = SB.sample!(table.deck)
    end
    return nothing
end
function resample_cards!(game::Game, player::Player)
    table = game.table
    players = players_at_table(table)
    tci = table_card_inds(table.round)
    player_cards_to_resample = BitVector(ntuple(i->false, length(players)))
    restore_unobserved_table_cards!(table, tci)
    for opponent in players
        sn = seat_number(opponent)
        sn == seat_number(player) && continue
        player_cards_to_resample[sn] = restore_player_cards!(table, opponent)
    end

    resample_unobserved_table_cards!(table, tci)
    for opponent in players
        sn = seat_number(opponent)
        sn == seat_number(player) && continue
        player_cards_to_resample[sn] || continue
        resample_player_cards!(table, opponent)
    end
end

"""
    recreate_game(game, player)

Creates an exact (deep)copy of the input game,
and then re-samples the _unobserved_ cards (i.e.,
the opponent cards and unobserved table cards).

This is useful for repeatedly sampling a specific
scenario so that we can compute the expected value
of a particular action.

TODO: we could make a mutating, in-place version of
this to reduce allocations.
"""
function recreate_game(game, player)
    rgame = deepcopy(game)
    resample_cards!(rgame, player)
    return rgame
end
