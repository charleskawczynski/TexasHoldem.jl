using Test
using PlayingCards
import Logging
import StatsBase
const SB = StatsBase
using TexasHoldem
using TexasHoldem: seat_number
const TH = TexasHoldem

@testset "Table: constructors / observed cards" begin
    players = ntuple(i-> Player(TH.FuzzBot(), i), 2)
    deck = PlayingCards.MaskedDeck()
    # we use StatsBase.sample! for efficiency, but shuffle! is convenient
    shuffle!(deck)
    blinds = TH.Blinds(1,2)
    cards = map(x->SB.sample!(deck), 1:5)

    table = TH.Table(players;deck=deck, cards=cards, logger=TH.ByPassLogger())
    TH.deal!(table, blinds)

    table.round = :preflop
    @test isempty(TH.observed_cards(table))
    @test TH.unobserved_cards(table) == table.cards
    table.round = :flop
    @test TH.observed_cards(table) == table.cards[1:3]
    @test TH.unobserved_cards(table) == table.cards[4:5]
    table.round = :turn
    @test TH.observed_cards(table) == table.cards[1:4]
    @test TH.unobserved_cards(table) == [table.cards[5]]
    table.round = :river
    @test TH.observed_cards(table) == table.cards
    @test isempty(TH.unobserved_cards(table))
end

@testset "Table: Move button" begin
    # All players playing
    players = ntuple(i-> Player(TH.FuzzBot(), i), 3)
    table = Table(players, logger=TH.ByPassLogger())
    @test TH.buttons(table.buttons) == (1, 2, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (2, 3, 1, 2)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 2, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 2, 3, 1)

    # Some players not playing
    players = (
        Player(TH.FuzzBot(), 1),
        Player(TH.FuzzBot(), 2; bank_roll=0),
        Player(TH.FuzzBot(), 3),
    )
    table = Table(players, logger=TH.ByPassLogger())
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)

    # Some players not playing
    players = (
        Player(TH.FuzzBot(), 1),
        Player(TH.FuzzBot(), 2; bank_roll=0),
        Player(TH.FuzzBot(), 3),
    )
    table = Table(players; dealer_pidx=2, logger=TH.ByPassLogger())
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
end

@testset "Players: cyclic player index (pidx)" begin
    @test TH.cyclic_player_index(5, 1) == 1
    @test TH.cyclic_player_index(5, 2) == 2
    @test TH.cyclic_player_index(5, 3) == 3
    @test TH.cyclic_player_index(5, 4) == 4
    @test TH.cyclic_player_index(5, 5) == 5
    @test TH.cyclic_player_index(5, 6) == 1
    @test TH.cyclic_player_index(5, 7) == 2
    @test TH.cyclic_player_index(5, 0) == 5
    @test TH.cyclic_player_index(5, -1) == 4
end

@testset "Table: Dealer iterator" begin
    @test TH.default_dealer_pidx() == 1

    # dealer_pidx = 1
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, Dealer(), length(players)))
    @test ind == [1, 2, 3, 4, 5]

    dealer_pidx = 2
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players; dealer_pidx = 2, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, Dealer(), length(players)))
    @test ind == [2, 3, 4, 5, 1]
end

@testset "Table: SmallBlind iterator" begin
    # dealer_pidx = 1
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, SmallBlind(), length(players)))
    @test ind == [2, 3, 4, 5, 1]

    # dealer_pidx = 2
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players; dealer_pidx = 2, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, SmallBlind(), length(players)))
    @test ind == [3, 4, 5, 1, 2]
end

@testset "Table: BigBlind iterator" begin
    # dealer_pidx = 1
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, BigBlind(), length(players)))
    @test ind == [3, 4, 5, 1, 2]

    # dealer_pidx = 2
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players; dealer_pidx = 2, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, BigBlind(), length(players)))
    @test ind == [4, 5, 1, 2, 3]
end

@testset "Table: FirstToAct iterator" begin
    # dealer_pidx = 1
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, FirstToAct(), length(players)))
    @test ind == [4, 5, 1, 2, 3]

    # dealer_pidx = 2
    players = ntuple(i-> Player(TH.FuzzBot(), i), 5)
    table = Table(players; dealer_pidx = 2, logger=TH.ByPassLogger())
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, FirstToAct(), length(players)))
    @test ind == [5, 1, 2, 3, 4]
end
