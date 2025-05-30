table_card_inds(::PreFlop) = ntuple(i->i, 5)
table_card_inds(::Flop) = (4, 5)
table_card_inds(::Turn) = (5,)
table_card_inds(::River) = ()

function restore_unobserved_table_cards(table::Table, inds)
    (; cards, deck) = table
    @inbounds for i in inds
        PlayingCards.restore!(deck, cards[i])
    end
    @reset table.cards = cards
    @reset table.deck = deck
    return table
end

function resample_unobserved_table_cards(table::Table, inds)
    (; cards, deck) = table
    @inbounds for i in inds
        cards[i] = SB.sample!(deck)
    end
    @reset table.cards = cards
    @reset table.deck = deck
    return table
end

function restore_player_cards(table::Table, player::Player)
    has_cards(player) || return (table, false)
    for (i, c) in enumerate(player.cards)
        PlayingCards.restore!(table.deck, c)
        player.cards[i] = joker
    end
    return true
end

function resample_player_cards(table::Table, player::Player)
    @assert !has_cards(player)
    @inbounds for i in 1:2
        player.cards[i] = SB.sample!(table.deck)
    end
    pidx = pidx_from_seat_number(player, players_at_table(table))
    @reset table.players[pidx] = player
    return table
end
function resample_cards(game::Game, player::Player)
    table = game.table
    players = players_at_table(table)
    tci = table_card_inds(table.round)
    player_cards_to_resample = BitVector(ntuple(i->false, length(players)))
    table = restore_unobserved_table_cards(table, tci)
    for opidx in 1:length(players)
        opponent = players[opidx]
        sn = seat_number(opponent)
        sn == seat_number(player) && continue
        (table, player_cards_to_resample[sn]) = restore_player_cards(table, opponent)
        @reset table.players[opidx] = opponent
    end

    table = resample_unobserved_table_cards(table, tci)
    for opidx in 1:length(players)
        opponent = players[opidx]
        sn = seat_number(opponent)
        sn == seat_number(player) && continue
        player_cards_to_resample[sn] || continue
        table = resample_player_cards(table, opponent)
        @reset table.players[opidx] = opponent
    end
    @reset game.table = table
    return game
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
    rgame = resample_cards(rgame, player)
    return rgame
end
