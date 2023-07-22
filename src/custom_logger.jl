#=
Custom logging was added so type-unstable logging
functions in the Logging infrastructure is elided.
=#
import Logging

struct DebugLogger end
struct InfoLogger end
struct ByPassLogger end

macro cdebug(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            @debug $(esc(expr))
        end
    end
end

macro cwarn(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            @warn $(esc(expr))
        end
    end
end

macro cerror(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            @error $(esc(expr))
        end
    end
end

macro cinfo(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            @info $(esc(expr))
        end
    end
end
