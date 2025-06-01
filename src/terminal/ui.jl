
update_gui(table::Table, pov_player=nothing) = update_gui(stdout, table, pov_player)
update_gui(io::IO, table::Table, pov_player) = update_gui(io, table, table.gui, pov_player)

update_gui(io::IO, table::Table, ::NoGUI, pov_player) = nothing

clear_screen(io::IO) = print(io, "\33c\e[3J")

function combine_ascii_objects(objects)
    lengths = length.(objects)
    lmax = maximum(lengths)
    return map(1:lmax) do i
        lines = map(objects) do obj
            getindex(obj, i)
        end
        join(lines, "")
    end
end

function hide_card(winners, pov_player, player)
    return if winners.declared
        pot_eligible(player) ? false : true
    elseif pov_player isa Nothing
        true
    else
        seat_number(pov_player) == seat_number(player) ? false : true
    end
end

function update_gui(io::IO, table::Table, ::Terminal, pov_player)
    gui = table.gui
    clear_screen(io)
    # Print pot info
    println(io, "       Round: $(nameof(typeof(table.round)))")
    println(io, "       Chips in pot: $(pot(table.transactions))")
    for i in 1:2; println(io); end
    ocs = if table.winners.declared
        observed_cards_all(table, :river)
    else
        observed_cards_all(table)
    end
    (table_cards, width, height) = ascii_card_dealer(ocs; to_string=true)
    println(io, "                Table cards")
    println(io, table_cards)
    println(io)
    println(io, "                Player cards")
    println(io)
    players = players_at_table(table)

    visible_player_cards = map(players) do player
        if hide_card(table.winners, pov_player, player)
            [nothing, nothing]
        else
            cards(player)
        end
    end

    ascii_players = map(zip(players, visible_player_cards)) do (p, pc)
        ascii_player(table, p, pc; rbuffer="  ")
    end
    ascii_players = combine_ascii_objects(ascii_players)
    for line in ascii_players
        println(io, line)
    end
    println(io)

    if table.winners.declared
        tm = table.transactions
        for (player, player_winnings) in zip(players, tm.side_pot_winnings)
            log_player_winnings(player, player_winnings, tm)
        end
    end

end

