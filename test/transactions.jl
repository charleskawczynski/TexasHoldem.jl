using Test
using PlayingCards
using TexasHoldem
using TexasHoldem: Player, Bot5050, TransactionManager, dealer_pidx, Table
const TH = TexasHoldem

include("tester_bots.jl")
#=
This reaches into internals
(`update_given_valid_action!`)
for the convenience of testing
=#
call!(t, p) = TH.update_given_valid_action!(t, p, Call(t, p))
raise_to!(t, p, amt) = TH.update_given_valid_action!(t, p, Raise(amt))
fold!(t, p) = TH.update_given_valid_action!(t, p, Fold())
check!(t, p) = TH.update_given_valid_action!(t, p, Check())

@testset "TransactionManagers - Lowest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (A♠, A♣); bank_roll = 1*100),
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(Bot5050(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())
    @test TH.seat_number.(tm.side_pots) == [1,2,3]

    raise_to!(table, players[1], 100) # raise all-in
    call!(table, players[2]) # call
    call!(table, players[3]) # call

    @test TH.amount.(tm.side_pots) == [300, 0, 0]
    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0]

    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 200
end

@testset "TransactionManagers - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (A♠, A♣); bank_roll = 3*100),
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(Bot5050(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())

    raise_to!(table, players[1], 100) # Raise
    call!(table, players[2]) # call
    call!(table, players[3]) # all-in

    @test TH.amount.(tm.side_pots) == [300, 0, 0]
    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0]

    @test bank_roll(players[1]) == 500
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 0
end

@testset "TransactionManagers - Lowest bank roll goes all-in and wins a split pot" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (A♠, A♣); bank_roll = 1*100),
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(Bot5050(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())

    raise_to!(table, players[1], 100) # Raise all-in
    call!(table, players[2]) # call
    call!(table, players[3]) # call

    @test TH.amount.(tm.side_pots) == [300, 0, 0]

    @test_throws AssertionError call!(table, players[1]) # already all-in!

    TH.reset_round!(table)

    raise_to!(table, players[2], 100) # Raise all-in
    call!(table, players[3]) # call

    @test TH.amount.(tm.side_pots) == [300, 200, 0]
    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0]

    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 200
    @test bank_roll(players[3]) == 100
end

@testset "TransactionManagers - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (A♠, A♣); bank_roll = 3*100),
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100),
        Player(Bot5050(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())

    raise_to!(table, players[1], 100) # Raise
    call!(table, players[2]) # call
    call!(table, players[3]) # all-in

    @test TH.amount.(tm.side_pots) == [300, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[1], 100) # call
    call!(table, players[2]) # all-in
    @test_throws AssertionError call!(table, players[3]) # already all-in!

    @test TH.amount.(tm.side_pots) == [300, 200, 0]

    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0]

    @test bank_roll(players[1]) == 600
    @test bank_roll(players[2]) == 0
    @test bank_roll(players[3]) == 0
end

@testset "TransactionManagers - Semi-complicated split pot (shared winners)" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(Bot5050(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(Bot5050(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(Bot5050(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(Bot5050(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())

    raise_to!(table, players[1], 100) # raise all-in
    call!(table, players[2]) # call
    call!(table, players[3]) # call
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 0, 0, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[2], 100) # raise all-in
    call!(table, players[3]) # call
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 0, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[3], 100) # raise all-in
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 400, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[4], 100) # raise all-in
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 400, 300, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[5], 100) # raise all-in
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 400, 300, 200, 0]

    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end

@testset "TransactionManagers - Semi-complicated split pot (shared winners) with fractional chips" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (4♠, 5♣); bank_roll = 1*7), # bust
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*7), # win, split with player 3
        Player(Bot5050(), 3, (K♡,K♢); bank_roll = 3*7), # win, split with player 2
        Player(Bot5050(), 4, (2♡, 3♢); bank_roll = 4*7), # bust
        Player(Bot5050(), 5, (7♠, 7♣); bank_roll = 5*7), # 2nd to players 2 and 3, win remaining pot
        Player(Bot5050(), 6, (2♠, 3♣); bank_roll = 6*7), # lose, but not bust
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())

    raise_to!(table, players[1], 7) # raise all-in
    call!(table, players[2]) # call
    call!(table, players[3]) # call
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [42, 0, 0, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[2], 7) # raise all-in
    call!(table, players[3]) # call
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [42, 35, 0, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[3], 7) # raise all-in
    call!(table, players[4]) # call
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [42, 35, 28, 0, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[4], 7) # raise all-in
    call!(table, players[5]) # call
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [42, 35, 28, 21, 0, 0]

    TH.reset_round!(table)

    raise_to!(table, players[5], 7) # raise all-in
    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [42, 35, 28, 21, 14, 0]

    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    @test bank_roll_chips(players[1]) == Chips(0) # bust
    @test bank_roll_chips(players[2]) == Chips(38, SimpleRatio(1,2)) # = 42/2+35/2 = 38.5
    @test bank_roll_chips(players[3]) == Chips(66, SimpleRatio(1, 2)) # = 42/2+35/2+28 = 66.5
    @test bank_roll_chips(players[4]) == Chips(0) # bust
    @test bank_roll_chips(players[5]) == Chips(35, SimpleRatio(0, 1)) # all contributions after 3rd all-in (3*7+2*7)
    @test bank_roll_chips(players[6]) == Chips(7, SimpleRatio(0, 1)) # lost (but not all-in)
    @test sum(bank_roll_chips.(players)) == Chips(147, SimpleRatio(0, 2))
end

@testset "TransactionManagers - Single round split pot (shared winners), with simple re-raises" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        Player(Bot5050(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(Bot5050(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(Bot5050(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(Bot5050(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(Bot5050(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    raise_to!(table, players[1], 100) # raise all-in
    @test TH.amount.(tm.side_pots) == [100, 0, 0, 0, 0, 0]

    raise_to!(table, players[2], 200) # raise all-in
    @test TH.amount.(tm.side_pots) == [200, 100, 0, 0, 0, 0]

    raise_to!(table, players[3], 300) # raise all-in
    @test TH.amount.(tm.side_pots) == [300, 200, 100, 0, 0, 0]

    raise_to!(table, players[4], 400) # raise all-in
    @test TH.amount.(tm.side_pots) == [400, 300, 200, 100, 0, 0]

    raise_to!(table, players[5], 500) # raise all-in
    @test TH.amount.(tm.side_pots) == [500, 400, 300, 200, 100, 0]

    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 400, 300, 200, 0]

    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end

@testset "TransactionManagers - Single round split pot (shared winners), with simple re-raises, reversed bank roll order" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(Bot5050(), 1, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
        Player(Bot5050(), 2, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        Player(Bot5050(), 3, (2♡, 3♢); bank_roll = 4*100), # bust
        Player(Bot5050(), 4, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        Player(Bot5050(), 5, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        Player(Bot5050(), 6, (4♠, 5♣); bank_roll = 1*100), # bust
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    raise_to!(table, players[1], 500) # raise to 500
    @test TH.amount.(tm.side_pots) == [100, 100, 100, 100, 100, 0]

    call!(table, players[2]) # call
    @test TH.amount.(tm.side_pots) == [200, 200, 200, 200, 200, 0]

    call!(table, players[3]) # call
    @test TH.amount.(tm.side_pots) == [300, 300, 300, 300, 200, 0]

    call!(table, players[4]) # call
    @test TH.amount.(tm.side_pots) == [400, 400, 400, 300, 200, 0]

    call!(table, players[5]) # call
    @test TH.amount.(tm.side_pots) == [500, 500, 400, 300, 200, 0]

    call!(table, players[6]) # call
    @test TH.amount.(tm.side_pots) == [600, 500, 400, 300, 200, 0]

    TH.distribute_winnings!(players, tm, table_cards, TH.ByPassLogger())
    @test TH.amount.(tm.side_pots) == [0, 0, 0, 0, 0, 0]

    @test bank_roll(players[1]) == 100 # lost (but not all-in)
    @test bank_roll(players[2]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[3]) == 0 # bust
    @test bank_roll(players[4]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[5]) == 550 # = 600/2+500/2
    @test bank_roll(players[6]) == 0 # bust
    @test sum(bank_roll.(players)) == 2100
end

@testset "TransactionManagers - side pots edge case 1" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    logger = TH.InfoLogger()
    players = (
        Player(BotPreFlopRaise(5), 1, (2♠, 3♣); bank_roll = 9),
        Player(Bot5050(), 2, (7♠, 7♣); bank_roll = 5),
        Player(Bot5050(), 3, (2♡, 3♢); bank_roll = 4),
    )
    tm = TH.TransactionManager(players, logger)
    table = Table(players;cards=table_cards,transactions=tm, logger=TH.ByPassLogger())
    TH.contribute!(table, players[2], 1, true) # small blind
    TH.contribute!(table, players[3], 2, true) # big blind
    @test TH.amount.(tm.side_pots) == [3, 0, 0]

    raise_to!(table, players[1], 5) # raise to 5
    @test TH.amount.(tm.side_pots) == [7, 1, 0]

    call!(table, players[2]) # call
    @test_broken TH.amount.(tm.side_pots) == [10, 2, 0]

    call!(table, players[3]) # call
    @test_broken TH.amount.(tm.side_pots) == [12, 2, 0]
    @test_broken TH.side_pot_full(tm, 1) == true
end
