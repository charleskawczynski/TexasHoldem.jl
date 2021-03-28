#####
##### Hand eval methods
#####

up_type(::Type{NumberCard{N}}) where {N} = NumberCard{N+1}
up_type(::Type{NumberCard{10}}) = Jack
up_type(::Type{Jack}) = Queen
up_type(::Type{Queen}) = King
up_type(::Type{King}) = Ace
up_type(::Type{Ace}) = NumberCard{2}

dn_type(::Type{Ace}) = King
dn_type(::Type{King}) = Queen
dn_type(::Type{Queen}) = Jack
dn_type(::Type{Jack}) = NumberCard{10}
dn_type(::Type{NumberCard{N}}) where {N} = NumberCard{N-1}
dn_type(::Type{NumberCard{2}}) = Ace

recurse_up(card::Card) = recurse_up(typeof(card.rank))

# How far (0:12) are we from Ace?
recurse_up(::Type{Ace}, base) = base
recurse_up(::Type{T}, base=0) where {T} = recurse_up(up_type(T), base+1)

# How far (0:12) are we from Ace, excluding given type?
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Tmatch}, base) where {Tdiag, Tmatch} = base+1
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Titer} = Ace, base=0) where {Tdiag,Tmatch,Titer} =
    dist_to_ace_skip_diag(Tdiag, Tmatch, dn_type(Titer), base+1)
dist_to_ace_skip_diag(::Type{Tdiag}, ::Type{Tmatch}, ::Type{Tdiag}, base) where {Tdiag, Tmatch} =
    dist_to_ace_skip_diag(Tdiag, Tmatch, dn_type(Tdiag), base)

type_up(card::Card, n::Int) = type_up(typeof(card.rank), n)
type_dn(card::Card, n::Int) = type_dn(typeof(card.rank), n)

# Nth type up from T
type_up(::Type{T}, n::Int) where {T} = type_up(T, Val(n))
type_up(::Type{T}, ::Val{0}) where {T} = T
type_up(::Type{T}, ::Val{N}) where {T, N} = type_up(up_type(T), Val(N-1))

# Nth type down from T
type_dn(::Type{T}, n::Int) where {T} = type_dn(T, Val(n))
type_dn(::Type{T}, ::Val{0}) where {T} = T
type_dn(::Type{T}, ::Val{N}) where {T, N} = type_dn(dn_type(T), Val(N-1))

# Based on the enumeration of all 7,462 Five-Card Poker Hand Equivalence Classes

# Rotate inputs so that we can catch
# both A,5,4,3,2 and 5,4,3,2,A
rank(t::Tuple) = rank((t[5], t[1:4]...))
rank(v::Vector) = rank(Tuple(v))

#####
##### Rows 1:10 (Straight flush)
#####

for (i,R) in enumerate(typeof.(rank_list()[end:-1:1])[1:end-3])
@eval rank(::Tuple{
    Card{$R,S},
    Card{type_dn($R,1),S},
    Card{type_dn($R,2),S},
    Card{type_dn($R,3),S},
    Card{type_dn($R,4),S}
}) where {S} = $i
end

#####
##### Helpers
#####

# Fine jumps between Rows based on kickers
single_kicker_iter(::Type{T}, ::Type{T}) where {T} = error("single_kicker_iter oops!")
single_kicker_iter(::Type{Tb}, ::Type{Tk}) where {Tb,Tk} =
    dist_to_ace_skip_diag(Tb, Tk)

trips_base(::Type{Ace}) = 1610
trips_base(::Type{R}) where {R} = trips_base(Ace) + 66*recurse_up(R)

#####
##### Rows 11:166 (4 of a kind)
#####

# Course jumps between Rows 11:166
quads_base(::Type{Ace}) = 11
quads_base(::Type{R}) where {R} = quads_base(Ace) + 12*recurse_up(R)

rank(::Tuple{Card{R,S1},Card{R,S2},Card{R,S3},Card{R,S4},Card{RK,S5}}) where {R,RK,S1,S2,S3,S4,S5} =
    quads_base(R)-1+single_kicker_iter(R, RK)

#####
##### Rows 167:322 (full house)
#####

# Course jumps between Rows 167:322
full_house_base(::Type{Ace}) = 167
full_house_base(::Type{R}) where {R} = full_house_base(Ace) + 12*recurse_up(R)

rank(::Tuple{Card{R3,S1},Card{R3,S2},Card{R3,S3},Card{R2,S4},Card{R2,S5}}) where {R3,R2,S1,S2,S3,S4,S5} =
    full_house_base(R3)-1+single_kicker_iter(R3, R2)

#####
##### Rows 323:1599 (flush)
#####

# TODO: can/should we do this with fewer methods?

consecutive(tup) = all(ntuple(i->tup[i]+1==tup[i+1], 4))
function is_straight(cards)
    ranks = sort(collect(value.(rank_type.(cards))))
    ranks_low = sort(collect(low_value.(rank_type.(cards))))
    high_straight = consecutive(ranks)
    low_straight = consecutive(ranks_low)
    return low_straight || high_straight
end

let k = 1
    club_combos = combinations(filter(x->suit(x) isa Club, full_deck()), 5)
    sorted_club_combos = sort.(club_combos; by = x->value(x), rev=true)
    sorted_club_combos = sort(sorted_club_combos;
        by=x->begin
            vals = value.(x)
            sum(vals[1]*100000+vals[2]*10000+vals[3]*1000+vals[4]*100+vals[5])
        end,
        rev=true
    )
    for cards in sorted_club_combos
        R = rank.(cards)
        R1 = typeof(R[1])
        R2 = typeof(R[2])
        R3 = typeof(R[3])
        R4 = typeof(R[4])
        R5 = typeof(R[5])
        is_straight(cards) && continue
        @eval rank(::Tuple{
            Card{$R1,S},
            Card{$R2,S},
            Card{$R3,S},
            Card{$R4,S},
            Card{$R5,S}}) where {S} = 323+$k-1
        k+=1
    end
end


#####
##### Rows 1600:1609 (offsuit straight)
#####

for (i,R) in enumerate(typeof.(rank_list()[end:-1:1])[1:end-3])
@eval rank(::Tuple{
    Card{$R,S1},
    Card{type_dn($R,1),S2},
    Card{type_dn($R,2),S3},
    Card{type_dn($R,3),S4},
    Card{type_dn($R,4),S5}
}) where {R,S1,S2,S3,S4,S5} = 1600+$i-1
end

#####
##### Rows 1610:2467 (trips)
#####

rank(::Tuple{Card{R3,S1},Card{R3,S2},Card{R3,S3},Card{R1,S4},Card{R2,S5}}) where {R3,R1,R2,S1,S2,S3,S4,S5} =
    trips_base(R3)+double_kicker_iter(R3, R1, R2)

# TODO: can/should we do this with fewer methods?
let k = 1
    club_deck = filter(x->suit(x) isa Club, full_deck())
    club_kicker_combos = collect(combinations(club_deck, 2))
    sorted_club_kicker_combos = sort.(club_kicker_combos; by = x->value(x), rev=true)
    sorted_club_kicker_combos = sort(sorted_club_kicker_combos;
        by=x->begin
            vals = value.(x)
            sum(vals[1]*100+vals[2])
        end,
        rev=true
    )
    for rank_trips in sort(collect(rank_list()); by=x->value(x), rev=true)
        for kickers in sorted_club_kicker_combos
            R3 = typeof(rank_trips)
            Rks = rank.(kickers)
            Rk1 = typeof(Rks[1])
            Rk2 = typeof(Rks[2])
            Rk1 == R3 && continue
            Rk2 == R3 && continue
            @eval rank(::Tuple{
                Card{$R3,S1},
                Card{$R3,S2},
                Card{$R3,S3},
                Card{$Rk1,S4},
                Card{$Rk2,S5}}) where {S1,S2,S3,S4,S5,R3,Rk1,Rk2} = 1610+$k-1
            k+=1
        end
    end
end

#####
##### Rows 2468:3325 (two pair)
#####

# TODO: is there a better way?
let k = 1
    half_deck = filter(x->suit(x) isa Club || suit(x) isa Heart, full_deck())
    combos = collect(combinations(half_deck, 4))
    combos = sort.(combos; by = x->value(x), rev=true)
    two_pair_combos = filter(x->value(x[1])==value(x[2]) && value(x[3])==value(x[4]), combos)
    sorted_two_pair_combos = sort(two_pair_combos;
        by=x->begin
            vals = value.(x)
            sum(vals[1]*100+vals[3])
        end,
        rev=true
    )
    for rank_2_pair in sorted_two_pair_combos
        for kickers in sort(collect(rank_list()); by=x->value(x), rev=true)
            R1 = typeof(rank(rank_2_pair[1]))
            R2 = typeof(rank(rank_2_pair[3]))
            Rk = typeof(kickers)
            R1 == Rk && continue
            R2 == Rk && continue
            @eval rank(::Tuple{
                Card{$R1,S1},
                Card{$R1,S2},
                Card{$R2,S3},
                Card{$R2,S4},
                Card{$Rk,S5}}) where {S1,S2,S3,S4,S5,R1,R2,Rk} = 2468+$k-1
            k+=1
        end
    end
end

#####
##### Rows 3326:6185 (pair)
#####

let k = 1
    three_quarters_deck = filter(x->suit(x) isa Club, full_deck())
    combos = collect(combinations(three_quarters_deck, 3))
    combos = sort.(combos; by = x->value(x), rev=true)
    combos = sort(combos;
        by=x->begin
            vals = value.(x)
            sum(vals[1]*1000+vals[2]*100+vals[3])
        end,
        rev=true
    )

    for RP in typeof.(rank_list()[end:-1:1])
        for kickers in combos
            R1 = typeof(rank(kickers[1]))
            R2 = typeof(rank(kickers[2]))
            R3 = typeof(rank(kickers[3]))
            RP==R1 && continue
            RP==R2 && continue
            RP==R3 && continue
            @eval rank(::Tuple{
                Card{$RP,S1},
                Card{$RP,S2},
                Card{$R1,S3},
                Card{$R2,S4},
                Card{$R3,S5}}) where {S1,S2,S3,S4,S5,RP,R1,R2,R3} = 3326+$k-1
            k+=1
        end
    end
end

#####
##### Rows 6186:7462 (high card)
#####

let k = 1
    club_deck = filter(x->suit(x) isa Club, full_deck())
    combos = collect(combinations(club_deck, 5))
    combos = sort.(combos; by = x->value(x), rev=true)
    combos = sort(combos;
        by=x->begin
            vals = value.(x)
            sum(vals[1]*100000+vals[2]*10000+vals[3]*1000+vals[4]*100+vals[5])
        end,
        rev=true
    )

    for kickers in combos
        R1 = typeof(rank(kickers[1]))
        R2 = typeof(rank(kickers[2]))
        R3 = typeof(rank(kickers[3]))
        R4 = typeof(rank(kickers[4]))
        R5 = typeof(rank(kickers[5]))
        is_straight(kickers) && continue
        @eval rank(::Tuple{
            Card{$R1,S1},
            Card{$R2,S2},
            Card{$R3,S3},
            Card{$R4,S4},
            Card{$R5,S5}}) where {S1,S2,S3,S4,S5,R1,R2,R3,R4,R5} = 6186+$k-1
        k+=1
    end
end
