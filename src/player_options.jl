abstract type PlayerOptions end
struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end

function player_option!(game::Game, player::Player)
    if raise_needs_call(game, player)
        player_option!(game, player, CallRaiseFold())
    else
        player_option!(game, player, CheckRaiseFold())
    end
end

#####
##### Bot player options (ask via prompts)
#####

function player_option!(game::Game, player::Player{BotRandom}, ::CheckRaiseFold)
    if rand() < 0.5
        check!(game, player)
        @info "(Bot) player $(player.id) checked"
    else
        amt = Int(round(rand()*player.bank_roll, digits=0))
        raise!(game, player, amt)
        @info "(Bot) player $(player.id) raised \$$(amt)!"
    end
end
function player_option!(game::Game, player::Player{BotRandom}, ::CallRaiseFold)
    if rand() < 0.5
        if rand() < 0.5
            call!(game, player, game.current_raise_amt)
            @info "(Bot) player $(player.id) called!"
        else
            amt = Int(round(rand()*player.bank_roll, digits=0))
            raise!(game, player, amt)
            @info "(Bot) player $(player.id) re-raised \$$(amt)!"
        end
    else
        fold!(game, player)
        @info "(Bot) player $(player.id) folded!"
    end
end

#####
##### Human player options (ask via prompts)
#####

function player_option!(game::Game, player::Player{Human}, ::CheckRaiseFold)
    options = ["Check", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("Player $(player.id)'s turn to act:", menu)
    choice == -1 && error("Uncaught case in `act!(game::Game, player::Player{Human}, ::CheckRaiseFold)`")
    choice == 1 && check!(game, player)
    choice == 2 && raise!(game, player, input_raise_amt(player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::CallRaiseFold)
    options = ["Call", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("Player $(player.id)'s turn to act:", menu)
    choice == -1 && error("Uncaught case in `act!(game::Game, player::Player{Human}, ::CallRaiseFold)`")
    choice == 1 && call!(game, player, game.current_raise_amt)
    choice == 2 && raise!(game, player, input_raise_amt(player))
    choice == 3 && fold!(game, player)
end

######
###### Helpers
######

function input_raise_amt(player::Player{Human})
    raise_amt = nothing
    while true
        println("Enter raise amt:")
        raise_amt = readline()
        try
            raise_amt = parse(Float64, raise_amt)
            raise_amt ≤ player.bank_roll && break
            println("Player $(player.id) doesn't have enough funds (\$$(player.bank_roll)) to bet \$$(raise_amt)")
        catch
            println("Raise must be a Float64")
        end
    end
    @assert raise_amt ≠ nothing
    @info "Player $(player.id) bets \$$(raise_amt)"
    return raise_amt
end

# TODO: fix logic (this is currently broken)
function raise_needs_call(game::Game, player::Player)
    for ah in action_history.(game.players)
        length(ah) == 0 && continue
        if last(ah) isa Raise
            return true
        end
    end
    return false
end
