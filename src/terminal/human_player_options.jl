#####
##### Human player options (ask via prompts)
#####

function player_option(game::Game, player::Player{Human}, ::CheckRaiseFold, io::IO=stdin)
    table = game.table
    vrr = valid_raise_range(table, player)
    options = ["Check", "Raise [$(first(vrr)), $(last(vrr))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return Check()
    choice == 2 && return Raise(input_raise_amt(table, player, io))
    choice == 3 && return Fold()
end
function player_option(game::Game, player::Player{Human}, ::CallRaiseFold, io::IO=stdin)
    table = game.table
    vrr = valid_raise_range(table, player)
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call $(call_amt)$blind_str", "Raise [$(first(vrr)), $(last(vrr))]", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return Call(table, player)
    choice == 2 && return Raise(input_raise_amt(table, player, io))
    choice == 3 && return Fold()
end
function player_option(game::Game, player::Player{Human}, ::CallAllInFold)
    table = game.table
    call_amt = call_amount(table, player)
    all_in_amt = round_bank_roll(player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call $(call_amt)$blind_str", "Raise all-in ($(all_in_amt))", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return Call(table, player)
    choice == 2 && return AllIn(table, player)
    choice == 3 && return Fold()
end
function player_option(game::Game, player::Player{Human}, ::CallFold)
    table = game.table
    call_amt = call_amount(table, player)
    blind_str = is_blind_call(table, player) ? " (blind)" : ""
    options = ["Call $(call_amt)$blind_str", "Fold"]
    menu = RadioMenu(options, pagesize=4)
    choice = request("$(name(player))'s turn to act:", menu)
    choice == -1 && error("Uncaught case")
    choice == 1 && return Call(table, player)
    choice == 2 && return Fold()
end

# io only works for tests, but does not for user input
# so we have a switch for the test suite
use_input_io() = false
println_io(io::IO, msg) = use_input_io() ? println(io, msg) : println(msg)

function input_raise_amt(table, player::Player{Human}, io::IO=stdin)
    raise_amt = nothing
    while true
        println_io(io, "Enter raise amt:")
        raise_amt = readline(io)
        try
            raise_amt = parse(Int, raise_amt)
            is_valid, msg = is_valid_raise_amount(table, player, raise_amt)
            is_valid && break
            println_io(io, msg)
        catch
            println_io(io, "Raise must be a Int")
        end
    end
    @assert raise_amt ≠ nothing
    amt = valid_raise_amount(table, player, raise_amt)
    return amt
end
