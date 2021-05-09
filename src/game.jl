#####
##### Game
#####

export Game, play

mutable struct Game
    table::Table
end

function Base.show(io::IO, game::Game)
    println(io, "\n----------------------- Poker game")
    show(io, game.table, false)
    for player in players_at_table(game)
        show(io, player, false)
    end
    println(io, "-----------------------")
end

function Game(players::Tuple;
        deck = ordered_deck(),
        table = nothing,
        button_id::Int = button_id(),
        blinds::Blinds = Blinds(1,2),
    )

    n_player_cards = sum(map(x->cards(x)==nothing ? 0 : length(cards(x)), players))

    @assert 2 ≤ length(players) ≤ 10 "Invalid number of players"

    if length(deck) ≠ 52
        # if the deck isn't full, then players should have been dealt cards.
        @assert n_player_cards > 0

        # If the user is specifying the player cards, then the
        # user should probably also handle the table cards too.
        @assert table ≠ nothing
        @assert cards(table) isa Tuple{Card,Card,Card,Card,Card}
        @assert length(cards(table)) == 5
        @assert length(deck) + n_player_cards + length(cards(table)) == 52
    else # nobody has been dealt yet
        table = Table(;
            deck=deck,
            players=players,
            button_id=button_id,
            blinds=blinds
        )

        @assert length(deck) == 52
        @assert n_player_cards == 0
        @assert cards(table) == nothing
    end

    return Game(table)
end

players_at_table(game::Game) = players_at_table(game.table)
blinds(game::Game) = blinds(game.table)
any_actions_required(game::Game) = any_actions_required(game.table)
state(game::Game) = state(game.table)

print_new_cards(table, state::PreFlop) = nothing
print_new_cards(table, state::Flop) =  @info "Flop: $(repeat(" ", 44)) $(table.cards[1:3])"
print_new_cards(table, state::Turn) =  @info "Turn: $(repeat(" ", 44)) $(table.cards[4])"
print_new_cards(table, state::River) = @info "River: $(repeat(" ", 43)) $(table.cards[5])"

force_blind_raise!(table::Table, player, ::AbstractGameState, i::Int) = nothing
function force_blind_raise!(table::Table, player::Player, ::PreFlop, i::Int)
    if 1 ≤ i ≤ length(players_at_table(table))
        # TODO: what if only two players?
        if is_first_to_act(table, player)
            # everyone must call big blind to see flop:
            table.current_raise_amt = blinds(table).big
            return true
        end
    end
    return false
end
reset_round_bank_rolls!(game::Game, state::PreFlop) = nothing # called separately prior to deal
reset_round_bank_rolls!(game::Game, state::AbstractGameState) = reset_round_bank_rolls!(game.table)

function act_generic!(game::Game, state::AbstractGameState)
    table = game.table
    table.winners.declared && return
    set_state!(game.table, state)
    @info " --- $state --- "
    print_new_cards(game.table, state)
    reset_round_bank_rolls!(game, state)

    any_actions_required(game) || return
    for (i, player) in enumerate(circle(table, FirstToAct()))
        cra_changed = force_blind_raise!(table, player, state, i)
        @debug "Checking to see if it's $(name(player))'s turn to act"
        @debug "     table.current_raise_amt = $(game.table.current_raise_amt)"
        @debug "     cra_changed = $cra_changed"
        @debug "     all_in.(players_at_table(table)) = $(all_in.(players_at_table(table)))"
        @debug "     last_to_raise.(players_at_table(table)) = $(last_to_raise.(players_at_table(table)))"
        @debug "     checked.(players_at_table(table)) = $(checked.(players_at_table(table)))"
        @debug "     folded.(players_at_table(table)) = $(folded.(players_at_table(table)))"
        @debug "     action_required.(players_at_table(table)) = $(action_required.(players_at_table(table)))"
        @debug "     !any(action_required.(players_at_table(table))) = $(!any(action_required.(players_at_table(table))))"
        @debug "     all_all_in_or_folded(table) = $(all_all_in_or_folded(table))"
        @debug "     all_checked_or_folded(table) = $(all_checked_or_folded(table))"
        @debug "     bank_roll.(players_at_table(table)) = $(bank_roll.(players_at_table(table)))"
        last_to_raise(player) && break
        all_checked_or_folded(table) && break
        all_all_in_or_folded(table) && break
        !any(action_required.(players_at_table(table))) && break
        folded(player) && continue
        all_in(player) && continue
        @debug "$(name(player))'s turn to act"
        player_option!(game, player)
        table.winners.declared && break
    end
end

function act!(game::Game, state::AbstractGameState)
    act_generic!(game, state)
    reset_round!(game.table)
end

"""
    play(::Game)

Play a game. Note that this method
expects no cards (players and table)
to be dealt.
"""
function play(game::Game)
    @info "********************************"
    @info "******************************** Playing Game!"
    @info "********************************"

    table = game.table
    sit_down_or_sit_out!(table)
    players = players_at_table(table)

    n_players = length(players)
    if !(2 ≤ n_players ≤ 10)
        @warn "Cannot play a game with $n_players player(s)."
        return nothing
    end

    initial_brs = deepcopy(bank_roll.(players))
    initial_∑brs = sum(initial_brs)

    @info "Initial bank roll summary: $(bank_roll.(players))"

    table.transactions = TransactionManager(players)

    @assert all(cards.(players) .== nothing)
    @assert cards(table) == nothing
    reset_round_bank_rolls!(table) # round bank-rolls must account for blinds
    deal!(table, blinds(table))
    @assert cards(table) ≠ nothing

    winners = table.winners

    winners.declared || act!(game, PreFlop())   # Pre-flop bet/check/raise
    winners.declared || act!(game, Flop())      # Deal flop , then bet/check/raise
    winners.declared || act!(game, Turn())      # Deal turn , then bet/check/raise
    winners.declared || act!(game, River())     # Deal river, then bet/check/raise

    distribute_winnings!(players, table.transactions, cards(table))

    @debug "amount.(table.transactions.side_pots) = $(amount.(table.transactions.side_pots))"
    @debug "initial_∑brs = $(initial_∑brs)"
    @debug "sum(bank_roll.(players_at_table(table))) = $(sum(bank_roll.(players_at_table(table))))"
    @debug "initial_brs = $(initial_brs)"
    @debug "bank_roll.(players_at_table(table)) = $(bank_roll.(players_at_table(table)))"

    @assert initial_∑brs ≈ sum(bank_roll.(players_at_table(table))) # eventual assertion
    @assert sum(amount.(table.transactions.side_pots)) ≈ 0

    @info "Final bank roll summary: $(bank_roll.(players))"

    @info "********************************"
    @info "******************************** Game finished!"
    @info "********************************"
    return winners
end

