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

function print_state(game::Game, ::Deal)
    players = map(game.players) do player
        star = player_button_star(game.table, player)
        star*name(player)
    end
    players = hcat("Players", players...)
    player_cards = map(game.players) do player
        join(string.(player.cards), ", ")
    end
    player_cards = hcat("Cards", player_cards...)
    println(repeat("-", (15+1)*(length(game.players)+1)))
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
    println(repeat("-", (15+1)*(length(game.players)+1)))
end
print_state(game::Game, ::PayBlinds) = nothing

function action_table_data(game::Game)
    n_players = length(game.players)
    n_rounds = maximum(map(player -> length(player.action_history), game.players))
    rounds = map(i->"Round $i", 1:n_rounds)
    header = reshape(vcat("Player", "Cards", rounds), 1,n_rounds+2)
    rows = map(game.players) do player
        star = player_button_star(game.table, player)
        star*"Player[$(player.id)]"
    end
    rows = collect(rows)
    data = vcat(collect(map(game.players) do player
        arr = collect(padded_array(player.action_history, n_rounds))
        reshape(arr, 1, size(arr, 1))
    end)...)

    cards = vcat(collect(map(game.players) do player
        join(string.(player.cards), ", ")
    end)...)

    all_data = hcat(rows, cards, data)
    table_cards = observed_cards(game.table)
    return all_data, header, table_cards
end

function results_table_data(game::Game)
    header = ["Player" "Hand"]
    rows = map(game.players) do player
        star = player_button_star(game.table, player)
        star*"Player[$(player.id)]"
    end
    rows = collect(rows)
    data = vcat(collect(map(game.players) do player
        join(string.(player.cards), ", ")
    end)...)
    all_data = hcat(rows, data)
    return all_data, header
end
