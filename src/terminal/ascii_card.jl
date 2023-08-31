import PlayingCards
const PC = PlayingCards
using PlayingCards

"""
    ascii_card(cards...; to_string=true)

ASCII cards.
"""
# ascii_card(cards...; kwargs...) = ascii_card(cards; kwargs...)
function ascii_card(cards; to_string=true, rbuffer="  ")
    lines = map(enumerate(cards)) do (i, c)
        _rbuffer = iseven(i) ? rbuffer : ""
        if c isa Card
            r = PC.rank_string(PC.rank(c))
            # space = PC.rank(c)==10 ? "" : " "
            space = " "
            # get the cards suit in two steps
            s = string(PC.suit(c))
            l1 = "┌─────────┐$_rbuffer"
            l2 = "│$r$space       │$_rbuffer"
            l3 = "│         │$_rbuffer"
            l4 = "│         │$_rbuffer"
            l5 = "│    $s    │$_rbuffer"
            l6 = "│         │$_rbuffer"
            l7 = "│         │$_rbuffer"
            l8 = "│       $space$(r)│$_rbuffer"
            l9 = "└─────────┘$_rbuffer"
            l1,l2,l3,l4,l5,l6,l7,l8,l9
        else
            ["┌─────────┐$_rbuffer", map(x->"│░░░░░░░░░│$_rbuffer", 1:7)..., "└─────────┘$_rbuffer"]
        end
    end
    strs = map(1:9) do j
        join(
            map(1:length(cards)) do i
                getindex(lines[i],j)
            end,
            ""
        )
    end
    return to_string ? join(strs, "\n") : strs
end

"""
    ascii_card_dealer(cards; to_string=true)

Similar to `ascii_card`, except that it hides
cards of type `card::Nothing`.
"""
function ascii_card_dealer(cards; to_string=true)
    all_lines = map(_->"", 1:9)
    kwargs = (;to_string=false, rbuffer="")
    for card in cards
        if card == joker
            card_lines = ascii_card((nothing,); kwargs...)
        else
            card_lines = ascii_card((card,); kwargs...)
        end
        all_lines = [x * y for (x, y) in zip(all_lines, card_lines)]
    end
    card_str = to_string ? join(all_lines, "\n") : all_lines
    width = length(all_lines[1])
    height = length(all_lines)
    return (card_str, width, height)
end
