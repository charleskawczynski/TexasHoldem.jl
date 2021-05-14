#####
##### Tester bots
#####

const AGS = AbstractGameState

##### BotCheckFold
struct BotCheckFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckFold}, ::AGS, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallRaiseFold) = fold!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallAllInFold) = fold!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckFold}, ::AGS, ::CallFold) = fold!(game, player)

##### BotCheckCall
struct BotCheckCall <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AGS, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCheckCall}, ::AGS, ::CallFold) = call!(game, player)

##### BotFlopRaise
struct BotFlopRaise <: AbstractAI end
# Call blind / check pre-flop, raise on flop

TH.player_option!(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CheckRaiseFold) = check!(game, player)
TH.player_option!(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallAllInFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotFlopRaise}, ::AGS, ::CallFold) = call!(game, player)

TH.player_option!(game::Game, player::Player{BotFlopRaise}, ::Flop, ::CheckRaiseFold) = raise_to!(game, player, bank_roll(player)/2)

##### BotRaiseAllIn
struct BotRaiseAllIn <: AbstractAI end
# Call blind / check pre-flop, raise on flop

TH.player_option!(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CheckRaiseFold) = raise_all_in!(game, player)
TH.player_option!(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CallRaiseFold) = raise_all_in!(game, player)
TH.player_option!(game::Game, player::Player{BotRaiseAllIn}, ::AGS, ::CallAllInFold) = raise_all_in!(game, player)

##### BotRaiseAlmostAllIn
struct BotRaiseAlmostAllIn <: AbstractAI end
# Call blind / check pre-flop, raise on flop

TH.player_option!(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CheckRaiseFold) = raise_to!(game, player, 0.9*round_bank_roll(player))
TH.player_option!(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CallRaiseFold) = raise_to!(game, player, 0.9*round_bank_roll(player))
TH.player_option!(game::Game, player::Player{BotRaiseAlmostAllIn}, ::AGS, ::CallAllInFold) = raise_to!(game, player, 0.9*round_bank_roll(player))

##### BotBetSB
struct BotBetSB <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotBetSB}, ::AGS, ::CheckRaiseFold) = raise_to!(game, player, TH.blinds(game).small)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::PreFlop, ::CheckRaiseFold) = raise_to!(game, player, TH.blinds(game).small)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::AGS, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotBetSB}, ::AGS, ::CallFold) = call!(game, player)

##### BotBetBB
struct BotBetBB <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotBetBB}, ::PreFlop, ::CheckRaiseFold) = raise_to!(game, player, 2*TH.blinds(game).big)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AGS, ::CheckRaiseFold) = raise_to!(game, player, TH.blinds(game).big)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AGS, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotBetBB}, ::AGS, ::CallFold) = call!(game, player)

##### BotCheckOnCallRaiseFold
struct BotCheckOnCallRaiseFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckOnCallRaiseFold}, ::AGS, ::CallRaiseFold) = check!(game, player)

##### BotCheckOnCallAllInFold
struct BotCheckOnCallAllInFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckOnCallAllInFold}, ::AGS, ::CallAllInFold) = check!(game, player)

##### BotCheckOnCallFold
struct BotCheckOnCallFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCheckOnCallFold}, ::AGS, ::CallFold) = check!(game, player)

##### BotCallOnCheckRaiseFold
struct BotCallOnCheckRaiseFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotCallOnCheckRaiseFold}, ::PreFlop, ::CallRaiseFold) = call!(game, player)
TH.player_option!(game::Game, player::Player{BotCallOnCheckRaiseFold}, ::AGS, ::CheckRaiseFold) = call!(game, player)

##### BotRaiseOnCallFold
struct BotRaiseOnCallFold <: AbstractAI end

TH.player_option!(game::Game, player::Player{BotRaiseOnCallFold}, ::AGS, ::CallFold) = raise_to!(game, player, bank_roll(player))
