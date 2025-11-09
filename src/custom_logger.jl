#=
Custom logging was added so type-unstable logging
functions in the Logging infrastructure is elided.
=#
import Logging

struct HumanReadableMessageCollector <: Logging.AbstractLogger
    messages::Vector{String}
    min_level::Logging.LogLevel
    send_to_stdout::Bool
    prepend_msg::String
end

HumanReadableMessageCollector(min_level=Logging.Info; send_to_stdout = true, prepend_msg) =
    HumanReadableMessageCollector([], min_level, send_to_stdout, prepend_msg)

function Logging.handle_message(logger::HumanReadableMessageCollector, level, message, _module, group, id, file, line; kwargs...)
    push!(logger.messages, message)
    if logger.min_level == Logging.Debug
        logger.send_to_stdout && printstyled(logger.prepend_msg; color = :light_red, bold = true)
    else
        logger.send_to_stdout && printstyled(logger.prepend_msg; color = :light_cyan, bold = true)
    end
    logger.send_to_stdout && println(message)
    nothing
end

Logging.min_enabled_level(logger::HumanReadableMessageCollector) = logger.min_level
Logging.shouldlog(logger::HumanReadableMessageCollector, level, _module, group, id) = true
Logging.catch_exceptions(logger::HumanReadableMessageCollector) = false


"""
    EventCode

Event code for machine-friendly logging. See docs for more info.
"""
@enum EventCode begin
    CodeSetPlayerInitialStack = -1
    CodeSetBlinds = -2
    CodeDealHoleCards = -3
    CodePlayerAction = -4
    CodeDealFlop = -5
    CodeDealTurn = -6
    CodeDealRiver = -7
    CodeWinnings = -8
end

"""
    ActionCode

Action code for machine-friendly logging. See docs for more info.
"""
@enum ActionCode begin
    CodeFold = 1
    CodeCheck = 2
    CodeCall = 3
    CodeRaiseTo = 4
    CodeAllIn = 5
end

struct EventCodeCollector <: Logging.AbstractLogger
    messages::Vector{Vector{Int}}
    min_level::Logging.LogLevel
    send_to_stdout::Bool
    prepend_msg::String
end
EventCodeCollector(min_level=Logging.Info; send_to_stdout = false, prepend_msg) =
    EventCodeCollector([], min_level, send_to_stdout, prepend_msg)

function Logging.handle_message(logger::EventCodeCollector, level, message, _module, group, id, file, line; kwargs...)
    push!(logger.messages, message)
    if logger.min_level == Logging.Debug
        logger.send_to_stdout && printstyled(logger.prepend_msg; color = :light_green, bold = true)
    else
        logger.send_to_stdout && printstyled(logger.prepend_msg; color = :light_green, bold = true)
    end
    logger.send_to_stdout && println(message)
    nothing
end

Logging.min_enabled_level(logger::EventCodeCollector) = logger.min_level
Logging.shouldlog(logger::EventCodeCollector, level, _module, group, id) = true
Logging.catch_exceptions(logger::EventCodeCollector) = false

Base.@kwdef struct DebugLogger{MC,ECC}
    msg_collector::MC = HumanReadableMessageCollector(Logging.Debug; prepend_msg="GAME_LOG: ")
    event_code_collector::ECC = EventCodeCollector(Logging.Debug; prepend_msg="EVENT_CODE: ")
end
Base.@kwdef struct InfoLogger{MC,ECC}
    msg_collector::MC = HumanReadableMessageCollector(Logging.Info; prepend_msg="GAME_LOG: ")
    event_code_collector::ECC = EventCodeCollector(Logging.Info; prepend_msg="EVENT_CODE: ")
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

macro log_event_code(logger, expr)
    return quote
        if !($(esc(logger)) isa ByPassLogger)
            Logging.with_logger($(esc(logger)).event_code_collector) do
                @info $(esc(expr))
            end
        end
    end
end
