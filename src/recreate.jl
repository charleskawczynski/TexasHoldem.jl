
function resample_unobserved_table_cards!(table::Table, round::PreFlop)
    for c in table.cards
        PlayingCards.restore!(table.deck, c)
    end
    table.cards = ntuple(i->SB.sample!(table.deck), 5)
    return nothing
end
function resample_unobserved_table_cards!(table::Table, round::Flop)
    @inbounds PlayingCards.restore!(table.deck, table.cards[4])
    @inbounds PlayingCards.restore!(table.deck, table.cards[5])
    @inbounds table.cards = (
        table.cards[1:3]...,
        SB.sample!(table.deck),
        SB.sample!(table.deck),
    )
    return nothing
end
function resample_unobserved_table_cards!(table::Table, round::Turn)
    @inbounds PlayingCards.restore!(table.deck, table.cards[5])
    @inbounds table.cards = (
        table.cards[1:4]...,
        SB.sample!(table.deck),
    )
    return nothing
end
resample_unobserved_table_cards!(table::Table, round::River) = nothing

function resample_player_cards!(table::Table, player::Player)
    @assert player.cards ≠ (nothing, nothing)
    for c in player.cards
        PlayingCards.restore!(table.deck, c)
    end
    player.cards = (SB.sample!(table.deck), SB.sample!(table.deck))
    return nothing
end
function resample_cards!(game::Game, player::Player)
    table = game.table
    for opponent in players_at_table(table)
        seat_number(opponent) == seat_number(player) && continue
        resample_player_cards!(table, opponent)
    end
    resample_unobserved_table_cards!(table, table.round)
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
