#####
##### Game
#####

export Game, play!, tournament!

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

function Game(
        players::Tuple;
        deck = ordered_deck(),
        table = nothing,
        dealer_id::Int = default_dealer_id(),
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
            dealer_id=dealer_id,
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
move_buttons!(game) = move_buttons!(game.table)

print_game_state(table, state::PreFlop) = @info "Pre-flop!"
print_game_state(table, state::Flop) =  @info "Flop: $(repeat(" ", 44)) $(table.cards[1:3])"
print_game_state(table, state::Turn) =  @info "Turn: $(repeat(" ", 44)) $(table.cards[4])"
print_game_state(table, state::River) = @info "River: $(repeat(" ", 43)) $(table.cards[5])"

set_preflop_blind_raise!(table::Table, player, ::AbstractGameState, i::Int) = nothing
function set_preflop_blind_raise!(table::Table, player::Player, ::PreFlop, i::Int)
    if 1 ≤ i ≤ length(players_at_table(table))
        # TODO: what if only two players?
        if is_first_to_act(table, player)
            # everyone must call big blind to see flop:
            table.current_raise_amt = blinds(table).big
        end
    end
end
reset_round_bank_rolls!(game::Game, state::PreFlop) = nothing # called separately prior to deal
reset_round_bank_rolls!(game::Game, state::AbstractGameState) = reset_round_bank_rolls!(game.table)

function end_of_actions(table::Table, player)
    players = players_at_table(table)
    @debug "     last_to_raise.(players) = $(last_to_raise.(players))"
    @debug "     checked.(players) = $(checked.(players))"
    @debug "     folded.(players) = $(folded.(players))"
    @debug "     action_required.(players) = $(action_required.(players))"
    @debug "     !any(action_required.(players)) = $(!any(action_required.(players)))"
    @debug "     all_playing_all_in(table) = $(all_playing_all_in(table))"
    @debug "     all_playing_checked(table) = $(all_playing_checked(table))"
    @debug "     all_all_in_or_checked(table) = $(all_all_in_or_checked(table))"
    @debug "     all_all_in_except_bank_roll_leader(table) = $(all_all_in_except_bank_roll_leader(table))"
    @debug "     all_oppononents_all_in(table, player) = $(all_oppononents_all_in(table, player))"

    case_1 = last_to_raise(player)
    case_2 = all_playing_checked(table)
    case_3 = all_playing_all_in(table)
    case_4 = all_all_in_except_bank_roll_leader(table)
    case_5 = all_all_in_or_checked(table)
    case_6 = !any(action_required.(players))
    case_7 = all_oppononents_all_in(table, player) && paid_current_raise_amount(table, player)
    @debug "     cases = $((case_1, case_2, case_3, case_4, case_5, case_6, case_7))"

    return any((case_1, case_2, case_3, case_4, case_5, case_6, case_7))
end

function last_player_to_raise(table::Table)
    for player in players_at_table(table)
        last_to_raise(player) && return player
    end
    return nothing
end

function all_raises_were_called(table::Table)
    lptr = last_player_to_raise(table)
    lptr===nothing && return true

    players = players_at_table(table)
    ltr = last_to_raise.(players)
    @assert count(ltr) == 1
    players_who_called = []
    @debug "Checking if all raises were called"
    @debug "     table.winners.declared = $(table.winners.declared)"
    arwc = false
    conds = map(players) do player
        cond1 = seat_number(player) == seat_number(lptr)
        cond2 = not_playing(player)
        cond3 = all_in(player)
        cond4 = pot_investment(player) ≈ pot_investment(lptr)
        (cond1, cond2, cond3, cond4)
    end
    @debug begin
        conds_debug = map(players) do player
            sn = seat_number(player)
            cond1 = seat_number(player) == seat_number(lptr)
            cond2 = not_playing(player)
            cond3 = all_in(player)
            cond4 = pot_investment(player) ≈ pot_investment(lptr)
            (sn, cond1, cond2, cond3, cond4)
        end
        for cond in conds_debug
            @debug "sn, cond = $(cond[1]), $(cond[2:end])"
        end
        @debug "snlptr = $(seat_number(lptr))"
    end
    return all(map(cond->any(cond), conds))
end

end_preflop_actions(table, player, ::AbstractGameState) = false
function end_preflop_actions(table::Table, player::Player, ::PreFlop)
    cond1 = is_big_blind(table, player)
    cond2 = checked(player)
    cond3 = still_playing(player)
    return all((cond1, cond2, cond3))
end

function act_generic!(game::Game, state::AbstractGameState)
    table = game.table
    table.winners.declared && return
    set_state!(table, state)
    print_game_state(table, state)
    reset_round_bank_rolls!(game, state)

    any_actions_required(game) || return
    play_out_game(table) && return
    set_play_out_game!(table)
    for (i, player) in enumerate(circle(table, FirstToAct()))
        @debug "Checking to see if it's $(name(player))'s turn to act"
        @debug "     not_playing(player) = $(not_playing(player))"
        @debug "     all_in(player) = $(all_in(player))"
        not_playing(player) && continue # skip players not playing
        set_preflop_blind_raise!(table, player, state, i)
        if end_of_actions(table, player)
            break
        end
        all_in(player) && continue
        @debug "$(name(player))'s turn to act"
        player_option!(game, player)
        table.winners.declared && break
        end_preflop_actions(table, player, state) && break
        if i > n_max_actions(table)
            error("Too many actions have occured, please open an issue.")
        end
    end
    @info "Betting is finished."
    @assert all_raises_were_called(table)
end

function act!(game::Game, state::AbstractGameState)
    act_generic!(game, state)
    reset_round!(game.table)
end

"""
    play!(::Game)

Play a game. Note that this method
expects no cards (players and table)
to be dealt.
"""
function play!(game::Game)
    @info "------ Playing game!"

    table = game.table
    set_active_status!(table)
    players = players_at_table(table)

    initial_brs = deepcopy(bank_roll.(players))
    initial_∑brs = sum(initial_brs)

    @info "Initial bank roll summary: $(bank_roll.(players))"
    did = dealer_id(table)
    sb = seat_number(small_blind(table))
    bb = seat_number(big_blind(table))
    f2a = seat_number(first_to_act(table))
    @info "Buttons (dealer, small, big, 1ˢᵗToAct): ($did, $sb, $bb, $f2a)"

    @assert still_playing(dealer(table)) "The button must be placed on a non-folded player"
    @assert still_playing(small_blind(table)) "The small blind button must be placed on a non-folded player"
    @assert still_playing(big_blind(table)) "The big blind button must be placed on a non-folded player"
    @assert still_playing(first_to_act(table)) "The first-to-act button must be placed on a non-folded player"

    @assert dealer_id(table) ≠ small_blind_id(table) "The button and small blind cannot coincide"
    @assert small_blind_id(table) ≠ big_blind_id(table) "The small and big blinds cannot coincide"
    @assert big_blind_id(table) ≠ first_to_act_id(table) "The big blind and first to act cannot coincide"

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

    @info "------ Finished game!"
    return winners
end

function set_active_status!(table::Table)
    players = players_at_table(table)
    for player in players
        if zero_bank_roll(player) # TODO: should we remove these players from the table?
            player.active = false
            player.folded = true
            player.action_required = false
        else
            player.active = true
            player.folded = false
            player.action_required = true
        end
    end
end

function reset_game!(game::Game)
    table = game.table
    players = players_at_table(table)

    game.table = Table(;
        deck=ordered_deck(),
        players=players,
        dealer_id=dealer_id(table),
        blinds=table.blinds
    )
    table = game.table
    players = players_at_table(table)
    for player in players
        player.cards = nothing
        player.pot_investment = 0
        player.all_in = false
        player.round_bank_roll = bank_roll(player)
        player.checked = false
        player.last_to_raise = false
        player.round_contribution = 0
        player.active = true
    end
    set_active_status!(table)
    table.play_out_game = false
end

"""
    tournament!(game::Game)

Play until a single player remains!
"""
function tournament!(game::Game)
    @info "********************************"
    @info "******************************** Playing tournament!"
    @info "********************************"
    table = game.table
    players = players_at_table(table)
    while length(players) > 1
        play!(game)
        n_players_remaining = count(map(x->!(bank_roll(x) ≈ 0), players))
        if n_players_remaining ≤ 1
            println("Victor emerges!")
            break
        end
        reset_game!(game)
        move_buttons!(game)
    end
    @info "********************************"
    @info "******************************** Finished tournament!"
    @info "********************************"
    return game.table.winners
end

