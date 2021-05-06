abstract type PlayerOptions end
struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end
struct PayBlindSitOut <: PlayerOptions end

function player_option!(game::Game, player::Player)
    if any(last_to_raise.(players_at_table(game)))
        player_option!(game, player, CallRaiseFold())
    else
        player_option!(game, player, CheckRaiseFold())
    end
end

#####
##### Human player options (ask via prompts)
#####

function player_option(player::Player{Human}, ::PayBlindSitOut)
    options = ["Pay blind", "Sit out a hand"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return PayBlind()
    choice == 2 && return SitOut()
end
function player_option!(game::Game, player::Player{Human}, ::CheckRaiseFold)
    options = ["Check", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && check!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::CallRaiseFold)
    options = ["Call", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player, game.table.current_raise_amt)
    choice == 2 && raise_to!(game, player, input_raise_amt(player))
    choice == 3 && fold!(game, player)
end

function input_raise_amt(player::Player{Human})
    raise_amt = nothing
    while true
        println("Enter raise amt:")
        raise_amt = readline()
        try
            raise_amt = parse(Float64, raise_amt)
            raise_amt ≤ player.bank_roll && break
            println("$(name(player)) doesn't have enough funds (\$$(player.bank_roll)) to bet \$$(raise_amt)")
        catch
            println("Raise must be a Float64")
        end
    end
    @assert raise_amt ≠ nothing
    return raise_amt
end

#####
##### AbstractAI
#####

##### BotRandom

player_option(player::Player{BotRandom}, ::PayBlindSitOut) = PayBlind()

function player_option!(game::Game, player::Player{BotRandom}, ::CheckRaiseFold)
    if rand() < 0.5
        check!(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        raise_to!(game, player, min(amt, blinds(game).small))
    end
end
function player_option!(game::Game, player::Player{BotRandom}, ::CallRaiseFold)
    if rand() < 0.5
        if rand() < 0.5 # TODO: broken: if false: no action is taken. Need raise_to! add validate_raise to properly fix
            if game.table.current_raise_amt ≤ bank_roll(player)
                call!(game, player, game.table.current_raise_amt)
            else
                call!(game, player, bank_roll(player))
            end
            if rand() < 0.5
                amt = Int(round(rand()*bank_roll(player), digits=0))
                raise_to!(game, player, min(amt, blinds(game).small))
            end
        end
    else
        fold!(game, player)
    end
end
