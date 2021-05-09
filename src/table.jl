#####
##### Table
#####

export Button, SmallBlind, BigBlind, FirstToAct
export Table, blinds
export move_button!

Base.@kwdef mutable struct Winners
    declared::Bool = false
    players::Union{Nothing,Tuple,Player} = nothing
end

function Base.show(io::IO, winners::Winners, include_type = true)
    include_type && println(io, typeof(winners))
    println(io, "Winners declared = $(winners.declared)")
    println(io, "Winners          = $(winners.players)")
end

struct Blinds{S,B}
    small::S
    big::B
end

Blinds() = Blinds(1,2) # default
button_id() = 1 # default

function Base.show(io::IO, blinds::Blinds, include_type = true)
    include_type && println(io, typeof(blinds))
    println(io, "Blinds           = (small=$(blinds.small),big=$(blinds.big))")
end

mutable struct Table
    deck::PlayingCards.Deck
    players::Tuple
    players_sitting_out::Tuple
    cards::Union{Nothing,Tuple{<:Card,<:Card,<:Card,<:Card,<:Card}}
    blinds::Blinds
    pot::Float64
    state::AbstractGameState
    button_id::Int
    current_raise_amt::Float64
    transactions::TransactionManager
    winners::Winners
end

function Table(;
    players::Tuple,
    deck = ordered_deck(),
    players_sitting_out = (),
    cards = nothing,
    blinds = Blinds(),
    pot = Float64(0),
    state = PreFlop(),
    button_id = button_id(),
    current_raise_amt = Float64(0),
    transactions = nothing,
    winners = Winners(),
)
    players = map(enumerate(players)) do (i, player)
        @set player.id = i
    end
    players = Tuple(players)
    @assert all(player_id.(players) .≠ 0)
    if transactions == nothing
        transactions = TransactionManager(players)
    end
    return Table(deck,
        players,
        players_sitting_out,
        cards,
        blinds,
        pot,
        state,
        button_id,
        current_raise_amt,
        transactions,
        winners
    )
end

function Base.show(io::IO, table::Table, include_type = true)
    include_type && println(io, typeof(table))
    show(io, blinds(table), false)
    show(io, table.winners, false)
    println(io, "Button           = $(table.button_id)")
    println(io, "Pot              = $(table.transactions)")
    println(io, "All cards        = $(table.cards)")
    println(io, "Observed cards   = $(observed_cards(table))")
end

get_table_cards!(deck::PlayingCards.Deck) =
    Iterators.flatten(ntuple(i->pop!(deck, 1), 5)) |> collect |> Tuple
cards(table::Table) = table.cards
state(table::Table) = table.state

observed_cards(table::Table) = observed_cards(table, table.state)
observed_cards(table::Table, ::PreFlop) = ()
observed_cards(table::Table, ::Flop) = table.cards[1:3]
observed_cards(table::Table, ::Turn) = table.cards[1:4]
observed_cards(table::Table, ::River) = table.cards

state(table::Table) = table.state
players_at_table(table::Table) = table.players
all_checked_or_folded(table::Table) = all(map(x -> folded(x) || checked(x), players_at_table(table)))
all_all_in_or_folded(table::Table) = all(map(x -> folded(x) || all_in(x), players_at_table(table)))

blinds(table::Table) = table.blinds
function is_blind_call(table::Table, player::Player, amt = call_amount(table, player))
    pot_inv = pot_investment(player)
    @debug "amt = $amt, pot_investment(player) = $pot_inv"
    bb = blinds(table).big
    sb = blinds(table).small
    c1 = amt ≈ bb ≈ pot_inv || amt ≈ bb && pot_inv ≈ 0
    c2 = amt ≈ sb ≈ pot_inv || amt ≈ sb && pot_inv ≈ 0
    return c1 || c2
end

function reset_round_bank_rolls!(table::Table)
    players = players_at_table(table)
    for player in players
        player.round_bank_roll = bank_roll(player)
    end
end

function reset_round!(table::Table)
    players = players_at_table(table)
    for player in players
        player.checked = false
        folded(player) && continue
        player.action_required = true
        player.last_to_raise = false
        player.round_contribution = 0
    end
    table.current_raise_amt = 0
end

function set_state!(table::Table, state::AbstractGameState)
    table.state = state
end

function check_for_winner!(table::Table)
    players = players_at_table(table)
    n_players = length(players)
    table.winners.declared = count(folded.(players)) == n_players-1
    if table.winners.declared
        for player in players
            folded(player) && continue
            table.winners.players = player
        end
    end
end


#####
##### Circling the table
#####

"""
    move_button!(table::Table)

Move the button to the next player on
the table.
"""
function move_button!(table::Table)
    table.button_id = mod(table.button_id, length(table.players))+1
end

"""
    position(table, player::Player, relative)

Player position, given
 - `table` the table
 - `player` the player
 - `relative::Int = 0` the relative location to the player
"""
position(table, player::Player, relative=0) =
    mod(relative + player.id - 1, length(table.players))+1

"""
    circle_table(n_players, button_id, state)

Circle the table, starting from the `button_id`
which corresponds to `state = 1`.
 - `state` the global iteration state (starting from 1)
 - `n_players` the total number of players
 - `button_id` the dealer ID (from `1:n_players`)
"""
circle_table(n_players, button_id, state) =
    mod(state + button_id-2, n_players)+1

circle_table(table::Table, state) =
    circle_table(length(table.players), table.button_id, state)

small_blind(table::Table) = players_at_table(table)[circle_table(table, 2)]
big_blind(table::Table) = players_at_table(table)[circle_table(table, 3)]
first_to_act(table::Table) = players_at_table(table)[circle_table(table, 4)]

is_small_blind(table::Table, player::Player) = player.id == small_blind(table).id
is_big_blind(table::Table, player::Player) = player.id == big_blind(table).id
is_first_to_act(table::Table, player::Player) = player.id == first_to_act(table).id

blind_amount(table::Table, player::Player) =
    is_small_blind(table, player) ? blinds(table).small : blinds(table).big

any_actions_required(table::Table) = any(action_required.(players_at_table(table)))

abstract type TablePosition end
struct Button <: TablePosition end
struct SmallBlind <: TablePosition end
struct BigBlind <: TablePosition end
struct FirstToAct <: TablePosition end # (after BigBlind)

struct CircleTable{CircType,P}
    players::Tuple
    button_id::Int
    n_players::Int
    player::P
end

circle(table::Table, tp::TablePosition) =
    CircleTable{typeof(tp),Nothing}(table.players, table.button_id, length(table.players), nothing)

circle(table::Table, player::Player) =
    CircleTable{typeof(player),typeof(player)}(table.players, table.button_id, length(table.players), player)

Base.iterate(ct::CircleTable{Button}, state = 1) =
    (ct.players[circle_table(ct.n_players, ct.button_id, state)], state+1)

Base.iterate(ct::CircleTable{SmallBlind}, state = 2) =
    (ct.players[circle_table(ct.n_players, ct.button_id, state)], state+1)

Base.iterate(ct::CircleTable{BigBlind}, state = 3) =
    (ct.players[circle_table(ct.n_players, ct.button_id, state)], state+1)

Base.iterate(ct::CircleTable{FirstToAct}, state = 4) =
    (ct.players[circle_table(ct.n_players, ct.button_id, state)], state+1)

Base.iterate(ct::CircleTable{P}, state = 1) where {P <: Player} =
    (ct.players[circle_table(ct.n_players, ct.player.id, state)], state+1)

#####
##### Deal
#####

function deal!(table::Table, blinds::Blinds)
    players = players_at_table(table)
    @assert !any(player_id.(players) .== 0)
    shuffle!(table.deck)
    for (i, player) in enumerate(circle(table, SmallBlind()))
        player.cards = pop!(table.deck, 2)
        if is_small_blind(table, player) && bank_roll(player) ≤ blinds.small
            @info "$(name(player)) paid the small blind (all-in) and dealt cards: $(player.cards)"
            contribute!(table, player, bank_roll(player))
        elseif is_big_blind(table, player) && bank_roll(player) ≤ blinds.big
            @info "$(name(player)) paid the  big  blind (all-in) and dealt cards: $(player.cards)"
            contribute!(table, player, bank_roll(player))
        else
            if is_small_blind(table, player)
                @info "$(name(player)) paid the small blind and dealt cards: $(player.cards)"
                contribute!(table, player, blinds.small)
            elseif is_big_blind(table, player)
                @info "$(name(player)) paid the  big  blind and dealt cards: $(player.cards)"
                contribute!(table, player, blinds.big)
            else
                @info "$(name(player)) dealt (free) cards:                   $(player.cards)"
            end
        end
        i==length(players) && break
    end

    table.cards = get_table_cards!(table.deck)
    @info "Table cards dealt (face-down)."
end

function sit_down_or_sit_out!(table::Table)
    # TODO: What should happen to the button?
    all_players = (players_at_table(table)...,table.players_sitting_out...)
    sit_out_player = filter(collect(all_players)) do player
        so = player_option(table, player, SitDownSitOut()) isa SitOut
        so && @info "$(name(player)) sitting out."
        so
    end
    sit_out_ids = player_id.(sit_out_player)
    players_sitting_out = filter(player->player.id in sit_out_ids, collect(all_players))
    playing_players = filter(player->!(player.id in sit_out_ids), collect(all_players))

    table.players = Tuple(playing_players)
    # Reset player ids:
    for (i, player) in enumerate(table.players)
        @set player.id = i
    end
    table.players_sitting_out = Tuple(players_sitting_out)
end
