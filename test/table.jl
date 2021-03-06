using Test
using PlayingCards
using Logging
using TexasHoldem
using TexasHoldem: seat_number
TH = TexasHoldem

@testset "Table: constructors / observed cards" begin
    players = ntuple(i-> Player(Bot5050(), i), 2)
    deck = ordered_deck()
    shuffle!(deck)
    blinds = TH.Blinds(1,2)
    cards = TH.get_table_cards!(deck)
    table = TH.Table(;deck=deck, cards=cards, players=players)
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
    table = Table(;players = players)
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
    table = Table(;players = players)
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
    table = Table(;players = players, dealer_id=2)
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
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, Dealer(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [1, 2, 3, 4, 5]

    dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, Dealer(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [2, 3, 4, 5, 1]
end

@testset "Table: SmallBlind iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, SmallBlind(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [2, 3, 4, 5, 1]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, SmallBlind(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [3, 4, 5, 1, 2]
end

@testset "Table: BigBlind iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, BigBlind(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [3, 4, 5, 1, 2]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, BigBlind(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [4, 5, 1, 2, 3]
end

@testset "Table: FirstToAct iterator" begin
    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, FirstToAct(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [4, 5, 1, 2, 3]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, FirstToAct(), length(players)))
    sn = seat_number.(iter_players)
    @test sn == [5, 1, 2, 3, 4]
end

@testset "Table: iterate from player" begin
    # dealer_id = 1
    @test TH.default_dealer_id() == 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, players[1], length(players)))
    sn = seat_number.(iter_players)
    @test sn == [1, 2, 3, 4, 5]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, players[1], length(players)))
    sn = seat_number.(iter_players)
    @test sn == [1, 2, 3, 4, 5]

    # dealer_id = 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, players[2], length(players)))
    sn = seat_number.(iter_players)
    @test sn == [2, 3, 4, 5, 1]

    # dealer_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, dealer_id = 2)
    TH.deal!(table, TH.blinds(table))
    iter_players = collect(TH.circle(table, players[2], length(players)))
    sn = seat_number.(iter_players)
    @test sn == [2, 3, 4, 5, 1]
end
