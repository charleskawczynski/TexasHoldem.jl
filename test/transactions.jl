using Test
using PlayingCards
using NoLimitHoldem
NLH = NoLimitHoldem

@testset "TransactionManagers - Lowest bank roll goes all-in and wins it all" begin
    table_cards = (A♢, K♢, Q♢, 2♠, 3♠)
    players = (
        NLH.Player(BotRandom(), 1, (A♠, A♣); bank_roll = 1*100),
        NLH.Player(BotRandom(), 2, (K♠, K♣); bank_roll = 2*100),
        NLH.Player(BotRandom(), 3, (Q♠, Q♣); bank_roll = 3*100),
    )
    tm = NLH.TransactionManager(players)
    @test NLH.player_id.(tm.side_pots) == [1,2,3]
    NLH.contribute!(tm, players[1], 100) # all-in
    NLH.contribute!(tm, players[2], 100) # call
    NLH.contribute!(tm, players[3], 100) # call
    NLH.side_pot_full!(tm)
    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 300 # no increase
    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.sidepot_winnings(tm, 3) == 0
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
    NLH.contribute!(tm, players[1], 100) # call
    NLH.contribute!(tm, players[2], 100) # call
    NLH.contribute!(tm, players[3], 100) # all-in
    NLH.side_pot_full!(tm)
    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 300 # no increase
    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.sidepot_winnings(tm, 3) == 0
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
    NLH.contribute!(tm, players[1], 100) # all-in
    NLH.contribute!(tm, players[2], 100) # call
    NLH.contribute!(tm, players[3], 100) # call
    NLH.side_pot_full!(tm)
    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 300 # no increase

    @test_throws AssertionError NLH.contribute!(tm, players[1], 100) # already all-in!
    NLH.contribute!(tm, players[2], 100) # all-in
    NLH.contribute!(tm, players[3], 100) # call

    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 500

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.sidepot_winnings(tm, 3) == 0
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
    NLH.contribute!(tm, players[1], 100) # call
    NLH.contribute!(tm, players[2], 100) # call
    NLH.contribute!(tm, players[3], 100) # all-in
    NLH.side_pot_full!(tm)
    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 300 # no increase

    NLH.contribute!(tm, players[1], 100) # call
    NLH.contribute!(tm, players[2], 100) # all-in
    @test_throws AssertionError NLH.contribute!(tm, players[3], 100) # already all-in!

    @test NLH.sidepot_winnings(tm, 1) == 300
    @test NLH.sidepot_winnings(tm, 2) == 500

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.sidepot_winnings(tm, 3) == 0
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
    NLH.contribute!(tm, players[1], 100) # all-in
    NLH.contribute!(tm, players[2], 100) # call
    NLH.contribute!(tm, players[3], 100) # call
    NLH.contribute!(tm, players[4], 100) # call
    NLH.contribute!(tm, players[5], 100) # call
    NLH.contribute!(tm, players[6], 100) # call
    NLH.side_pot_full!(tm)
    NLH.contribute!(tm, players[2], 100) # all-in
    NLH.contribute!(tm, players[3], 100) # call
    NLH.contribute!(tm, players[4], 100) # call
    NLH.contribute!(tm, players[5], 100) # call
    NLH.contribute!(tm, players[6], 100) # call
    NLH.side_pot_full!(tm)
    NLH.contribute!(tm, players[3], 100) # all-in
    NLH.contribute!(tm, players[4], 100) # call
    NLH.contribute!(tm, players[5], 100) # call
    NLH.contribute!(tm, players[6], 100) # call
    NLH.side_pot_full!(tm)
    NLH.contribute!(tm, players[4], 100) # all-in
    NLH.contribute!(tm, players[5], 100) # call
    NLH.contribute!(tm, players[6], 100) # call
    NLH.side_pot_full!(tm)
    NLH.contribute!(tm, players[5], 100) # all-in
    NLH.contribute!(tm, players[6], 100) # call

    @test NLH.sidepot_winnings(tm, 1) ≈ 600.0
    @test NLH.sidepot_winnings(tm, 2) ≈ 1100.0
    @test NLH.sidepot_winnings(tm, 3) ≈ 1500.0
    @test NLH.sidepot_winnings(tm, 4) ≈ 1800.0
    @test NLH.sidepot_winnings(tm, 5) ≈ 2000.0
    @test NLH.sidepot_winnings(tm, 6) ≈ 2000.0

    NLH.distribute_winnings!(players, tm, table_cards)
    @test NLH.sidepot_winnings(tm, 6) == 0
    @test bank_roll(players[1]) == 0 # bust
    @test bank_roll(players[2]) == 550 # = 600/2+500/2
    @test bank_roll(players[3]) == 950 # = 600/2+500/2+400
    @test bank_roll(players[4]) == 0 # bust
    @test bank_roll(players[5]) == 500 # all contributions after 3rd all-in (3*100+2*100)
    @test bank_roll(players[6]) == 100 # lost (but not all-in)
    @test sum(bank_roll.(players)) == 2100
end
