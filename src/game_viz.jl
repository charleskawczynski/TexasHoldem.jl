#####
##### Game viz
#####

print_state(game::Game) = print_state(game, game.table.state)

include("print_row.jl")

function print_state(game::Game, ::PreFlop)
    players = map(players_at_table(game)) do player
        star = player_button_star(game.table, player)
        star*name(player)
    end
    players = hcat("Players", players...)
    player_cards = map(players_at_table(game)) do player
        join(string.(player.cards), ", ")
    end
    player_cards = hcat("Cards", player_cards...)
    println(repeat("-", (15+1)*(length(players_at_table(game))+1)))
    println(sprint_row(players))
    println(sprint_row(player_cards))
end
function print_state(game::Game, ::Flop)
    table_cards = string.(observed_cards(game.table))
    table_cards = hcat("Flop", table_cards)
    println()
    println(sprint_row(table_cards))
end
function print_state(game::Game, ::Turn)
    table_cards = string.(observed_cards(game.table))
    table_cards = hcat("Turn", table_cards)
    println()
    println(sprint_row(table_cards))
end
function print_state(game::Game, ::River)
    table_cards = string.(observed_cards(game.table))
    table_cards = hcat("River", table_cards)
    println()
    println(sprint_row(table_cards))
    println(repeat("-", (15+1)*(length(players_at_table(game))+1)))
end
