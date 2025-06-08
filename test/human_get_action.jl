using Test
using REPL.TerminalMenus
using PlayingCards
using TexasHoldem
const TH = TexasHoldem

if VERSION >= v"1.8.0"
    function simulate_keystrokes(keys...)
        keydict =  Dict(:up => "\e[A",
                        :down => "\e[B",
                        :enter => "\r")

        new_stdin = Base.BufferStream()
        for key in keys
            if isa(key, Symbol)
                write(new_stdin, keydict[key])
            else
                write(new_stdin, "$key")
            end
        end
        TerminalMenus.terminal.in_stream = new_stdin
    end
else
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
end

@testset "Test fold" begin
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.get_action(game, players[1], CheckRaiseFold())
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.get_action(game, players[1], CallRaiseFold())
    simulate_keystrokes(:down, :down, :enter, 'd')
    TH.get_action(game, players[1], CallAllInFold())
    simulate_keystrokes(:down, :enter, 'd')
    TH.get_action(game, players[1], CallFold())
end

@testset "Test check" begin
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    simulate_keystrokes(:enter, 'd')
    TH.get_action(game, players[1], CheckRaiseFold())
end

@testset "Test call" begin
    # No initial round contribution
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    game.table.total_bet = 10
    simulate_keystrokes(:enter, 'd', 10)
    act = TH.get_action(game, players[1], CallRaiseFold())
    @test act == TH.Call(10)

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    game.table.total_bet = 10
    simulate_keystrokes(:enter, 'd', 10)
    act = TH.get_action(game, players[1], CallAllInFold())
    @test act == TH.Call(10)

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    game.table.total_bet = 10
    simulate_keystrokes(:enter, 'd', 10)
    act = TH.get_action(game, players[1], CallFold())
    @test act == TH.Call(10)
end

@testset "Test All-in raise" begin
    # No initial round contribution
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    game.table.total_bet = 10
    simulate_keystrokes(:down, :enter, 'd')
    act = TH.get_action(game, players[1], CallAllInFold())
    @test act.amt == 200
    @test act == TH.AllIn(act.amt)
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

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    table = game.table
    file = joinpath(path,"input_raise_amt.output")
    TRT.automated_test(file, ["oops_string", 10]) do emuterm
        @testset "Human player options: input_raise_amt" begin
            @test TH.input_raise_amt(game.table, players[1], emuterm) == 10
        end
    end

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    table = game.table
    table.total_bet = 0
    file = joinpath(path,"CheckRaiseFold.output")
    simulate_keystrokes(:down, :enter) # select Raise
    TRT.automated_test(file, [10]) do emuterm
        @testset "Human player options: CheckRaiseFold" begin
            TH.get_action(game, players[1], CheckRaiseFold(), emuterm)
        end
    end

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    game = Game(players)
    table = game.table
    table.total_bet = 10
    file = joinpath(path,"CallRaiseFold.output")
    simulate_keystrokes(:down, :enter) # select Raise
    TRT.automated_test(file, [20]) do emuterm
        @testset "Human player options: CallRaiseFold" begin
            TH.get_action(game, players[1], CallRaiseFold(), emuterm)
        end
    end
end
TH.use_input_io() = false

