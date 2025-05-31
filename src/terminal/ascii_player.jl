import PokerHandEvaluator
const PHE = PokerHandEvaluator

function ascii_player(table, player, player_cards; to_string=false, rbuffer="")
    showdown = table.winners.declared
    tm = table.transactions
    card_lines = ascii_card(player_cards; to_string, rbuffer)
    width = length(card_lines[1])
    net_winnings = showdown ? "Net winnings: $(profit(player, tm))" : ""
    hand = if !isnothing(player_cards[1]) && showdown
        "$(PHE.hand_type(PHE.CompactHandEval((player_cards..., table.cards...))))"
    else
        ""
    end
    info = [
        name(player),
        "pot investment: $(pot_investment(player))",
        "bank roll: $(bank_roll(player))",
        "pot-eligible: $(pot_eligible(player) ? "yes" : "no")",
        net_winnings,
        hand,
    ]
    lines = [i * repeat(" ", max((width - length(i)),0)) for i in info]
    lines = vcat(lines, card_lines)
    return to_string ? join(lines, "\n") : lines
end
