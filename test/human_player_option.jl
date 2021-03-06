using Test
using REPL.TerminalMenus
using PlayingCards
using TexasHoldem
import TexasHoldem
TH = TexasHoldem

function simulate_keystrokes(keys...)
    keydict =  Dict(:up => "\e[A",
                    :down => "\e[B",
                    :enter => "\r")
    for key in keys
        if isa(key, Symbol)
            write(stdin.buffer, keydict[key])
        elseif isa(key, Char)
            write(stdin.buffer, "$key")
        else
            write(stdin.buffer, key)
        end
    end
end

@testset "Test fold" begin
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.player_option!(game, players[1], CheckRaiseFold())
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.player_option!(game, players[1], CallRaiseFold())
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.player_option!(game, players[1], CallAllInFold())
    simulate_keystrokes(:down, :enter, 'd')
    TH.player_option!(game, players[1], CallFold())
end

@testset "Test check" begin
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    simulate_keystrokes(:enter, 'd')
    TH.player_option!(game, players[1], CheckRaiseFold())
end

@testset "Test call" begin
    # No initial round contribution
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    game.table.current_raise_amt = 10.0
    simulate_keystrokes(:enter, 'd', 10.0)
    TH.player_option!(game, players[1], CallRaiseFold())
    @test last(TH.action_history(players[1])) == Call{Float64}(10.0)

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    game.table.current_raise_amt = 10.0
    simulate_keystrokes(:enter, 'd', 10.0)
    TH.player_option!(game, players[1], CallAllInFold())
    @test last(TH.action_history(players[1])) == Call{Float64}(10.0)

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    game.table.current_raise_amt = 10.0
    simulate_keystrokes(:enter, 'd', 10.0)
    TH.player_option!(game, players[1], CallFold())
    @test last(TH.action_history(players[1])) == Call{Float64}(10.0)
end

@testset "Test All-in raise" begin
    # No initial round contribution
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    game.table.current_raise_amt = 10.0
    simulate_keystrokes(:down, :enter, 'd')
    TH.player_option!(game, players[1], CallAllInFold())
    @test last(TH.action_history(players[1])) == Raise{Float64}(200.0)
end

#=
Ideally, we'd use `simulate_keystrokes` for all of
these tests. We can't seem to, however.

 - Fold, Check, and Call only require prompts, then user
   inputs, so we can get away with `simulate_keystrokes`.

 - Raises require multiple interleaved user input-prompts,
   so we need to use TerminalRegressionTests.
=#

TH.use_input_io() = true
@static if !Sys.iswindows()
    using TerminalRegressionTests
    TRT = TerminalRegressionTests
    path = "terminal_test_output"

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    table = game.table
    file = joinpath(path,"input_raise_amt.output")
    TRT.automated_test(file, ["oops_string", 10]) do emuterm
        @testset "Human player options: input_raise_amt" begin
            @test TH.input_raise_amt(game.table, players[1], emuterm) == 10
        end
    end

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    table = game.table
    table.current_raise_amt = 0
    file = joinpath(path,"CheckRaiseFold.output")
    simulate_keystrokes(:down, :enter) # select Raise
    TRT.automated_test(file, [10]) do emuterm
        @testset "Human player options: CheckRaiseFold" begin
            TH.player_option!(game, players[1], CheckRaiseFold(), emuterm)
        end
    end

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    game = Game(players)
    table = game.table
    table.current_raise_amt = 10
    file = joinpath(path,"CallRaiseFold.output")
    simulate_keystrokes(:down, :enter) # select Raise
    TRT.automated_test(file, [20]) do emuterm
        @testset "Human player options: CallRaiseFold" begin
            TH.player_option!(game, players[1], CallRaiseFold(), emuterm)
        end
    end
end
TH.use_input_io() = false

