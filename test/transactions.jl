using Test
using PlayingCards
using NoLimitHoldem: Player, BotRandom, TransactionManager, button_id, Table
NLH = NoLimitHoldem

@testset "TransactionManagers - Lowest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    players = (
        NLH.Player(BotRandom(), 1, (A♠, A♣); bank_roll = 1*100),
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100),
        NLH.Player(BotRandom(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)
    @test NLH.player_id.(tm.side_pots) == [1,2,3]

    NLH.raise!(table, players[1], 100) # raise all-in
    NLH.call!(table, players[2], 100) # call
    NLH.call!(table, players[3], 100) # call

    @test NLH.amount.(tm.side_pots) == [300.0, 0.0, 0.0]
    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 200
end

@testset "TransactionManagers - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    players = (
        NLH.Player(BotRandom(), 1, (A♠, A♣); bank_roll = 3*100),
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100),
        NLH.Player(BotRandom(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)

    NLH.raise!(table, players[1], 100) # Raise
    NLH.call!(table, players[2], 100) # call
    NLH.call!(table, players[3], 100) # all-in

    @test NLH.amount.(tm.side_pots) == [300.0, 0.0, 0.0]
    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 500
    @test bank_roll(players[2]) == 100
    @test bank_roll(players[3]) == 0
end

@testset "TransactionManagers - Lowest bank roll goes all-in and wins a split pot" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    players = (
        NLH.Player(BotRandom(), 1, (A♠, A♣); bank_roll = 1*100),
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100),
        NLH.Player(BotRandom(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)

    NLH.raise!(table, players[1], 100) # Raise all-in
    NLH.call!(table, players[2], 100) # call
    NLH.call!(table, players[3], 100) # call

    @test NLH.amount.(tm.side_pots) == [300.0, 0.0, 0.0]

    @test_throws ErrorException NLH.call!(table, players[1], 100) # already all-in!

    NLH.reset_round!(table)

    NLH.raise!(table, players[2], 100) # Raise all-in
    NLH.call!(table, players[3], 100) # call

    @test NLH.amount.(tm.side_pots) == [300.0, 200.0, 0.0]
    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 300
    @test bank_roll(players[2]) == 200
    @test bank_roll(players[3]) == 100
end

@testset "TransactionManagers - Highest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    players = (
        NLH.Player(BotRandom(), 1, (A♠, A♣); bank_roll = 3*100),
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100),
        NLH.Player(BotRandom(), 3, (Q♠, Q♣); bank_roll = 1*100),
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)

    NLH.raise!(table, players[1], 100) # Raise
    NLH.call!(table, players[2], 100) # call
    NLH.call!(table, players[3], 100) # all-in

    @test NLH.amount.(tm.side_pots) == [300.0, 0.0, 0.0]

    NLH.reset_round!(table)

    NLH.raise!(table, players[1], 100) # call
    NLH.call!(table, players[2], 100) # all-in
    @test_throws ErrorException NLH.call!(table, players[3], 100) # already all-in!

    @test NLH.amount.(tm.side_pots) == [300.0, 200.0, 0.0]

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 600
    @test bank_roll(players[2]) == 0
    @test bank_roll(players[3]) == 0
end

@testset "TransactionManagers - Semi-complicated split pot (shared winners)" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    players = (
        NLH.Player(BotRandom(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        NLH.Player(BotRandom(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        NLH.Player(BotRandom(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        NLH.Player(BotRandom(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        NLH.Player(BotRandom(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)

    NLH.raise!(table, players[1], 100) # raise all-in
    NLH.call!(table, players[2], 100) # call
    NLH.call!(table, players[3], 100) # call
    NLH.call!(table, players[4], 100) # call
    NLH.call!(table, players[5], 100) # call
    NLH.call!(table, players[6], 100) # call
    @test NLH.amount.(tm.side_pots) == [600.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    NLH.reset_round!(table)

    NLH.raise!(table, players[2], 100) # raise all-in
    NLH.call!(table, players[3], 100) # call
    NLH.call!(table, players[4], 100) # call
    NLH.call!(table, players[5], 100) # call
    NLH.call!(table, players[6], 100) # call
    @test NLH.amount.(tm.side_pots) == [600.0, 500.0, 0.0, 0.0, 0.0, 0.0]

    NLH.reset_round!(table)

    NLH.raise!(table, players[3], 100) # raise all-in
    NLH.call!(table, players[4], 100) # call
    NLH.call!(table, players[5], 100) # call
    NLH.call!(table, players[6], 100) # call
    @test NLH.amount.(tm.side_pots) == [600.0, 500.0, 400.0, 0.0, 0.0, 0.0]

    NLH.reset_round!(table)

    NLH.raise!(table, players[4], 100) # raise all-in
    NLH.call!(table, players[5], 100) # call
    NLH.call!(table, players[6], 100) # call
    @test NLH.amount.(tm.side_pots) == [600.0, 500.0, 400.0, 300.0, 0.0, 0.0]

    NLH.reset_round!(table)

    NLH.raise!(table, players[5], 100) # raise all-in
    NLH.call!(table, players[6], 100) # call
    @test NLH.amount.(tm.side_pots) ≈ [600.0, 500.0, 400.0, 300.0, 200.0, 0.0]

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end

@testset "TransactionManagers - Single round split pot (shared winners), with simple re-raises" begin
    table_cards = (T♢, Q♢, A♠, 8♠, 9♠)
    players = (
        NLH.Player(BotRandom(), 1, (4♠, 5♣); bank_roll = 1*100), # bust
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100), # win, split with player 3
        NLH.Player(BotRandom(), 3, (K♡,K♢); bank_roll = 3*100), # win, split with player 2
        NLH.Player(BotRandom(), 4, (2♡, 3♢); bank_roll = 4*100), # bust
        NLH.Player(BotRandom(), 5, (7♠, 7♣); bank_roll = 5*100), # 2nd to players 2 and 3, win remaining pot
        NLH.Player(BotRandom(), 6, (2♠, 3♣); bank_roll = 6*100), # lose, but not bust
    )
    tm = NLH.TransactionManager(players)
    table = Table(;players=players,cards=table_cards,transactions=tm)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    NLH.raise!(table, players[1], 100) # raise all-in
    @test NLH.amount.(tm.side_pots) == [100.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    NLH.raise!(table, players[2], 200) # raise all-in
    @test NLH.amount.(tm.side_pots) == [200.0, 100.0, 0.0, 0.0, 0.0, 0.0]

    NLH.raise!(table, players[3], 300) # raise all-in
    @test NLH.amount.(tm.side_pots) == [300.0, 200.0, 100.0, 0.0, 0.0, 0.0]

    NLH.raise!(table, players[4], 400;debug=true) # raise all-in
    @test NLH.amount.(tm.side_pots) == [400.0, 300.0, 200.0, 100.0, 0.0, 0.0]

    NLH.raise!(table, players[5], 500) # raise all-in
    @test NLH.amount.(tm.side_pots) == [500.0, 400.0, 300.0, 200.0, 100.0, 0.0]

    NLH.call!(table, players[6], 500) # call
    @test NLH.amount.(tm.side_pots) ≈ [600.0, 500.0, 400.0, 300.0, 200.0, 0.0]

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.amount.(tm.side_pots) == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end
