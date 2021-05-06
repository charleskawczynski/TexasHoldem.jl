#####
##### Table
#####

export Button, SmallBlind, BigBlind, FirstToAct
export Table
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

Base.@kwdef mutable struct Table
    deck::PlayingCards.Deck = ordered_deck()
    players::Tuple
    cards::Union{Nothing,Tuple{<:Card,<:Card,<:Card,<:Card,<:Card}} = nothing
    blinds::Blinds = Blinds()
    pot::Float64 = Float64(0)
    state::AbstractGameState = PreFlop()
    button_id::Int = button_id()
    current_raise_amt::Float64 = Float64(0)
    transactions::TransactionManager = TransactionManager(players)
    winners::Winners = Winners()
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

observed_cards(table::Table) = observed_cards(table, table.state)
observed_cards(table::Table, ::PreFlop) = ()
observed_cards(table::Table, ::Flop) = table.cards[1:3]
observed_cards(table::Table, ::Turn) = table.cards[1:4]
observed_cards(table::Table, ::River) = table.cards

players_at_table(table::Table) = table.players
all_checked_or_folded(table::Table) = all(map(player -> folded(player) || checked(player), players_at_table(table)))
all_all_in(table::Table) = all(all_in.(players_at_table(table)))

blinds(table::Table) = table.blinds

function reset_round!(table::Table)
    players = players_at_table(table)
    for player in players
        player.checked = false
        folded(player) && continue
        player.action_required = true
        player.last_to_raise = false
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
    shuffle!(table.deck)
    for (i, player) in enumerate(circle(table, SmallBlind()))
        po = player_option(player, PayBlindSitOut())
        if po isa SitOut
            player.folded = true
            player.sat_out = true
            @info "$(name(player)) sat out a hand."
            check_for_winner!(table)
        elseif po isa PayBlind
            if player.id == small_blind(table).id && bank_roll(player) ≤ blinds.small
                player.cards = pop!(table.deck, 2)
                player.all_in = true
                @info "$(name(player)) paid the small blind (all-in) and dealt cards: $(player.cards)"
                contribute!(table, player, bank_roll(player))
            elseif player.id == big_blind(table).id && bank_roll(player) ≤ blinds.big
                player.cards = pop!(table.deck, 2)
                player.all_in = true
                @info "$(name(player)) paid the  big  blind (all-in) and dealt cards: $(player.cards)"
                contribute!(table, player, bank_roll(player))
            else
                player.cards = pop!(table.deck, 2)
                if player.id == small_blind(table).id
                    @info "$(name(player)) paid the small blind and dealt cards: $(player.cards)"
                    contribute!(table, player, blinds.small)
                elseif player.id == big_blind(table).id
                    @info "$(name(player)) paid the  big  blind and dealt cards: $(player.cards)"
                    contribute!(table, player, blinds.big)
                else
                    @info "$(name(player)) dealt (free) cards:                   $(player.cards)"
                end
            end
        else
            error("Uncaught case")
        end
        i==length(players) && break
    end

    table.cards = get_table_cards!(table.deck)
    @info "Table cards dealt (face-down)."
end

