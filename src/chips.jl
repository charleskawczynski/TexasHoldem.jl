# Borrowed from Ratios.jl

export SimpleRatio

struct SimpleRatio
    num::Int
    den::Int
end

Base.:(+)(x::Int, y::SimpleRatio) = SimpleRatio(x*y.den + y.num, y.den)
Base.:(-)(x::Int, y::SimpleRatio) = SimpleRatio(x*y.den - y.num, y.den)
Base.:(+)(x::SimpleRatio, y::SimpleRatio) =
    x.den == y.den ? SimpleRatio(x.num + y.num, x.den) :
    SimpleRatio(x.num*y.den + x.den*y.num, x.den*y.den)

Base.:(-)(x::SimpleRatio, y::SimpleRatio) =
    x.den == y.den ? SimpleRatio(x.num - y.num, x.den) :
    SimpleRatio(x.num*y.den - x.den*y.num, x.den*y.den)

Base.isless(x::SimpleRatio, y::SimpleRatio) =
    x.den == y.den ? isless(x.num, y.num) :
    isless(x.num * y.den, x.den * y.num)

Base.isless(x::Int, y::SimpleRatio) =
    1 == y.den ? isless(x, y.num) : isless(x * y.den, y.num)

Base.:(==)(x::SimpleRatio, y::SimpleRatio) = x.num*y.den == x.den*y.num
Base.:(==)(x::SimpleRatio, y::Int) = x.num == x.den*y
Base.:(==)(x::Int, y::SimpleRatio) = x*y.den == y.num

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
    frac::SimpleRatio
    function Chips(n::Int, frac::SimpleRatio)
        if frac ≥ 1
            whole = div(frac.num, frac.den)
            r = SimpleRatio(rem(frac.num, frac.den), frac.den)
            return new(n+whole, r)
        else
            return new(n, frac)
        end
    end
end

Chips(c::Chips) = c
Chips(n::Int) = Chips(n, SimpleRatio(0, 1))

Base.isless(a::Chips, b::Chips) = Base.isless(a.n+a.frac, b.n+b.frac)
Base.isless(a::Int, b::Chips) = Base.isless(a, b.n+b.frac)
Base.isless(a::Chips, b::Int) = Base.isless(a.n+a.frac, b)

Base.:(+)(a::Chips, b::Chips) = Chips(a.n+b.n, a.frac+b.frac)
Base.:(-)(a::Chips, b::Chips) = Chips(a.n-b.n, a.frac-b.frac)
Base.:(+)(a::Chips, b::Int) = Chips(a.n+b, a.frac)
Base.:(-)(a::Chips, b::Int) = Chips(a.n-b, a.frac)

Base.:(==)(x::Chips, y::Chips) = x.n == y.n && x.frac == y.frac
Base.:(==)(x::Chips, y::Int) = x.n == y && x.frac == 0
Base.:(==)(x::Int, y::Chips) = x == y.n && 0 == y.frac

Base.zero(::Type{Chips}) = Chips(0)
Base.zero(::Chips) = Chips(0)
