#### Deck

export Deck,
       shuffle!,
       OrderedDeck

struct Deck{C <: Vector}
  cards::C
end

Base.length(deck::Deck) = length(deck.cards)
Base.pop!(deck::Deck, n::Integer) = ntuple(i->pop!(deck.cards), n)

function OrderedDeck()
  deck = Card[]
  for r in rank_list
    for s in suit_list
      push!(deck, Card(r,s))
    end
  end
  return Deck(deck)
end

function shuffle!(deck::Deck)
  deck.cards .= deck.cards[randperm(length(deck.cards))]
  nothing
end
