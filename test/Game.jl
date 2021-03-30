using Test
using PlayingCards
using NoLimitHoldem
using PrettyTables
const NLH = NoLimitHoldem

@testset "Action ID" begin
    @test NLH.action_id(5, 1, 1) == 4
    @test NLH.action_id(5, 1, 2) == 5
    @test NLH.action_id(5, 1, 3) == 1
    @test NLH.action_id(5, 1, 4) == 2
    @test NLH.action_id(5, 1, 5) == 3

    @test NLH.action_id(5, 4, 1) == 2
    @test NLH.action_id(5, 4, 2) == 3
    @test NLH.action_id(5, 4, 3) == 4
    @test NLH.action_id(5, 4, 4) == 5
    @test NLH.action_id(5, 4, 5) == 1

    @test NLH.action_id(2, 1, 1) == 2
    @test NLH.action_id(2, 1, 2) == 1

    @test NLH.action_id(2, 2, 1) == 1
    @test NLH.action_id(2, 2, 2) == 2
end

@testset "Table" begin
    deck = OrderedDeck()

    shuffle!(deck)
    players = ntuple(2) do i
        NLH.Player(i, pop!(deck, 2))
    end
    table = NLH.Table!(deck)

    table.state = Deal()
    @test NLH.observed_cards(table) == ()
    table.state = PayBlinds();
    @test NLH.observed_cards(table) == ()
    table.state = Flop()
    @test NLH.observed_cards(table) == table.cards[1:3]
    table.state = Turn()
    @test NLH.observed_cards(table) == table.cards[1:4]
    table.state = River()
    @test NLH.observed_cards(table) == table.cards
end

@testset "Print row" begin
    for i in 1:10
        NLH.sprint_row(repeat(["a"], i))
    end
end

@testset "Play" begin
    game = Game()
    sprint(show, game)

    game.table.state = Deal()

    NLH.act!(game, PayBlinds())
    sprint(show, game)
    NLH.act!(game, PayBlinds())
end

@testset "Game" begin
    game = Game(;n_players = 3)
    players = game.players
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    check!(game, players[1])
    check!(game, players[2])

    # Round 3
    raise!(game, players[1], 10)
    call!(game, players[2], 10)

    # Round 4
    raise!(game, players[1], 10)
    fold!(game, players[2])

    data, header, table_cards = NLH.action_table_data(game)
    @info table_cards
    pretty_table(
        data,
        header,
        header_crayon = crayon"yellow bold",
        crop = :none,
    )

    # All-in cases
    game = Game(;n_players = 3)
    players = game.players
    # Round 1
    check!(game, players[1])
    check!(game, players[2])
    fold!(game, players[3])

    # Round 2
    raise!(game, players[1], players[1].bank_roll)
    call!(game, players[2], players[2].bank_roll)

    @test_throws ErrorException raise!(game, players[1], 10000)

    data, header, table_cards = NLH.action_table_data(game)
    @info table_cards
    pretty_table(
        data,
        header,
        header_crayon = crayon"yellow bold",
        crop = :none,
    )
end

@testset "Play" begin
    game = Game(;n_players = 3)

    play(game)

    data, header, table_cards = NLH.action_table_data(game)
    @info table_cards
    pretty_table(
        data,
        header,
        header_crayon = crayon"yellow bold",
        crop = :none,
    )

    data, header = NLH.results_table_data(game)
    pretty_table(
        data,
        header,
        header_crayon = crayon"yellow bold",
        crop = :none,
    )
end

@testset "Move button" begin
    game = Game(;n_players = 3)
    @test game.table.button_id == 1
    move_button!(game)
    @test game.table.button_id == 2
    move_button!(game)
    @test game.table.button_id == 3
    move_button!(game)
    @test game.table.button_id == 1
end

