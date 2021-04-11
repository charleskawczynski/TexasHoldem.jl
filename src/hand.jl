#### Hand

export Hand, hand_rank

struct Hand{C,TC,R,H}
    cards::C
    top_cards::TC
    rank::R
    hand::H
    Hand(player_cards::Tuple, table_cards::Tuple) =
        Hand((player_cards..., table_cards...))
    Hand(cards...) = Hand(cards)
    function Hand(cards::Tuple)
        sorted_cards = sort(collect(cards); by=x->high_value(x))
        top_cards, hand, rank = cards_hand_rank(cards)
        return new{
            typeof(cards),
            typeof(top_cards),
            typeof(hand),
            typeof(rank)}(cards, top_cards, hand, rank)
    end
end

Base.length(hand::Hand) = length(hand.cards)

function Base.iterate(hand::Hand, state = 1)
    state > length(hand) && return nothing
    return (hand.cards[state], state+1)
end

function Base.show(io::IO, hand::Hand)
    print(io, "(")
    s = map(card -> string(card), hand.cards)
    print(io, join(s, ", "))
    print(io, ")")
end

function cards_hand_rank(cards)
    ranks = map(combinations(cards, 5)) do five_card_combo
        (five_card_combo, hand_rank_and_group(five_card_combo)...)
    end
    i_max = argmin(map(x->x[2], ranks))
    return ranks[i_max]
end
