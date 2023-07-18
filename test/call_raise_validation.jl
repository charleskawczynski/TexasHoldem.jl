using Test
using REPL.TerminalMenus
using PlayingCards
using TexasHoldem
TH = TexasHoldem

function valid_raise_bounds_simple(table::Table, player::Player)
    cra = TH.current_raise_amt(table)
    irra = TH.initial_round_raise_amt(table)
    rbr = TH.round_bank_roll(player)
    max_orbr = TH.max_opponent_round_bank_roll(table, player)
    if cra ≈ 0 # initial raise
        mr = TH.minimum_raise_amt(table)
        if max_orbr > rbr # at least one opponent can cover `player`'s all-in
            if mr > rbr
                vrb, case = (rbr, rbr), 1
            else
                vrb, case = (mr, rbr), 2
            end
        else # raise limited by opponent's bank roll
            if mr > max_orbr
                vrb, case = (max_orbr, max_orbr), 3
            else
                vrb, case = (mr, max_orbr), 4
            end
        end
    else # re-raise
        if max_orbr > rbr # at least one opponent can cover `player`'s all-in
            if (cra+irra) > rbr
                vrb, case = (rbr, rbr), 5
            else
                vrb, case = ((cra+irra), rbr), 6
            end
        else # raise limited by opponent's bank roll
            if (cra+irra) > max_orbr
                vrb, case = (max_orbr, max_orbr), 7
            else
                vrb, case = ((cra+irra), max_orbr), 8
            end
        end
    end
    @assert vrb[2] ≥ vrb[1] "Min valid raise bound must be ≤ max valid raise bound."
    return vrb, case
end

@testset "valid_raise_bounds" begin
    # Case 1
    table = Game((Player(Bot5050(), 1; bank_roll=0.5), Player(Bot5050(), 2))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 0
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 1)

    # Case 2
    table = Game((Player(Bot5050(), 1), Player(Bot5050(), 2; bank_roll = 300))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 0
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 2)

    # Case 3
    table = Game((Player(Bot5050(), 1; bank_roll=1), Player(Bot5050(), 2; bank_roll = 0.5))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 0
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 3)

    # Case 4
    table = Game((Player(Bot5050(), 1), Player(Bot5050(), 2; bank_roll = 50))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 0
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 4)

    # Case 5
    table = Game((Player(Bot5050(), 1; bank_roll=1), Player(Bot5050(), 2))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 1
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 5)

    # Case 6
    table = Game((Player(Bot5050(), 1), Player(Bot5050(), 2; bank_roll = 300))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 1
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 6)

    # Case 7
    table = Game((Player(Bot5050(), 1; bank_roll=1), Player(Bot5050(), 2; bank_roll = 0.5))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 1
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 7)

    # Case 8
    table = Game((Player(Bot5050(), 1), Player(Bot5050(), 2; bank_roll = 50))).table
    players = TH.players_at_table(table)
    table.current_raise_amt = 1
    @test valid_raise_bounds_simple(table, players[1]) == (TH.valid_raise_bounds(table, players[1]), 8)
end

@testset "is_valid_raise_amount" begin
    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    mra = TH.minimum_raise_amt(table)
    @assert mra == TH.blinds(table).small
    @test TH.is_valid_raise_amount(table, players[1], 0) == (false, "Cannot raise 0. Raise must be between [\$$mra, \$200.0]")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])+1) == (false, "Insufficient funds (\$200.0) to raise \$201.0. Raise must be between [\$$mra, \$200.0]")
    @test TH.is_valid_raise_amount(table, players[1], -1) == (false, "Raise must be between [\$$mra, \$200.0]")

    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])-1) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).small) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).big) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])) == (true, "")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.initial_round_raise_amt = 20.0
    table.current_raise_amt = 20.0
    players[1].round_contribution = 200
    players[1].round_bank_roll = 500 # oops
    @test TH.is_valid_raise_amount(table, players[1], 200) == (false, "Cannot contribute \$0.0 to the pot.")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.initial_round_raise_amt = 10.0
    table.current_raise_amt = 10.0
    players[1].round_bank_roll = 20
    @test TH.is_valid_raise_amount(table, players[1], 10) == (false, "Only allowable raise is \$20.0 (all-in)")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.initial_round_raise_amt = 10.0
    table.current_raise_amt = 10.0
    players[1].round_bank_roll = 20
    @test TH.is_valid_raise_amount(table, players[1], 20) == (true, "")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.initial_round_raise_amt = 5.0
    table.current_raise_amt = 20.0
    players[1].round_bank_roll = 30
    @test TH.is_valid_raise_amount(table, players[1], 25) == (true, "")

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.initial_round_raise_amt = 5.0
    table.current_raise_amt = 20.0
    players[1].round_bank_roll = 30
    @test TH.is_valid_raise_amount(table, players[1], 22) == (false, "Raise must be between [\$25.0, \$30.0]")
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
    table.stage = Flop()
    table.current_raise_amt = 10
    players[1].round_contribution = 10
    @test call_amount(table, players[1]) == 0.0

    players = (Player(Human(), 1), Player(Bot5050(), 2))
    table = Game(players).table
    table.stage = Flop()
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
