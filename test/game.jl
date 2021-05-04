using Test
using PlayingCards
using NoLimitHoldem
using PrettyTables
NLH = NoLimitHoldem

@testset "Game: Print row" begin
    for i in 1:10
        NLH.sprint_row(repeat(["a"], i))
    end
end

@testset "Game: show" begin
    players = ntuple(2) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    sprint(show, game)

    game.table.state = PreFlop()
    sprint(show, game)
end

pretty_table_header(header) = tuple([header[i, :] for i = 1:size(header, 1)]...)

@testset "Game: contrived game" begin
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    players = NLH.players_at_table(game)
    NLH.deal!(game.table, NLH.blinds(game.table))
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
        data;
        header = pretty_table_header(header),
        header_crayon = crayon"yellow bold",
        crop = :none,
    )

    # All-in cases
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)
    players = NLH.players_at_table(game)
    NLH.deal!(game.table, NLH.blinds(game.table))
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
        data;
        header = pretty_table_header(header),
        header_crayon = crayon"yellow bold",
        crop = :none,
    )
end

@testset "Game: Play 2" begin
    players = ntuple(3) do i
        NLH.Player(BotRandom(), i)
    end
    game = Game(players)

    play(game; debug = true)

    data, header, table_cards = NLH.action_table_data(game)
    @info table_cards
    pretty_table(
        data;
        header = pretty_table_header(header),
        header_crayon = crayon"yellow bold",
        crop = :none,
    )

    data, header = NLH.results_table_data(game)
    pretty_table(
        data;
        header = pretty_table_header(header),
        header_crayon = crayon"yellow bold",
        crop = :none,
    )
end
