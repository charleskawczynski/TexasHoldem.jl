export CheckRaiseFold,
    CallRaiseFold,
    CallAllInFold,
    CallFold

abstract type PlayerOptions end
struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end
struct CallAllInFold <: PlayerOptions end
struct CallFold <: PlayerOptions end

function player_option!(game::Game, player::Player)
    table = game.table
    call_amt = call_amount(table, player)
    game_state = state(table)
    if !(call_amt ≈ 0) # must call to stay in
        if bank_roll(player) > call_amt # raise possible
            rb = valid_raise_bounds(table, player)
            if first(rb) ≈ last(rb) # only all-in raise possible
                player_option!(game, player, game_state, CallAllInFold())
            else
                player_option!(game, player, game_state, CallRaiseFold())
            end
        else # only all-in possible
            player_option!(game, player, game_state, CallFold())
        end
    else
        player_option!(game, player, game_state, CheckRaiseFold())
    end
end

#####
##### Human player options (ask via prompts)
#####

function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CheckRaiseFold, io::IO=stdin)
    options = ["Check", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && check!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(game.table, player, io))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallRaiseFold, io::IO=stdin)
    options = ["Call", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(game.table, player, io))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallAllInFold)
    options = ["Call", "All-in", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_all_in!(game, player)
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallFold)
    options = ["Call", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && fold!(game, player)
end

function input_raise_amt(table, player::Player{Human}, io::IO=stdin)
    raise_amt = nothing
    while true
        println(io, "Enter raise amt:")
        raise_amt = readline(io)
        try
            raise_amt = parse(Float64, raise_amt)
            is_valid, msg = is_valid_raise_amount(table, player, raise_amt)
            is_valid && break
            println(io, msg)
        catch
            println(io, "Raise must be a Float64")
        end
    end
    @assert raise_amt ≠ nothing
    amt = valid_raise_amount(table, player, raise_amt)
    return amt
end

#####
##### AbstractAI
#####

##### BotCheckFold

player_option!(game::Game, player::Player{BotCheckFold}, ::AbstractGameState, ::CheckRaiseFold) = check!(game, player)
player_option!(game::Game, player::Player{BotCheckFold}, ::AbstractGameState, ::CallRaiseFold) = fold!(game, player)
player_option!(game::Game, player::Player{BotCheckFold}, ::AbstractGameState, ::CallAllInFold) = fold!(game, player)
player_option!(game::Game, player::Player{BotCheckFold}, ::AbstractGameState, ::CallFold) = fold!(game, player)

##### BotCheckCall

player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CheckRaiseFold) = check!(game, player)
player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallRaiseFold) = call!(game, player)
player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallAllInFold) = call!(game, player)
player_option!(game::Game, player::Player{BotCheckCall}, ::AbstractGameState, ::CallFold) = call!(game, player)

##### Bot5050

function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CheckRaiseFold)
    if rand() < 0.5
        check!(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        amt = bound_raise(game.table, player, amt)
        raise_to!(game, player, amt)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallRaiseFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            amt = Int(round(rand()*bank_roll(player), digits=0))
            amt = bound_raise(game.table, player, amt)
            raise_to!(game, player, amt)
        end
    else
        fold!(game, player)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallAllInFold)
    if rand() < 0.5
        if rand() < 0.5 # Call
            call!(game, player)
        else # re-raise
            raise_all_in!(game, player)
        end
    else
        fold!(game, player)
    end
end
function player_option!(game::Game, player::Player{Bot5050}, ::AbstractGameState, ::CallFold)
    if rand() < 0.5
        call!(game, player)
    else
        fold!(game, player)
    end
end
