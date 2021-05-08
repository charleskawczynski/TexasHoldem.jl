abstract type PlayerOptions end
struct CheckRaiseFold <: PlayerOptions end
struct CallRaiseFold <: PlayerOptions end
struct CallAllInFold <: PlayerOptions end # TODO: maybe useful?
struct CallFold <: PlayerOptions end
struct PayBlindSitOut <: PlayerOptions end

function player_option!(game::Game, player::Player)
    cra = game.table.current_raise_amt
    pc = player.round_contribution
    cra ≈ 0 && (@assert pc ≈ 0)
    call_amt = cra - pc
    @debug "player_option! cra = $cra, pc = $pc, call_amt = $call_amt, !(call_amt ≈ 0) = $(!(call_amt ≈ 0))"
    if !(call_amt ≈ 0)
        pc = player.round_contribution
        amt_required_to_call = cra-pc # (i.e., call amount)
        raise_possible = bank_roll(player) > amt_required_to_call
        @debug "raise_possible = $raise_possible"
        if raise_possible # all-in or fold
            player_option!(game, player, CallRaiseFold())
        else
            player_option!(game, player, CallFold())
        end
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
    choice == 2 && raise_to!(game, player, input_raise_amt(game.table, player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::CallRaiseFold)
    options = ["Call", "Raise", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && call!(game, player)
    choice == 2 && raise_to!(game, player, input_raise_amt(game.table, player))
    choice == 3 && fold!(game, player)
end
function player_option!(game::Game, player::Player{Human}, ::CallFold)
    options = ["Call", "Fold"]
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

player_option(player::Player{BotSitOut}, ::PayBlindSitOut) = SitOut() # no other options needed

##### BotCheckFold

player_option(player::Player{BotCheckFold}, ::PayBlindSitOut) = PayBlind()
player_option!(game::Game, player::Player{BotCheckFold}, ::CheckRaiseFold) = check!(game, player)
player_option!(game::Game, player::Player{BotCheckFold}, ::CallRaiseFold) = fold!(game, player)
player_option!(game::Game, player::Player{BotCheckFold}, ::CallFold) = fold!(game, player)

##### BotCheckCall

player_option(player::Player{BotCheckCall}, ::PayBlindSitOut) = PayBlind()
player_option!(game::Game, player::Player{BotCheckCall}, ::CheckRaiseFold) = check!(game, player)
player_option!(game::Game, player::Player{BotCheckCall}, ::CallRaiseFold) = call!(game, player)
player_option!(game::Game, player::Player{BotCheckCall}, ::CallFold) = call!(game, player)

##### BotRandom

player_option(player::Player{BotRandom}, ::PayBlindSitOut) = PayBlind()

function player_option!(game::Game, player::Player{BotRandom}, ::CheckRaiseFold)
    if rand() < 0.5
        check!(game, player)
    else
        amt = Int(round(rand()*bank_roll(player), digits=0))
        amt = bound_raise(game.table, player, amt)
        raise_to!(game, player, amt)
    end
end
function player_option!(game::Game, player::Player{BotRandom}, ::CallRaiseFold)
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

function player_option!(game::Game, player::Player{BotRandom}, ::CallFold)
    if rand() < 0.5
        call!(game, player)
    else
        fold!(game, player)
    end
end
