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
    players = ntuple(i-> Player(Bot5050(), i), 3)
    table = Table(;players = players)
    @test table.button_id == 1
    move_button!(table)
    @test table.button_id == 2
    move_button!(table)
    @test table.button_id == 3
    move_button!(table)
    @test table.button_id == 1
end

@testset "Table: Circle table" begin
    @test TH.circle_table(5, 1, 1) == 1
    @test TH.circle_table(5, 1, 2) == 2
    @test TH.circle_table(5, 1, 3) == 3
    @test TH.circle_table(5, 1, 4) == 4
    @test TH.circle_table(5, 1, 5) == 5

    @test TH.circle_table(5, 4, 1) == 4
    @test TH.circle_table(5, 4, 2) == 5
    @test TH.circle_table(5, 4, 3) == 1
    @test TH.circle_table(5, 4, 4) == 2
    @test TH.circle_table(5, 4, 5) == 3

    @test TH.circle_table(2, 1, 1) == 1
    @test TH.circle_table(2, 1, 2) == 2

    @test TH.circle_table(2, 2, 1) == 2
    @test TH.circle_table(2, 2, 2) == 1
end

@testset "Table: player position" begin
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())

    @test TH.position(table, players[1], -5) == 1
    @test TH.position(table, players[1], -4) == 2
    @test TH.position(table, players[1], -3) == 3
    @test TH.position(table, players[1], -2) == 4
    @test TH.position(table, players[1], -1) == 5
    @test TH.position(table, players[1], 0) == 1
    @test TH.position(table, players[1], 1) == 2
    @test TH.position(table, players[1], 2) == 3
    @test TH.position(table, players[1], 3) == 4
    @test TH.position(table, players[1], 4) == 5
    @test TH.position(table, players[1], 5) == 1

    @test TH.position(table, players[2], -5) == 2
    @test TH.position(table, players[2], -4) == 3
    @test TH.position(table, players[2], -3) == 4
    @test TH.position(table, players[2], -2) == 5
    @test TH.position(table, players[2], -1) == 1
    @test TH.position(table, players[2], 0) == 2
    @test TH.position(table, players[2], 1) == 3
    @test TH.position(table, players[2], 2) == 4
    @test TH.position(table, players[2], 3) == 5
    @test TH.position(table, players[2], 4) == 1
    @test TH.position(table, players[2], 5) == 2
end

@testset "Table: Button iterator" begin

    @test TH.button_id() == 1

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))

    # button_id = 1
    state = 0
    for player in TH.circle(table, Button())
        state+=1
        @test seat_number(player) == state
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    state = 0
    for player in TH.circle(table, Button())
        state+=1
        state == 1 && @test seat_number(player) == 2
        state == 2 && @test seat_number(player) == 3
        state == 3 && @test seat_number(player) == 4
        state == 4 && @test seat_number(player) == 5
        state == 5 && @test seat_number(player) == 1
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: SmallBlind iterator" begin

    @test TH.button_id() == 1

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))

    # button_id = 1
    state = 0
    for player in TH.circle(table, SmallBlind())
        state+=1
        state == 1 && @test seat_number(player) == 2
        state == 2 && @test seat_number(player) == 3
        state == 3 && @test seat_number(player) == 4
        state == 4 && @test seat_number(player) == 5
        state == 5 && @test seat_number(player) == 1
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    state = 0
    for player in TH.circle(table, SmallBlind())
        state+=1
        state == 1 && @test seat_number(player) == 3
        state == 2 && @test seat_number(player) == 4
        state == 3 && @test seat_number(player) == 5
        state == 4 && @test seat_number(player) == 1
        state == 5 && @test seat_number(player) == 2
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: BigBlind iterator" begin

    @test TH.button_id() == 1

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))

    # button_id = 1
    state = 0
    for player in TH.circle(table, BigBlind())
        state+=1
        state == 1 && @test seat_number(player) == 3
        state == 2 && @test seat_number(player) == 4
        state == 3 && @test seat_number(player) == 5
        state == 4 && @test seat_number(player) == 1
        state == 5 && @test seat_number(player) == 2
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    state = 0
    for player in TH.circle(table, BigBlind())
        state+=1
        state == 1 && @test seat_number(player) == 4
        state == 2 && @test seat_number(player) == 5
        state == 3 && @test seat_number(player) == 1
        state == 4 && @test seat_number(player) == 2
        state == 5 && @test seat_number(player) == 3
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: FirstToAct iterator" begin

    @test TH.button_id() == 1

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))

    # button_id = 1
    state = 0
    for player in TH.circle(table, FirstToAct())
        state+=1
        state == 1 && @test seat_number(player) == 4
        state == 2 && @test seat_number(player) == 5
        state == 3 && @test seat_number(player) == 1
        state == 4 && @test seat_number(player) == 2
        state == 5 && @test seat_number(player) == 3
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    state = 0
    for player in TH.circle(table, FirstToAct())
        state+=1
        state == 1 && @test seat_number(player) == 5
        state == 2 && @test seat_number(player) == 1
        state == 3 && @test seat_number(player) == 2
        state == 4 && @test seat_number(player) == 3
        state == 5 && @test seat_number(player) == 4
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: iterate from player" begin

    @test TH.button_id() == 1
    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))
    # button_id = 1
    state = 0
    for player in TH.circle(table, players[1])
        state+=1
        @test seat_number(player) == state
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    # button_id = 2
    state = 0
    for player in TH.circle(table, players[1])
        state+=1
        @test seat_number(player) == state
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = TH.button_id())
    TH.deal!(table, TH.blinds(table))
    # button_id = 1
    state = 0
    for player in TH.circle(table, players[2])
        state+=1
        state == 1 && @test seat_number(player) == 2
        state == 2 && @test seat_number(player) == 3
        state == 3 && @test seat_number(player) == 4
        state == 4 && @test seat_number(player) == 5
        state == 5 && @test seat_number(player) == 1
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> Player(Bot5050(), i), 5)
    table = Table(;players = players, button_id = 2)
    TH.deal!(table, TH.blinds(table))
    # button_id = 2
    state = 0
    for player in TH.circle(table, players[2])
        state+=1
        state == 1 && @test seat_number(player) == 2
        state == 2 && @test seat_number(player) == 3
        state == 3 && @test seat_number(player) == 4
        state == 4 && @test seat_number(player) == 5
        state == 5 && @test seat_number(player) == 1
        state == length(players) && break
    end
    @test state==length(players)
end
