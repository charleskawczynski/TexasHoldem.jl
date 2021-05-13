using Test
using REPL.TerminalMenus
using PlayingCards
using TexasHoldem
TH = TexasHoldem

@testset "is_valid_raise_amount" begin
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    @test TH.is_valid_raise_amount(table, players[1], 0) == (false, "Cannot raise 0. Raise must be between [\$1, \$200.0]")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])+1) == (false, "Insufficient funds (\$200.0) to raise \$201.0. Raise must be between [\$1, \$200.0]")
    @test TH.is_valid_raise_amount(table, players[1], -1) == (false, "Raise must be between [\$1, \$200.0]")

    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])-1) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).small) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).big) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])) == (true, "")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 200.0
    players[1].round_contribution = 400
    players[1].round_bank_roll = 5000
    @test TH.is_valid_raise_amount(table, players[1], 400) == (false, "Cannot contribute \$0.0 to the pot.")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 10.0
    players[1].round_bank_roll = 20
    @test TH.is_valid_raise_amount(table, players[1], 10) == (false, "Only allowable raise is \$20.0 (all-in)")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 10.0
    players[1].round_bank_roll = 20
    @test TH.is_valid_raise_amount(table, players[1], 20) == (true, "")
end

@testset "call_amount" begin
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 20
    players[1].round_contribution = 10
    @test call_amount(table, players[1]) == 10

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 10
    players[1].round_contribution = 0
    @test call_amount(table, players[1]) == 10

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = 0
    players[1].round_contribution = 10
    @test_throws AssertionError("Round contribution must be zero if current raise is zero.") call_amount(table, players[1])

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.state = Flop()
    table.current_raise_amt = 10
    players[1].round_contribution = 10
    @test call_amount(table, players[1]) == 0.0

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.state = Flop()
    table.current_raise_amt = 10
    players[1].round_contribution = 20
    @test_throws AssertionError("Call amount cannot be negative") call_amount(table, players[1])

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = TH.blinds(table).big
    players[1].round_contribution = TH.blinds(table).big
    @test call_amount(table, players[1]) == 0.0 # action is back to big-blind pre-flop

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.current_raise_amt = TH.blinds(table).big
    players[1].round_contribution = TH.blinds(table).big
    @test call_amount(table, players[1]) == 0.0 # action is back to big-blind pre-flop
end
