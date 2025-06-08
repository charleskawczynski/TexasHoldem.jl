using Test
using REPL.TerminalMenus
using PlayingCards
using TexasHoldem
TH = TexasHoldem

QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())
DebugGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.DebugLogger())

function valid_total_bet_range_simple(table::Table, player::Player)
    cra = TH.total_bet(table)
    irra = TH.initial_round_raise_amount(table)
    rbr = TH.round_bank_roll(player)
    max_orbr = TH.max_opponent_round_bank_roll(table, player)
    if cra == 0 # initial raise
        mr = TH.minimum_raise_amount(table)
        if max_orbr > rbr # at least one opponent can cover `player`'s all-in
            if mr > rbr
                vrr, case = (rbr, rbr), 1
            else
                vrr, case = (mr, rbr), 2
            end
        else # raise limited by opponent's bank roll
            if mr > max_orbr
                vrr, case = (max_orbr, max_orbr), 3
            else
                vrr, case = (mr, max_orbr), 4
            end
        end
    else # re-raise
        if max_orbr > rbr # at least one opponent can cover `player`'s all-in
            if (cra+irra) > rbr
                vrr, case = (rbr, rbr), 5
            else
                vrr, case = ((cra+irra), rbr), 6
            end
        else # raise limited by opponent's bank roll
            if (cra+irra) > max_orbr
                vrr, case = (max_orbr, max_orbr), 7
            else
                vrr, case = ((cra+irra), max_orbr), 8
            end
        end
    end
    minraise = first(vrr)
    maxraise = last(vrr)
    @assert maxraise ≥ minraise "Min valid raise bound must be ≤ max valid raise bound."
    return (minraise:maxraise), case
end

@testset "valid_total_bet_range" begin
    # Case 1
    table = QuietGame((Player(TH.FuzzBot(), 1; bank_roll=1), Player(TH.FuzzBot(), 2));blinds = TH.Blinds(2,4)).table
    players = TH.players_at_table(table)
    table.total_bet = 0
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 1)

    # Case 2
    table = QuietGame((Player(TH.FuzzBot(), 1), Player(TH.FuzzBot(), 2; bank_roll = 300))).table
    players = TH.players_at_table(table)
    table.total_bet = 0
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 2)

    # Case 3
    table = QuietGame((Player(TH.FuzzBot(), 1; bank_roll=2), Player(TH.FuzzBot(), 2; bank_roll = 1)); blinds=TH.Blinds(2,4)).table
    players = TH.players_at_table(table)
    table.total_bet = 0
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 3)

    # Case 4
    table = QuietGame((Player(TH.FuzzBot(), 1), Player(TH.FuzzBot(), 2; bank_roll = 50))).table
    players = TH.players_at_table(table)
    table.total_bet = 0
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 4)

    # Case 5
    table = QuietGame((Player(TH.FuzzBot(), 1; bank_roll=1), Player(TH.FuzzBot(), 2))).table
    players = TH.players_at_table(table)
    table.total_bet = 1
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 5)

    # Case 6
    table = QuietGame((Player(TH.FuzzBot(), 1), Player(TH.FuzzBot(), 2; bank_roll = 300))).table
    players = TH.players_at_table(table)
    table.total_bet = 1
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 6)

    # Case 7
    table = QuietGame((Player(TH.FuzzBot(), 1; bank_roll=2), Player(TH.FuzzBot(), 2; bank_roll = 1));blinds=TH.Blinds(2,4)).table
    players = TH.players_at_table(table)
    table.total_bet = 1
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 7)

    # Case 8
    table = QuietGame((Player(TH.FuzzBot(), 1), Player(TH.FuzzBot(), 2; bank_roll = 50))).table
    players = TH.players_at_table(table)
    table.total_bet = 1
    @test valid_total_bet_range_simple(table, players[1]) == (TH.valid_total_bet_range(table, players[1]), 8)
end

@testset "is_valid_raise_amount" begin
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    mra = TH.minimum_raise_amount(table)
    @assert mra == TH.blinds(table).big "mra: $mra, bb: $(TH.blinds(table).big)"
    @test TH.is_valid_raise_amount(table, players[1], 0) == (false, "Cannot raise 0. Raise must be between [$mra, 200]")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])+1) == (false, "Insufficient funds (200) to raise 201. Raise must be between [$mra, 200]")
    @test TH.is_valid_raise_amount(table, players[1], -1) == (false, "Cannot raise -1. Raise must be between [$mra, 200]")

    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])-1) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).big) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.blinds(table).big) == (true, "")
    @test TH.is_valid_raise_amount(table, players[1], TH.bank_roll(players[1])) == (true, "")

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.initial_round_raise_amount = 20
    table.total_bet = 20
    players[1].round_contribution = 200
    players[1].round_bank_roll = Chips(500) # oops
    @test TH.is_valid_raise_amount(table, players[1], 200) == (false, "Cannot contribute 0 to the pot.")

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.initial_round_raise_amount = 10
    table.total_bet = 10
    players[1].round_bank_roll = Chips(20)
    @test TH.is_valid_raise_amount(table, players[1], 10) == (false, "Only allowable raise is 20 (all-in), attempting to raise 10")

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.initial_round_raise_amount = 10
    table.total_bet = 10
    players[1].round_bank_roll = Chips(20)
    @test TH.is_valid_raise_amount(table, players[1], 20) == (true, "")

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.initial_round_raise_amount = 5
    table.total_bet = 20
    players[1].round_bank_roll = Chips(30)
    @test TH.is_valid_raise_amount(table, players[1], 25) == (true, "")

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.initial_round_raise_amount = 5
    table.total_bet = 20
    players[1].round_bank_roll = Chips(30)
    @test TH.is_valid_raise_amount(table, players[1], 22) == (false, "Cannot raise 22. Raise must be between [25, 30]")
end

@testset "call_amount" begin
    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.total_bet = 20
    players[1].round_contribution = 10
    @test call_amount(table, players[1]) == 10

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.total_bet = 10
    players[1].round_contribution = 0
    @test call_amount(table, players[1]) == 10

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.total_bet = 0
    players[1].round_contribution = 10
    @test_throws AssertionError("Round contribution must be zero if the total bet is zero.") call_amount(table, players[1])

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.round = :flop
    table.total_bet = 10
    players[1].round_contribution = 10
    @test call_amount(table, players[1]) == 0

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.round = :flop
    table.total_bet = 10
    players[1].round_contribution = 20
    @test_throws AssertionError("Call amount cannot be negative. call_amt: -10, round_contribution: 20") call_amount(table, players[1])

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.total_bet = TH.blinds(table).big
    players[1].round_contribution = TH.blinds(table).big
    @test call_amount(table, players[1]) == 0 # action is back to big-blind pre-flop

    players = (Player(Human(), 1), Player(TH.FuzzBot(), 2))
    table = QuietGame(players).table
    table.total_bet = TH.blinds(table).big
    players[1].round_contribution = TH.blinds(table).big
    @test call_amount(table, players[1]) == 0 # action is back to big-blind pre-flop
end
