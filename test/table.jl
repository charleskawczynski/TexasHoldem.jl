using Test
using PlayingCards
import Logging
using TexasHoldem
using TexasHoldem: seat_number
TH = TexasHoldem

@testset "Table: constructors / observed cards" begin
    players = ntuple(i-> Player(Bot5050(), i), 2)
    deck = ordered_deck()
    shuffle!(deck)
    blinds = TH.Blinds(1,2)
    cards = TH.get_table_cards!(deck)
    table = TH.Table(players;deck=deck, cards=cards)
    TH.deal!(table, blinds)

    table.state = PreFlop()
    @test TH.observed_cards(table) == ()
    table.state = Flop()
    @test TH.observed_cards(table) == table.cards[1:3]
    table.state = Turn()
    @test TH.observed_cards(table) == table.cards[1:4]
    table.state = River()
    @test TH.observed_cards(table) == table.cards
end

@testset "Table: Move button" begin
    # All players playing
    players = ntuple(i-> Player(Bot5050(), i), 3)
    table = Table(players)
    @test TH.buttons(table.buttons) == (1, 2, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (2, 3, 1, 2)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 2, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 2, 3, 1)

    # Some players not playing
    players = (
        Player(Bot5050(), 1),
        Player(Bot5050(), 2; bank_roll=0),
        Player(Bot5050(), 3),
    )
    table = Table(players)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)

    # Some players not playing
    players = (
        Player(Bot5050(), 1),
        Player(Bot5050(), 2; bank_roll=0),
        Player(Bot5050(), 3),
    )
    table = Table(players; dealer_id=2)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (3, 1, 3, 1)
    move_buttons!(table)
    @test TH.buttons(table.buttons) == (1, 3, 1, 3)
end

@testset "Table: Circle index" begin
    @test TH.circle_index(5, 1) == 1
    @test TH.circle_index(5, 2) == 2
    @test TH.circle_index(5, 3) == 3
    @test TH.circle_index(5, 4) == 4
    @test TH.circle_index(5, 5) == 5
    @test TH.circle_index(5, 6) == 1
    @test TH.circle_index(5, 7) == 2
    @test TH.circle_index(5, 0) == 5
    @test TH.circle_index(5, -1) == 4
end

@testset "Table: Dealer iterator" begin
    @test TH.default_dealer_id() == 1

    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, Dealer(), length(players)))
    @test ind == [1, 2, 3, 4, 5]

    dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players; dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, Dealer(), length(players)))
    @test ind == [2, 3, 4, 5, 1]
end

@testset "Table: SmallBlind iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, SmallBlind(), length(players)))
    @test ind == [2, 3, 4, 5, 1]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players; dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, SmallBlind(), length(players)))
    @test ind == [3, 4, 5, 1, 2]
end

@testset "Table: BigBlind iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, BigBlind(), length(players)))
    @test ind == [3, 4, 5, 1, 2]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players; dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, BigBlind(), length(players)))
    @test ind == [4, 5, 1, 2, 3]
end

@testset "Table: FirstToAct iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, FirstToAct(), length(players)))
    @test ind == [4, 5, 1, 2, 3]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(players; dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    ind = collect(TH.circle(table, FirstToAct(), length(players)))
    @test ind == [5, 1, 2, 3, 4]
end
