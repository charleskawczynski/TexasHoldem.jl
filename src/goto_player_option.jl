abstract type AbstractGamePoint end
struct StartOfGame <: AbstractGamePoint end
struct PlayerOption{P, R, A} <: AbstractGamePoint
    player::P
    round::R
    action::A
end

struct StartFrom{GP}
    game_point::GP
end

