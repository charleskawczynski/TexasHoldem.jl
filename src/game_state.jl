"""
    GameState

The game state, can be any of:

 - `BettingComplete`
 - `HandOver`
 - `NextAction`

"""
EnumX.@enumx GameState begin
    BettingComplete = 1
    HandOver = 2
    NextAction = 3
end
