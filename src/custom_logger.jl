#=
Custom logging was added so type-unstable logging
functions in the Logging infrastructure is elided.
=#
import Logging

struct MessageCollectorLogger <: Logging.AbstractLogger
    messages::Vector{String}
    min_level::Logging.LogLevel
    forward_info::Bool
    prepend_msg::String
end

MessageCollectorLogger(min_level=Logging.Info, forward_info = true; prepend_msg) =
    MessageCollectorLogger([], min_level, forward_info, prepend_msg)

function Logging.handle_message(logger::MessageCollectorLogger, level, message, _module, group, id, file, line; kwargs...)
    push!(logger.messages, message)
    if logger.min_level == Logging.Debug
        logger.forward_info && printstyled(logger.prepend_msg; color = :light_red, bold = true)
    else
        logger.forward_info && printstyled(logger.prepend_msg; color = :light_cyan, bold = true)
    end
    logger.forward_info && println(message)
    nothing
end

Logging.min_enabled_level(logger::MessageCollectorLogger) = logger.min_level
Logging.shouldlog(logger::MessageCollectorLogger, level, _module, group, id) = true
Logging.catch_exceptions(logger::MessageCollectorLogger) = false

Base.@kwdef struct DebugLogger{T}
    msg_collector::T = MessageCollectorLogger(Logging.Debug; prepend_msg="GAME_LOG: ")
end
Base.@kwdef struct InfoLogger{T}
    msg_collector::T = MessageCollectorLogger(Logging.Info; prepend_msg="GAME_LOG: ")
end
struct ByPassLogger end

macro cdebug(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            Logging.with_logger($(esc(logger)).msg_collector) do
                @debug $(esc(expr))
            end
        end
    end
end

macro cwarn(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            Logging.with_logger($(esc(logger)).msg_collector) do
                @warn $(esc(expr))
            end
        end
    end
end

macro cerror(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            Logging.with_logger($(esc(logger)).msg_collector) do
                @error $(esc(expr))
            end
        end
    end
end

macro cinfo(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            Logging.with_logger($(esc(logger)).msg_collector) do
                @info $(esc(expr))
            end
        end
    end
end
