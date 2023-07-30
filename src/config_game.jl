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
            bank_roll = parse(Int, bank_roll)
            bank_roll ≥ blinds.big && break
            println("Bank roll must be larger than or equal to the big blind")
        catch
            println("Bank roll must be a Int larger than or equal to the big blind")
        end
    end
    @assert bank_roll ≠ nothing
    @info "Players starting with a bank roll of \$$bank_roll"
    return bank_roll
end

function cofigure_blinds()
    small_blind = nothing
    while true
        println("Enter small blind amount:")
        small_blind = readline()
        try
            small_blind = parse(Int, small_blind)
            small_blind > 0 && break
            println("Small blind must be larger than 0")
        catch
            println("Small blind must be a `Int` larger than 0")
        end
    end
    @assert small_blind ≠ nothing
    @info "Blinds: $(small_blind), $(2*small_blind)"
    return Blinds(small_blind, 2*small_blind)
end

function configure_basic_heads_up_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Human(), 1; bank_roll=bank_roll),
        Player(Bot5050(), 2; bank_roll=bank_roll)
    )
    return Game(players; blinds=blinds)
end

function configure_basic_1v4_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Human(), 1; bank_roll=bank_roll),
        Player(Bot5050(), 2; bank_roll=bank_roll),
        Player(Bot5050(), 3; bank_roll=bank_roll),
        Player(Bot5050(), 4; bank_roll=bank_roll),
        Player(Bot5050(), 5; bank_roll=bank_roll),
    )
    return Game(players; blinds=blinds)
end

function configure_basic_2_bots_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Bot5050(), 1; bank_roll=bank_roll),
        Player(Bot5050(), 2; bank_roll=bank_roll),
    )
    return Game(players; blinds=blinds)
end

function configure_basic_4_bots_game()
    bank_roll = 100
    blinds = Blinds(1, 2)
    players = (
        Player(Bot5050(), 1; bank_roll=bank_roll),
        Player(Bot5050(), 2; bank_roll=bank_roll),
        Player(Bot5050(), 3; bank_roll=bank_roll),
        Player(Bot5050(), 4; bank_roll=bank_roll),
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
            Player(Bot5050(), i; bank_roll=bank_roll)
        end
    end

    return Game(players; blinds=blinds)
end

function configure_game()
    options = [
        "1) Heads up-- you vs Bot5050, \$1-\$2 blinds, \$100 bank roll",
        "2) 1v4-- you vs 4 Bot5050's, \$1-\$2 blinds, \$100 bank roll",
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
