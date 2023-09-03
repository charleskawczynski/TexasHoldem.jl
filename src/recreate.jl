
function resample_unobserved_table_cards!(table::Table, round::PreFlop)
    for c in table.cards
        PlayingCards.restore!(table.deck, c)
    end
    @inbounds for j in 1:5
        table.cards[j] = SB.sample!(table.deck)
    end
    return nothing
end
function resample_unobserved_table_cards!(table::Table, round::Flop)
    @inbounds PlayingCards.restore!(table.deck, table.cards[4])
    @inbounds PlayingCards.restore!(table.deck, table.cards[5])
    @inbounds table.cards[4] = SB.sample!(table.deck)
    @inbounds table.cards[5] = SB.sample!(table.deck)
    return nothing
end
function resample_unobserved_table_cards!(table::Table, round::Turn)
    @inbounds PlayingCards.restore!(table.deck, table.cards[5])
    @inbounds table.cards[5] = SB.sample!(table.deck)
    return nothing
end
resample_unobserved_table_cards!(table::Table, round::River) = nothing

function resample_player_cards!(table::Table, player::Player)
    @assert has_cards(player)
    for c in player.cards
        PlayingCards.restore!(table.deck, c)
    end
    @inbounds for j in 1:2
        player.cards[j] = SB.sample!(table.deck)
    end
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
