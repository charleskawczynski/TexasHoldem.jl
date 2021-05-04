#####
##### Game viz
#####

function padded_array(a, n_rounds)
    if length(a) < n_rounds
        sa = string.(a)
        pad = repeat([""], n_rounds-length(a))
        pa = String[sa..., pad...]
    else
        pa = string.(a)
    end
    return pa
end

print_state(game::Game) = print_state(game, game.state)

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

function action_table_data(game::Game)
    n_players = length(players_at_table(game))
    n_rounds = maximum(map(player -> length(player.action_history), players_at_table(game)))
    rounds = map(i->"Round $i", 1:n_rounds)
    header = reshape(vcat("Player", "Cards", rounds), 1,n_rounds+2)
    rows = map(players_at_table(game)) do player
        star = player_button_star(game.table, player)
        star*name(player)
    end
    rows = collect(rows)
    data = vcat(collect(map(players_at_table(game)) do player
        arr = collect(padded_array(player.action_history, n_rounds))
        reshape(arr, 1, size(arr, 1))
    end)...)

    cards = vcat(collect(map(players_at_table(game)) do player
        join(string.(player.cards), ", ")
    end)...)

    all_data = hcat(rows, cards, data)
    table_cards = observed_cards(game.table)
    return all_data, header, table_cards
end

function results_table_data(game::Game)
    header = ["Player" "Hand"]
    rows = map(players_at_table(game)) do player
        star = player_button_star(game.table, player)
        star*name(player)
    end
    rows = collect(rows)
    data = vcat(collect(map(players_at_table(game)) do player
        join(string.(player.cards), ", ")
    end)...)
    all_data = hcat(rows, data)
    return all_data, header
end
