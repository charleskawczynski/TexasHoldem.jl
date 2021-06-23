# TODO: Add tests for came configurations

using REPL.TerminalMenus
export configure_game

function cofigure_n_players()
    n_players = nothing
    while true
        println("Enter number of players")
        n_players = readline()
        try
            n_players = parse(Int, n_players)
            2 ≤ n_players ≤ 10 && break
            println("Number of players must be between 2 and 10 (inclusive)")
        catch
            println("Number of players must be an integer between 2 and 10 (inclusive)")
        end
    end
    @assert n_players ≠ nothing
    @info "$n_players playing"
    return n_players
end

function cofigure_bank_roll(blinds)
    bank_roll = nothing
    while true
        println("Enter bank roll:")
        bank_roll = readline()
        try
            bank_roll = parse(Float64, bank_roll)
            bank_roll ≥ blinds.big && break
            println("Bank roll must be larger than or equal to the big blind")
        catch
            println("Bank roll must be a Float64 larger than or equal to the big blind")
        end
    end
    @assert bank_roll ≠ nothing
    @info "Players starting with a bank roll of \$$bank_roll"
    return bank_roll
end

function cofigure_blinds()
    big_blinds = nothing
    while true
        println("Enter big blind amount:")
        big_blinds = readline()
        try
            big_blinds = parse(Float64, big_blinds)
            big_blinds > sqrt(eps(Float64)) && break
            println("Blinds must be larger than `sqrt(eps(Float64))`")
        catch
            println("Blinds must be a float larger than `sqrt(eps(Float64))`")
        end
    end
    @assert big_blinds ≠ nothing
    @info "Blinds: $(big_blinds/2), $(big_blinds)"
    return Blinds(big_blinds/2, big_blinds)
end

function configure_basic_heads_up_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Human(), 1; bank_roll=bank_roll),
        Player(ai_to_use(), 2; bank_roll=bank_roll)
    )
    return Game(players; blinds=blinds)
end

function configure_basic_1v4_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Human(), 1; bank_roll=bank_roll),
        Player(ai_to_use(), 2; bank_roll=bank_roll),
        Player(ai_to_use(), 3; bank_roll=bank_roll),
        Player(ai_to_use(), 4; bank_roll=bank_roll),
        Player(ai_to_use(), 5; bank_roll=bank_roll),
    )
    return Game(players; blinds=blinds)
end

function configure_basic_2_bots_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(ai_to_use(), 1; bank_roll=bank_roll),
        Player(ai_to_use(), 2; bank_roll=bank_roll),
    )
    return Game(players; blinds=blinds)
end

function configure_basic_4_bots_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(ai_to_use(), 1; bank_roll=bank_roll),
        Player(ai_to_use(), 2; bank_roll=bank_roll),
        Player(ai_to_use(), 3; bank_roll=bank_roll),
        Player(ai_to_use(), 4; bank_roll=bank_roll),
    )
    return Game(players; blinds=blinds)
end

function configure_human_players(n_players)
    options = string.(1:n_players)
    menu = MultiSelectMenu(options) # charset=:unicode is not supported in earlier Julia versions
    choices = request("Select which players are human:", menu)
    println("$(length(choices)) human players ($(join(sort(collect(choices)), ", ")))")
    length(choices) > 0 || println("No human players.")
    human_seat_numbers = collect(choices)
    return human_seat_numbers
end

function configure_custom_game()

    n_players = cofigure_n_players()
    blinds = cofigure_blinds()
    human_seat_numbers = configure_human_players(n_players)
    bank_roll = cofigure_bank_roll(blinds)

    players = ntuple(n_players) do i
        if i in human_seat_numbers
            Player(Human(), i; bank_roll=bank_roll)
        else
            Player(ai_to_use(), i; bank_roll=bank_roll)
        end
    end

    return Game(players; blinds=blinds)
end

function configure_game()
    options = [
        "1) Heads up-- you vs AI, \$1-\$2 blinds, \$100 bank roll",
        "2) 1v4-- you vs 4 AI, \$1-\$2 blinds, \$100 bank roll",
        "3) 2 bots!, \$1-\$2 blinds, \$100 bank roll",
        "4) 4 bots!, \$1-\$2 blinds, \$100 bank roll",
        "5) custom game"
    ]
    menu = RadioMenu(options, pagesize=4)
    choice = request("Configure game:", menu)
    if choice != -1
        choice == 1 && return configure_basic_heads_up_game()
        choice == 2 && return configure_basic_1v4_game()
        choice == 3 && return configure_basic_2_bots_game()
        choice == 4 && return configure_basic_4_bots_game()
        choice == 5 && return configure_custom_game()
        error("Uncaught case")
    else
        println("Menu canceled.")
    end
end

export configure_play_game
function configure_play_game()
    # game = configure_game()
    game = configure_basic_heads_up_game()
    play!(game)
end
