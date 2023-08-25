"""
    Chips(n, frac)

A stack of chips struct. This type is
backed by `Int`s and performs exact
arithmetic operations by using Rational
numbers to track remainders (fractions
of a chip). `frac` is always internally
stored as less than 1.

Players can only bet/call with whole
chips (`n`), and are not allowed to
bet/call with a fraction of a chip.

We track the fractions of chips so that
we can assert exact money conservation
on the table until a player busts, at which
point, that money is lost.
"""
struct Chips
    n::Int
    frac::Rational{Int}
    function Chips(n::Int, frac::Rational)
        if frac ≥ 1
            whole = div(frac.num, frac.den)
            r = Rational(rem(frac.num, frac.den), frac.den)
            return new(n+whole, r)
        else
            return new(n, frac)
        end
    end
end

Chips(c::Chips) = c
Chips(n::Int) = Chips(n, Rational(0))

Base.isless(a::Chips, b::Chips) = Base.isless(a.n+a.frac, b.n+b.frac)
Base.isless(a::Int, b::Chips) = Base.isless(a, b.n+b.frac)
Base.isless(a::Chips, b::Int) = Base.isless(a.n+a.frac, b)

Base.:(+)(a::Chips, b::Chips) = Chips(a.n+b.n, a.frac+b.frac)
Base.:(-)(a::Chips, b::Chips) = Chips(a.n-b.n, a.frac-b.frac)
Base.:(+)(a::Chips, b::Int) = Chips(a.n+b, a.frac)
Base.:(-)(a::Chips, b::Int) = Chips(a.n-b, a.frac)

Base.zero(::Type{Chips}) = Chips(0)
Base.zero(::Chips) = Chips(0)
