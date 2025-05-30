using Test
using PlayingCards
using TexasHoldem
using Logging
using TexasHoldem: Player, FuzzBot, Transactions, dealer_pidx, Table
const TH = TexasHoldem
all_zero(side_pots) = all(x-> all(y->y==0, x), side_pots)

include("tester_bots.jl")
#=
This reaches into internals
(`update_given_valid_action!`)
for the convenience of testing
=#
call(t, p) = TH.update_given_valid_action(t, p, Call(t, p))
raise_to(t, p, amt) = TH.update_given_valid_action(t, p, Raise(amt))
fold(t, p) = TH.update_given_valid_action(t, p, Fold())
check(t, p) = TH.update_given_valid_action(t, p, Check())

@testset "Transactionss - Lowest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (A♠, A♣); bank_roll = 1*100),
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(TH.FuzzBot(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.DebugLogger())

    table = raise_to(table, players[1], 100) # raise all-in
    table = call(table, players[2]) # call
    table = call(table, players[3]) # call
    (; players, transactions) = table

    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [0, 0, 0], [0, 0, 0]]

    table = TH.distribute_winnings(table, TH.DebugLogger())

    (; players, transactions) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 200
end

@testset "Transactionss - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (A♠, A♣); bank_roll = 3*100),
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(TH.FuzzBot(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())

    table = raise_to(table, players[1], 100) # Raise
    table = call(table, players[2]) # call
    table = call(table, players[3]) # all-in
    (; transactions) = table
    players = TH.players_at_table(table)

    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [0, 0, 0], [0, 0, 0]]
    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; players, transactions) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    @test bank_roll(players[1]) == 500
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 0
end

@testset "Transactionss - Lowest bank roll goes all-in and wins a split pot" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (A♠, A♣); bank_roll = 1*100),
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(TH.FuzzBot(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())

    table = raise_to(table, players[1], 100) # Raise all-in
    table = call(table, players[2]) # call
    table = call(table, players[3]) # call
    (; transactions, players) = table

    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [0, 0, 0], [0, 0, 0]]

    @test_throws AssertionError table = call(table, players[1]) # already all-in!

    table = TH.reset_round(table)
    (; players) = table

    table = raise_to(table, players[2], 100) # Raise all-in
    table = call(table, players[3]) # call
    (; transactions) = table

    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [0, 100, 100], [0, 0, 0]]
    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    (; players) = table
    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 200
    @test bank_roll(players[3]) == 100
end

@testset "Transactionss - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (A♠, A♣); bank_roll = 3*100),
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(TH.FuzzBot(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())

    table = raise_to(table, players[1], 100) # Raise
    table = call(table, players[2]) # call
    table = call(table, players[3]) # all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [0, 0, 0], [0, 0, 0]]

    table = TH.reset_round(table)
    (; transactions, players) = table

    table = raise_to(table, players[1], 100) # call
    table = call(table, players[2]) # all-in
    (; transactions, players) = table
    @test_throws AssertionError table = call(table, players[3]) # already all-in!

    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100], [100, 100, 0], [0, 0, 0]]

    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions, players) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    @test bank_roll(players[1]) == 600
    @test bank_roll(players[2]) == 0
    @test bank_roll(players[3]) == 0
end

@testset "Transactionss - Semi-complicated split pot (shared winners)" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(TH.FuzzBot(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(TH.FuzzBot(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(TH.FuzzBot(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(TH.FuzzBot(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())

    table = raise_to(table, players[1], 100) # raise all-in
    table = call(table, players[2]) # call
    table = call(table, players[3]) # call
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    z = [0, 0, 0, 0, 0, 0]
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], z, z, z, z, z]

    table = TH.reset_round(table)
    (; transactions, players) = table

    table = raise_to(table, players[2], 100) # raise all-in
    table = call(table, players[3]) # call
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call

    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [0, 100, 100, 100, 100, 100], z, z, z, z]

    table = TH.reset_round(table)
    (; transactions, players) = table

    table = raise_to(table, players[3], 100) # raise all-in
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [0, 100, 100, 100, 100, 100], [0, 0, 100, 100, 100, 100], z, z, z]

    table = TH.reset_round(table)

    (; transactions, players) = table

    table = raise_to(table, players[4], 100) # raise all-in
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call

    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [0, 100, 100, 100, 100, 100], [0, 0, 100, 100, 100, 100], [0, 0, 0, 100, 100, 100], z, z]

    table = TH.reset_round(table)

    (; transactions, players) = table
    table = raise_to(table, players[5], 100) # raise all-in
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [0, 100, 100, 100, 100, 100], [0, 0, 100, 100, 100, 100], [0, 0, 0, 100, 100, 100], [0, 0, 0, 0, 100, 100], z]

    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions, players) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end

@testset "Transactionss - Semi-complicated split pot (shared winners) with fractional chips" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (4♠, 5♣); bank_roll = 1*7), # bust
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*7), # win, split with player 3
        Player(TH.FuzzBot(), 3, (K♡,K♢); bank_roll = 3*7), # win, split with player 2
        Player(TH.FuzzBot(), 4, (2♡, 3♢); bank_roll = 4*7), # bust
        Player(TH.FuzzBot(), 5, (7♠, 7♣); bank_roll = 5*7), # 2nd to players 2 and 3, win remaining pot
        Player(TH.FuzzBot(), 6, (2♠, 3♣); bank_roll = 6*7), # lose, but not bust
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())

    table = raise_to(table, players[1], 7) # raise all-in
    table = call(table, players[2]) # call
    table = call(table, players[3]) # call
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    z = [0, 0, 0, 0, 0, 0]
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[7, 7, 7, 7, 7, 7], z, z, z, z, z]

    table = TH.reset_round(table)
    (; transactions, players) = table

    table = raise_to(table, players[2], 7) # raise all-in
    table = call(table, players[3]) # call
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[7, 7, 7, 7, 7, 7], [0, 7, 7, 7, 7, 7], z, z, z, z]

    table = TH.reset_round(table)
    (; transactions, players) = table
    table = raise_to(table, players[3], 7) # raise all-in
    table = call(table, players[4]) # call
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[7, 7, 7, 7, 7, 7], [0, 7, 7, 7, 7, 7], [0, 0, 7, 7, 7, 7], z, z, z]

    table = TH.reset_round(table)

    (; transactions, players) = table
    table = raise_to(table, players[4], 7) # raise all-in
    table = call(table, players[5]) # call
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[7, 7, 7, 7, 7, 7], [0, 7, 7, 7, 7, 7], [0, 0, 7, 7, 7, 7], [0, 0, 0, 7, 7, 7], z, z]

    table = TH.reset_round(table)

    (; transactions, players) = table
    table = raise_to(table, players[5], 7) # raise all-in
    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[7, 7, 7, 7, 7, 7], [0, 7, 7, 7, 7, 7], [0, 0, 7, 7, 7, 7], [0, 0, 0, 7, 7, 7], [0, 0, 0, 0, 7, 7], z]

    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions, players) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    @test bank_roll_chips(players[1]) == Chips(0) # bust
    @test bank_roll_chips(players[2]) == Chips(38, SimpleRatio(1,2)) # = 42/2+35/2 = 38.5
    @test bank_roll_chips(players[3]) == Chips(66, SimpleRatio(1, 2)) # = 42/2+35/2+28 = 66.5
    @test bank_roll_chips(players[4]) == Chips(0) # bust
    @test bank_roll_chips(players[5]) == Chips(35, SimpleRatio(0, 1)) # all contributions after 3rd all-in (3*7+2*7)
    @test bank_roll_chips(players[6]) == Chips(7, SimpleRatio(0, 1)) # lost (but not all-in)
    @test sum(bank_roll_chips.(players)) == Chips(147, SimpleRatio(0, 2))
end

@testset "Transactionss - Single round split pot (shared winners), with simple re-raises" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        Player(TH.FuzzBot(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(TH.FuzzBot(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(TH.FuzzBot(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(TH.FuzzBot(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(TH.FuzzBot(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())
    @test all_zero(TH.amounts.(transactions.side_pots))
    z = [0, 0, 0, 0, 0, 0]

    table = raise_to(table, players[1], 100) # raise all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 0, 0, 0, 0, 0], z, z, z, z, z]

    table = raise_to(table, players[2], 200) # raise all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 0, 0, 0, 0], [0, 100, 0, 0, 0, 0], z, z, z, z]

    table = raise_to(table, players[3], 300) # raise all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 0, 0, 0], [0, 100, 100, 0, 0, 0], [0, 0, 100, 0, 0, 0], z, z, z]

    table = raise_to(table, players[4], 400) # raise all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 0, 0], [0, 100, 100, 100, 0, 0], [0, 0, 100, 100, 0, 0], [0, 0, 0, 100, 0, 0], z, z]

    table = raise_to(table, players[5], 500) # raise all-in
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 0], [0, 100, 100, 100, 100, 0], [0, 0, 100, 100, 100, 0], [0, 0, 0, 100, 100, 0], [0, 0, 0, 0, 100, 0], z]

    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [0, 100, 100, 100, 100, 100], [0, 0, 100, 100, 100, 100], [0, 0, 0, 100, 100, 100], [0, 0, 0, 0, 100, 100], z]

    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions, players) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    (; transactions, players) = table
    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end

@testset "Transactionss - Single round split pot (shared winners), with simple re-raises, reversed bank roll order" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(TH.FuzzBot(), 1, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
        Player(TH.FuzzBot(), 2, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(TH.FuzzBot(), 3, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(TH.FuzzBot(), 4, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(TH.FuzzBot(), 5, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(TH.FuzzBot(), 6, (4♠, 5♣); bank_roll = 1*100), # bust
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())
    @test all_zero(TH.amounts.(transactions.side_pots))
    z = [0, 0, 0, 0, 0, 0]

    table = raise_to(table, players[1], 500) # raise to 500
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 0, 0, 0, 0, 0], [100, 0, 0, 0, 0, 0], [100, 0, 0, 0, 0, 0], [100, 0, 0, 0, 0, 0], [100, 0, 0, 0, 0, 0], z]

    table = call(table, players[2]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 0, 0, 0, 0], [100, 100, 0, 0, 0, 0], [100, 100, 0, 0, 0, 0], [100, 100, 0, 0, 0, 0], [100, 100, 0, 0, 0, 0], z]

    table = call(table, players[3]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 0, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 0, 0, 0, 0], z]

    table = call(table, players[4]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 0, 0], [100, 100, 100, 100, 0, 0], [100, 100, 100, 100, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 0, 0, 0, 0], z]

    table = call(table, players[5]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 0], [100, 100, 100, 100, 100, 0], [100, 100, 100, 100, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 0, 0, 0, 0], z]

    table = call(table, players[6]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[100, 100, 100, 100, 100, 100], [100, 100, 100, 100, 100, 0], [100, 100, 100, 100, 0, 0], [100, 100, 100, 0, 0, 0], [100, 100, 0, 0, 0, 0], z]

    table = TH.distribute_winnings(table, TH.ByPassLogger())
    (; transactions, players) = table
    @test all_zero(TH.amounts.(transactions.side_pots))

    (; transactions, players) = table
    @test bank_roll(players[1]) == 100 # lost (but not all-in)
    @test bank_roll(players[2]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[3]) == 0 # bust
    @test bank_roll(players[4]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[5]) == 550 # = 600/2+500/2
    @test bank_roll(players[6]) == 0 # bust
    @test sum(bank_roll.(players)) == 2100
end

@testset "Transactionss - side pots edge case 1" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(BotPreFlopRaise(5), 1, (2♠, 3♣); bank_roll = 9),
        Player(TH.FuzzBot(), 2, (7♠, 7♣); bank_roll = 5),
        Player(TH.FuzzBot(), 3, (2♡, 3♢); bank_roll = 4),
    )
    transactions = TH.Transactions(players, logger)
    table = Table(players;cards=table_cards,transactions, logger=TH.ByPassLogger())
    table = TH.contribute(table, players[2], 1, true) # small blind
    table = TH.contribute(table, players[3], 2, true) # big blind

    transactions = table.transactions
    @test TH.amounts.(transactions.side_pots) == [[0, 1, 2], [0, 0, 0], [0, 0, 0]]

    table = raise_to(table, players[1], 5) # raise to 5
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[4, 1, 2], [1, 0, 0], [0, 0, 0]]

    table = call(table, players[2]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[4, 4, 2], [1, 1, 0], [0, 0, 0]]

    table = call(table, players[3]) # call
    (; transactions, players) = table
    @test TH.amounts.(transactions.side_pots) == [[4, 4, 4], [1, 1, 0], [0, 0, 0]]
    @test TH.is_side_pot_full(transactions, players, 1)
    # TODO: all but one player is all-in, is it okay that this
    #       side-pot is considered not full?
    @test !TH.is_side_pot_full(transactions, players, 2)
end
