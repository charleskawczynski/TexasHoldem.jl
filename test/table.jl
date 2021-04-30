using Test
using PlayingCards
using NoLimitHoldem
using PrettyTables
NLH = NoLimitHoldem

@testset "Table: constructors / observed cards" begin
    players = ntuple(i-> NLH.Player(BotRandom(), i), 2)
    deck = ordered_deck()
    shuffle!(deck)
    blinds = NLH.Blinds(1,2)
    cards = NLH.get_table_cards!(deck)
    table = NLH.Table(;deck=deck, cards=cards, players=players)
    NLH.deal!(table, blinds)

    table.state = PreFlop()
    @test NLH.observed_cards(table) == ()
    table.state = Flop()
    @test NLH.observed_cards(table) == table.cards[1:3]
    table.state = Turn()
    @test NLH.observed_cards(table) == table.cards[1:4]
    table.state = River()
    @test NLH.observed_cards(table) == table.cards
end

@testset "Table: Move button" begin
    players = ntuple(i-> NLH.Player(BotRandom(), i), 3)
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
    @test NLH.circle_table(5, 1, 1) == 1
    @test NLH.circle_table(5, 1, 2) == 2
    @test NLH.circle_table(5, 1, 3) == 3
    @test NLH.circle_table(5, 1, 4) == 4
    @test NLH.circle_table(5, 1, 5) == 5

    @test NLH.circle_table(5, 4, 1) == 4
    @test NLH.circle_table(5, 4, 2) == 5
    @test NLH.circle_table(5, 4, 3) == 1
    @test NLH.circle_table(5, 4, 4) == 2
    @test NLH.circle_table(5, 4, 5) == 3

    @test NLH.circle_table(2, 1, 1) == 1
    @test NLH.circle_table(2, 1, 2) == 2

    @test NLH.circle_table(2, 2, 1) == 2
    @test NLH.circle_table(2, 2, 2) == 1
end

@testset "Table: player position" begin
    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())

    @test NLH.position(table, players[1], -5) == 1
    @test NLH.position(table, players[1], -4) == 2
    @test NLH.position(table, players[1], -3) == 3
    @test NLH.position(table, players[1], -2) == 4
    @test NLH.position(table, players[1], -1) == 5
    @test NLH.position(table, players[1], 0) == 1
    @test NLH.position(table, players[1], 1) == 2
    @test NLH.position(table, players[1], 2) == 3
    @test NLH.position(table, players[1], 3) == 4
    @test NLH.position(table, players[1], 4) == 5
    @test NLH.position(table, players[1], 5) == 1

    @test NLH.position(table, players[2], -5) == 2
    @test NLH.position(table, players[2], -4) == 3
    @test NLH.position(table, players[2], -3) == 4
    @test NLH.position(table, players[2], -2) == 5
    @test NLH.position(table, players[2], -1) == 1
    @test NLH.position(table, players[2], 0) == 2
    @test NLH.position(table, players[2], 1) == 3
    @test NLH.position(table, players[2], 2) == 4
    @test NLH.position(table, players[2], 3) == 5
    @test NLH.position(table, players[2], 4) == 1
    @test NLH.position(table, players[2], 5) == 2
end

@testset "Table: Button iterator" begin

    @test NLH.button_id() == 1

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())
    NLH.deal!(table, NLH.blinds(table))

    # button_id = 1
    state = 0
    for player in NLH.circle(table, Button())
        state+=1
        @test player.id == state
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = 2)
    NLH.deal!(table, NLH.blinds(table))
    state = 0
    for player in NLH.circle(table, Button())
        state+=1
        state == 1 && @test player.id == 2
        state == 2 && @test player.id == 3
        state == 3 && @test player.id == 4
        state == 4 && @test player.id == 5
        state == 5 && @test player.id == 1
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: SmallBlind iterator" begin

    @test NLH.button_id() == 1

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())
    NLH.deal!(table, NLH.blinds(table))

    # button_id = 1
    state = 0
    for player in NLH.circle(table, SmallBlind())
        state+=1
        state == 1 && @test player.id == 2
        state == 2 && @test player.id == 3
        state == 3 && @test player.id == 4
        state == 4 && @test player.id == 5
        state == 5 && @test player.id == 1
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = 2)
    NLH.deal!(table, NLH.blinds(table))
    state = 0
    for player in NLH.circle(table, SmallBlind())
        state+=1
        state == 1 && @test player.id == 3
        state == 2 && @test player.id == 4
        state == 3 && @test player.id == 5
        state == 4 && @test player.id == 1
        state == 5 && @test player.id == 2
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: BigBlind iterator" begin

    @test NLH.button_id() == 1

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())
    NLH.deal!(table, NLH.blinds(table))

    # button_id = 1
    state = 0
    for player in NLH.circle(table, BigBlind())
        state+=1
        state == 1 && @test player.id == 3
        state == 2 && @test player.id == 4
        state == 3 && @test player.id == 5
        state == 4 && @test player.id == 1
        state == 5 && @test player.id == 2
        state == length(players) && break
    end
    @test state==length(players)

    # button_id = 2
    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = 2)
    NLH.deal!(table, NLH.blinds(table))
    state = 0
    for player in NLH.circle(table, BigBlind())
        state+=1
        state == 1 && @test player.id == 4
        state == 2 && @test player.id == 5
        state == 3 && @test player.id == 1
        state == 4 && @test player.id == 2
        state == 5 && @test player.id == 3
        state == length(players) && break
    end
    @test state==length(players)
end

@testset "Table: iterate from player" begin

    @test NLH.button_id() == 1
    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())
    NLH.deal!(table, NLH.blinds(table))
    # button_id = 1
    state = 0
    for player in NLH.circle(table, players[1])
        state+=1
        @test player.id == state
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = 2)
    NLH.deal!(table, NLH.blinds(table))
    # button_id = 2
    state = 0
    for player in NLH.circle(table, players[1])
        state+=1
        @test player.id == state
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = NLH.button_id())
    NLH.deal!(table, NLH.blinds(table))
    # button_id = 1
    state = 0
    for player in NLH.circle(table, players[2])
        state+=1
        state == 1 && @test player.id == 2
        state == 2 && @test player.id == 3
        state == 3 && @test player.id == 4
        state == 4 && @test player.id == 5
        state == 5 && @test player.id == 1
        state == length(players) && break
    end
    @test state==length(players)

    players = ntuple(i-> NLH.Player(BotRandom(), i), 5)
    table = Table(;players = players, button_id = 2)
    NLH.deal!(table, NLH.blinds(table))
    # button_id = 2
    state = 0
    for player in NLH.circle(table, players[2])
        state+=1
        state == 1 && @test player.id == 2
        state == 2 && @test player.id == 3
        state == 3 && @test player.id == 4
        state == 4 && @test player.id == 5
        state == 5 && @test player.id == 1
        state == length(players) && break
    end
    @test state==length(players)
end
