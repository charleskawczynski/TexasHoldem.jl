"""
    RoundState

The round state, can be any of:
 - `Preflop`
 - `Flop`
 - `Turn`
 - `River`
"""
EnumX.@enumx RoundState begin
    Preflop
    Flop
    Turn
    River
end
