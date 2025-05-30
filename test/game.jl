using Test
using PlayingCards
using Accessors
using TexasHoldem
const TH = TexasHoldem

#=
This reaches into internals
(`update_given_valid_action`)
for the convenience of testing
=#
call(t, p) = TH.update_given_valid_action(t, p, Call(t, p))
raise_to(t, p, amt) = TH.update_given_valid_action(t, p, Raise(amt))
fold(t, p) = TH.update_given_valid_action(t, p, Fold())
check(t, p) = TH.update_given_valid_action(t, p, Check())

QuietGame(args...; kwargs...) = Game(args...; kwargs..., logger=TH.ByPassLogger())

@testset "Game: show" begin
    players = ntuple(2) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    sprint(show, game)

    @reset game.table.round = PreFlop()
    sprint(show, game)
end

@testset "Game: pre-dealt deck" begin
    deck = PlayingCards.MaskedDeck()
    # we use StatsBase.sample! for efficiency, but shuffle! is convenient
    shuffle!(deck)
    players = ntuple(3) do i
        Player(TH.FuzzBot(), i, pop!(deck, Val(2)))
    end
    game = QuietGame(players;deck=deck,cards=pop!(deck, Val(5)))
end

@testset "Game: contrived game" begin
    players = ntuple(3) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    players = TH.players_at_table(game)
    table = TH.deal(game.table, TH.blinds(game.table))
    # Round 1
    table = check(table, players[1])
    table = check(table, players[2])
    table = fold(table, players[3])

    # Round 2
    table = check(table, players[1])
    table = check(table, players[2])

    # Round 3
    table = raise_to(table, players[1], 10)
    @test TH.checked(players[1]) == false
    table = call(table, players[2])

    # Round 4
    table = raise_to(table, players[1], 20)
    @test TH.checked(players[1]) == false
    table = fold(table, players[2])

    # All-in cases
    players = ntuple(3) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    players = TH.players_at_table(game)
    table = TH.deal(game.table, TH.blinds(game.table))
    # Round 1
    (; players) = table
    table = check(table, players[1])
    (; players) = table
    table = check(table, players[2])
    (; players) = table
    table = fold(table, players[3])
    (; players) = table

    # Round 2
    table = raise_to(table, players[1], TH.bank_roll(players[1]))
    (; players) = table
    @test TH.checked(players[1]) == false
    table = call(table, players[2])
    (; players) = table

    @test_throws AssertionError raise_to(table, players[1], 10000) # raise exceeds bank roll!
end

