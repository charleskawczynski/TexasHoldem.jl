export SitDownSitOut,
    CheckRaiseFold,
    CallRaiseFold,
    CallAllInFold,
    CallFold

abstract type PlayerOptions end

struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end
struct CallAllInFold <: PlayerOptions end
struct CallFold <: PlayerOptions end
struct SitDownSitOut <: PlayerOptions end

function player_option!(game::Game, player::Player)
    game_state = state(game.table)
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

player_option(table::Table, player::Player, ::SitDownSitOut) = SitDown()

#####
##### Human player options (ask via prompts)
#####

function player_option(table::Table, player::Player{Human}, ::SitDownSitOut)
    options = ["Play", "Sit out a hand"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return SitDown()
    choice == 2 && return SitOut()
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CheckRaiseFold)
    table = game.table
    rb = valid_raise_bounds(table, player)
    options = ["Check", "Raise [\$$(minimum(rb)), \$$(maximum(rb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && check!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(table, player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallRaiseFold)
    table = game.table
    rb = valid_raise_bounds(table, player)
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise [\$$(minimum(rb)), \$$(maximum(rb))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(table, player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::AbstractGameState, ::CallAllInFold)
    table = game.table
    call_amt = call_amount(table, player)
    all_in_amt = round_bank_roll(player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Raise all-in \$$(all_in_amt)", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_all_in!(game, player)
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
    table = game.table
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call \$$(call_amt)$blind_str", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && fold!(game, player)
end

function input_raise_amt(table, player::Player{Human})
    raise_amt = nothing
    while true
        println("Enter raise amt:")
        raise_amt = readline()
        try
            raise_amt = parse(Float64, raise_amt)
            # TODO: Write `is_valid_raise_amount`, and use for better error messages.
        catch
            println("Raise must be a Float64")
        end
        raise_amt = valid_raise_amount(table, player, raise_amt)
        break
    end
    @assert raise_amt ≠ nothing
    return raise_amt
end

#####
##### AbstractAI
#####

##### BotSitOut

player_option(player::Player{BotSitOut}, ::SitDownSitOut) = SitOut() # no other options needed

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
