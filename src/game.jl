#####
##### Game
#####

export Game, play!, tournament!

mutable struct BettingCycleState
    i::Int
    pidx::Int
end

mutable struct Game{T<:Table, IBRs, TBR}
    table::T
    initial_brs::IBRs
    betting_cycle_state::BettingCycleState
    initial_∑brs::TBR
end

function Base.show(io::IO, game::Game)
    println(io, "\n----------------------- Poker game")
    show(io, game.table, false)
    for player in players_at_table(game)
        show(io, player)
    end
    println(io, "-----------------------")
end

Game(table::Table; kwargs...) = Game(players_at_table(table); kwargs...)
Game(players::Tuple; kwargs...) = Game(Players(players); kwargs...)
function Game(players::Players; kwargs...)
    table = Table(players; kwargs...)
    bcs = first(enumerate(circle(table, FirstToAct())))
    betting_cycle_state = BettingCycleState(bcs[1], bcs[2])
    initial_∑brs = ∑bank_rolls(players)
    Game(table, deepcopy(bank_roll_chips.(players)), betting_cycle_state, initial_∑brs)
end

players_at_table(game::Game) = players_at_table(game.table)
blinds(game::Game) = blinds(game.table)
any_actions_required(game::Game) = any_actions_required(game.table)
round(game::Game) = round(game.table)
move_buttons!(game) = move_buttons!(game.table)

function print_round(table, round::Symbol)
    table.gui isa Terminal && return nothing
    round == :preflop && @cinfo table.logger "Pre-flop!"
    round == :flop && @cinfo table.logger "Flop: $(repeat(" ", 44)) $(table.cards[1:3])"
    round == :turn && @cinfo table.logger "Turn: $(repeat(" ", 44)) $(table.cards[4])"
    round == :river && @cinfo table.logger "River: $(repeat(" ", 43)) $(table.cards[5])"
end

function set_antes!(table::Table, round::Symbol)
    round == :preflop || return nothing
    players = players_at_table(table)
    for i in 1:length(players)
        if is_first_to_act(table, players[i])
            # everyone must call big blind to see flop:
            table.current_raise_amt = blinds(table).big
            table.initial_round_raise_amt = blinds(table).big
        end
    end
    return nothing
end

# TODO: compactify. Some of these cases/conditions may be redundant
function end_of_actions(table::Table, player)
    players = players_at_table(table)
    logger = table.logger
    @cdebug logger "     last_to_raise.(players) = $(last_to_raise.(players))"
    @cdebug logger "     checked.(players) = $(checked.(players))"
    @cdebug logger "     folded.(players) = $(folded.(players))"
    @cdebug logger "     action_required.(players) = $(action_required.(players))"
    @cdebug logger "     !any(action_required.(players)) = $(!any(action_required.(players)))"
    @cdebug logger "     all_playing_all_in(table) = $(all_playing_all_in(table))"
    @cdebug logger "     all_playing_checked(table) = $(all_playing_checked(table))"
    @cdebug logger "     all_all_in_or_checked(table) = $(all_all_in_or_checked(table))"
    @cdebug logger "     all_all_in_except_bank_roll_leader(table) = $(all_all_in_except_bank_roll_leader(table))"
    @cdebug logger "     all_oppononents_all_in(table, player) = $(all_oppononents_all_in(table, player))"
    # all_oppononents_all_in is needed because an opponent _can_ voluntarily
    # fold a hand resulting in the next player not needing to act (if the
    # remaining players are all-in)
    return all_bets_were_called(table) &&
        (!any_actions_required(table) || all_oppononents_all_in(table, player))
end

function last_player_to_raise(players)
    for player in players
        last_to_raise(player) && return player
    end
    return nothing
end

function all_bets_were_called(table::Table)
    players = players_at_table(table)
    lptr = last_player_to_raise(players)
    lptr===nothing && return true
    logger = table.logger

    @assert count(x->last_to_raise(x), players) == 1
    @cdebug logger "Checking if all bets were called"
    @cdebug logger "     table.winners.declared = $(table.winners.declared)"
    @cdebug logger begin
        conds_debug = map(players) do player
            sn = seat_number(player)
            cond1 = seat_number(player) == seat_number(lptr)
            cond2 = not_playing(player)
            cond3 = all_in(player)
            cond4 = pot_investment(player) == pot_investment(lptr)
            (sn, cond1, cond2, cond3, cond4)
        end
        for cond in conds_debug
            @cdebug logger "sn, cond = $(cond[1]), $(cond[2:end])"
        end
        @cdebug logger "snlptr = $(seat_number(lptr))"
    end
    return all(player-> begin
        cond1 = seat_number(player) == seat_number(lptr)
        cond2 = not_playing(player)
        cond3 = all_in(player)
        cond4 = pot_investment(player) == pot_investment(lptr)
        any((cond1, cond2, cond3, cond4))
    end, players)
end

function end_preflop_actions(table::Table, player::Player, round::Symbol)
    round == :preflop || return false
    cond1 = is_big_blind(table, player)
    cond2 = checked(player)
    cond3 = still_playing(player)
    return all((cond1, cond2, cond3))
end

function pidx_next_player(game)
    pidx = game.betting_cycle_state.pidx
    players = players_at_table(game.table)
    # return this_or_next_valid_pidx(players, pidx+1)
    return cyclic_player_index(players, pidx+1)
end

function update_betting_cycle_state!(game)
    game.betting_cycle_state.i+=1
    game.betting_cycle_state.pidx=pidx_next_player(game)
end

function reset_round_betting_cycle_state!(game)
    game.betting_cycle_state.i=1
    if game.table.round == :preflop
        game.betting_cycle_state.pidx=first(circle(game.table, FirstToAct()))
    else
        game.betting_cycle_state.pidx=first(circle(game.table, SmallBlind()))
    end
end

metafmt(level, _module, group, id, file, line) =
    Logging.default_metafmt(level, nothing, group, id, nothing, nothing)

function pidx_from_seat_number(player, players)::Int
    for (i, p) in enumerate(players)
        if seat_number(player) == seat_number(p)
            return i
        end
    end
    error("Uncaught case")
end

function max_possible_profit(player, players, initial_brs)
    mpp = Chips(0)
    pidx = pidx_from_seat_number(player, players)
    for (oidx, opponent) in enumerate(players)
        seat_number(player) == seat_number(opponent) && continue
        mpp += min(initial_brs[pidx], initial_brs[oidx])
    end
    return mpp
end

"""
    play!(game::Game[, ::Val{true|false}])

Play a game. Users can take a game at an instance
and continue that game, by calling `play!` with
`Val(false)`.
"""
play!(game::Game) = play!(game, Val(true))

function play!(game::Game, ::Val{init}) where {init}
    if game.table.logger isa DebugLogger
        cl = Logging.ConsoleLogger(stderr,Logging.Debug; meta_formatter=metafmt)
        Logging.with_logger(cl) do
            _play!(game, Val(init))
        end
    else
        _play!(game, Val(init))
    end
end

function _play!(game::Game, ::Val{init}) where {init}
    init && initialize!(game)
    while true
        (options, flow) = play_to_options!(game)::Tuple{Options,Symbol}
        if flow == :continue; continue; elseif flow == :break; break
        elseif flow == :goto_action; else; error("Uncaught case"); end

        action = player_option(game, options)::Action
        validate_action(action, options)

        update_given_valid_action!(game, action)
        flow = check_if_game_is_over!(game)
        if flow == :continue; continue; elseif flow == :break; break
        else; error("Uncaught case"); end
    end
    distribute_winnings!(game)
    game.table.winners.declared = true
    post_game_procedure(game)
    return any_quit_game(game)
end

function next_round(r)
    if r == :preflop;  return :flop
    elseif r == :flop; return :turn
    elseif r == :turn; return :river
    else; error("Uncaught case")
    end
end

current_player(game) = players_at_table(game.table)[game.betting_cycle_state.pidx]

any_quit_game(game) = any(x->quit_game(game, x), players_at_table(game.table))

distribute_winnings!(game) =
    distribute_winnings!(players_at_table(game.table),
        game.table.transactions, cards(game.table), game.table.logger)

function play_to_options!(game::Game)
    table = game.table
    logger = table.logger
    winners = table.winners
    players = players_at_table(table)
    bcs = game.betting_cycle_state
    if bcs.i > n_max_actions(table) # :preflop, :flop, :turn, :river
        error("Too many actions have occurred, please open an issue.")
    end
    if bcs.i == 1
        @cdebug logger "----------- Betting round: $(table.round)"
        @cdebug logger "betting_cycle_state: $bcs"
    else
        @cdebug logger "betting_cycle_state: $bcs"
    end
    check_for_and_declare_winner!(table)
    if table.winners.declared
        @cinfo logger "Winner declared!"
        @assert all_bets_were_called(table)
        reset_round_parameters!(game.table)
        reset_round_betting_cycle_state!(game)
        reset_round_bank_rolls!(table, table.round)
        return (NoOptions(), :break)
    end
    if bcs.i == 1
        update_gui(table)
        print_round(table, table.round)

        if play_out_game(table) || !any_actions_required(table)
            @cinfo logger "Betting finished for $(table.round)."
            @assert all_bets_were_called(table)
            reset_round_parameters!(game.table)
            if table.round == :river
                return (NoOptions(), :break)
            else
                table.round = next_round(table.round)
                reset_round_betting_cycle_state!(game)
                reset_round_bank_rolls!(table, table.round)
                return (NoOptions(), :continue)
            end
        end
        set_play_out_game!(table)
    end

    player = players[bcs.pidx]
    @cdebug logger "Checking to see if it's $(name(player))'s turn to act"
    @cdebug logger "     not_playing(player) = $(not_playing(player))"
    @cdebug logger "     all_in.(players) = $(all_in.(players))"
    if end_of_actions(table, player)
        @cinfo logger "Betting finished for $(table.round)."
        @assert all_bets_were_called(table)
        reset_round_parameters!(game.table)
        if table.round == :river
            return (NoOptions(), :break)
        else
            table.round = next_round(table.round)
            reset_round_betting_cycle_state!(game)
            reset_round_bank_rolls!(table, table.round)
            return (NoOptions(), :continue)
        end
    end
    if all_in(player) || not_playing(player)
        update_betting_cycle_state!(game)
        return (NoOptions(), :continue)
    end
    @cdebug logger "$(name(player))'s turn to act"

    options = get_options(game, player)
    return (options, :goto_action)
end

function check_if_game_is_over!(game::Game)
    player = current_player(game)
    table = game.table
    if table.winners.declared || end_preflop_actions(table, player, table.round)
        @cinfo table.logger "Betting finished for $(table.round)."
        @assert all_bets_were_called(table)
        reset_round_parameters!(game.table)
        if table.round == :river
            return :break
        else
            table.round = next_round(table.round)
            reset_round_betting_cycle_state!(game)
            reset_round_bank_rolls!(table, table.round)
            return :continue
        end
    end
    update_betting_cycle_state!(game)
    return :continue
end


∑bank_rolls(players) =
    mapreduce(x->bank_roll_chips(x), +, players; init=Chips(0))

function post_game_procedure(game)
    logger = game.table.logger
    table = game.table
    winners = table.winners
    players = players_at_table(table)
    initial_brs = game.initial_brs
    update_gui(table)
    @cdebug logger "amounts.(table.transactions.side_pots) = $(amounts.(table.transactions.side_pots))"
    @cdebug logger "initial_∑brs = $(game.initial_∑brs)"
    @cdebug logger "sum(bank_roll.(players)) = $(sum(bank_roll.(players)))"
    @cdebug logger "initial_brs = $(initial_brs)"
    @cdebug logger "bank_roll_chips.(players) = $(bank_roll_chips.(players))"

    if !(logger isa ByPassLogger)
        if game.initial_∑brs ≠ ∑bank_rolls(players)
            @cinfo logger "initial_∑brs=$(game.initial_∑brs), brs=$(bank_roll_chips.(players))"
        end
    end
    @assert game.initial_∑brs == ∑bank_rolls(players) "initial_∑brs = $(game.initial_∑brs), ∑bank_rolls = $(∑bank_rolls(players))"
    @assert sum(sp->sum(amounts(sp)), table.transactions.side_pots) == 0
    for (player, initial_br) in zip(players, initial_brs)
        mpp = max_possible_profit(player, players, initial_brs)
        prof = bank_roll_chips(player) - initial_br
        # TODO: this is broken due to https://github.com/charleskawczynski/TexasHoldem.jl/issues/200
        @assert prof ≤ mpp string("Over-winning occurred:\n",
              "    Player $(name(player))\n",
              "    Initial BRs $(initial_brs)\n",
              "    BRs $(map(x->bank_roll_chips(x), players))\n",
              "    profit $prof\n",
              "    profit.n $(prof.n)\n",
              "    cond $(prof.n ≤ mpp.n)\n",
              "    max possible profit $mpp")
    end

    @cinfo logger "Final bank roll summary: $(bank_roll_chips.(players))"
    @assert winners.declared
    for player in players
        notify_reward(player)
    end
end

function set_active_status!(table, players::Players)
    logger = table.logger
    for player in players
        if zero_bank_roll(player)
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

function initialize!(game)
    logger = game.table.logger
    table = game.table
    winners = table.winners
    players = players_at_table(table)
    initial_brs = game.initial_brs
    @assert !winners.declared "We haven't started playing yet!"
    @inbounds for (pidx, player) in enumerate(players)
        initial_brs[pidx] = bank_roll_chips(player)
    end
    @cinfo logger "------ Playing game!"
    set_active_status!(table, players)
    game.initial_∑brs = ∑bank_rolls(players)
    verify_start_of_game(table)

    verify_seats(table)

    reset!(table.transactions, players)
    table.round = :preflop
    @assert all(p->!has_cards(p), players)
    @assert all(c->c==joker, cards(table))
    # round bank-rolls must _exclude_ blinds, so we must reset before dealing
    reset_round_bank_rolls!(table, :null)
    deal!(table, blinds(table))
    @assert cards(table) ≠ nothing
    game.table.round = :preflop
    reset_round_betting_cycle_state!(game) # depends on round
    return game
end

function verify_seats(table)
    @assert dealer_pidx(table) ≠ small_blind_pidx(table) "The button and small blind cannot coincide"
    @assert small_blind_pidx(table) ≠ big_blind_pidx(table) "The small and big blinds cannot coincide"
    @assert big_blind_pidx(table) ≠ first_to_act_pidx(table) "The big blind and first to act cannot coincide"
end

function verify_start_of_game(table)
    logger = table.logger
    players = players_at_table(table)
    @cinfo logger "Initial bank roll summary: $(bank_roll_chips.(players))"
    did = dealer_pidx(table)
    sb = seat_number(small_blind(table))
    bb = seat_number(big_blind(table))
    f2a = seat_number(first_to_act(table))
    @cinfo logger "Buttons (dealer, small, big, 1ˢᵗToAct): ($did, $sb, $bb, $f2a)"
    @assert still_playing(dealer(table)) "The button must be placed on a non-folded player"
    @assert still_playing(small_blind(table)) "The small blind button must be placed on a non-folded player"
    @assert still_playing(big_blind(table)) "The big blind button must be placed on a non-folded player"
    @assert still_playing(first_to_act(table)) "The first-to-act button must be placed on a non-folded player"
end

function reset_game!(game::Game)
    table = game.table
    logger = table.logger
    players = players_at_table(table)

    game.table = Table(players;
        dealer_pidx=dealer_pidx(table),
        blinds=table.blinds,
        logger=logger,
        gui=table.gui,
    )
    bcs = first(enumerate(circle(game.table, FirstToAct())))
    game.betting_cycle_state.i = bcs[1]
    game.betting_cycle_state.pidx = bcs[2]
    PlayingCards.reset!(game.table.deck)
    table = game.table
    players = players_at_table(table)
    for player in players
        @inbounds for j in 1:2
            player.cards[j] = joker
        end
        player.pot_investment = 0
        player.game_profit = Chips(0)
        player.round_bank_roll = bank_roll_chips(player)
        player.performed_action = :none
        player.last_to_raise = false
        player.round_contribution = 0
        player.active = true
    end
    set_active_status!(table, players)
    table.play_out_game = false
end

"""
    tournament!(game::Game)

Play until a single player remains!
"""
function tournament!(game::Game)
    logger = game.table.logger
    @cinfo logger "********************************"
    @cinfo logger "******************************** Playing tournament!"
    @cinfo logger "********************************"
    table = game.table
    players = players_at_table(table)
    while length(players) > 1
        quit = play!(game)
        quit && break
        n_players_remaining = count(x->!(bank_roll(x) == 0), players)
        if n_players_remaining ≤ 1
            @cinfo logger "Victor emerges!"
            break
        end
        reset_game!(game)
        move_buttons!(game)
    end
    @cinfo logger "********************************"
    @cinfo logger "******************************** Finished tournament!"
    @cinfo logger "********************************"
    return game.table.winners
end

