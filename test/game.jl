using Test
using PlayingCards
using TexasHoldem: RoundState
using TexasHoldem
const TH = TexasHoldem

#=
This reaches into internals
(`update_given_valid_action!`)
for the convenience of testing
=#
call!(g, p) = TH.update_given_valid_action!(g, p, Call(g, p))
raise_to!(g, p, amt) = TH.update_given_valid_action!(g, p, RaiseTo(g.table, p, amt))
fold!(g, p) = TH.update_given_valid_action!(g, p, Fold())
check!(g, p) = TH.update_given_valid_action!(g, p, Check())

QuietGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.ByPassLogger())
DebugGame(args...; kwargs...) = Game(args...; kwargs..., gui=TH.NoGUI(), logger=TH.DebugLogger())

@testset "Game: show" begin
    players = ntuple(2) do i
        Player(TH.FuzzBot(), i)
    end
    game = QuietGame(players)
    sprint(show, game)

    game.table.round = RoundState.Preflop
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

