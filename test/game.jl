using Test
using PlayingCards
using TexasHoldem
const TH = TexasHoldem

#=
This reaches into internals
(`update_given_valid_action!`)
for the convenience of testing
=#
call!(t, p) = TH.update_given_valid_action!(t, p, Call(t, p))
raise_to!(t, p, amt) = TH.update_given_valid_action!(t, p, Raise(amt))
fold!(t, p) = TH.update_given_valid_action!(t, p, Fold())
check!(t, p) = TH.update_given_valid_action!(t, p, Check())

QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())

@testset "Game: show" begin
    players = ntuple(2) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    sprint(show, game)

    game.table.round = PreFlop()
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
    TH.deal!(game.table, TH.blinds(game.table))
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    check!(game, players[1])
    check!(game, players[2])

    # Round 3
    raise_to!(game, players[1], 10)
    @test TH.checked(players[1]) == false
    call!(game, players[2])

    # Round 4
    raise_to!(game, players[1], 20)
    @test TH.checked(players[1]) == false
    fold!(game, players[2])

    # All-in cases
    players = ntuple(3) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    players = TH.players_at_table(game)
    TH.deal!(game.table, TH.blinds(game.table))
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    raise_to!(game, players[1], TH.bank_roll(players[1]))
    @test TH.checked(players[1]) == false
    call!(game, players[2])

    @test_throws AssertionError raise_to!(game, players[1], 10000) # raise exceeds bank roll!
end

