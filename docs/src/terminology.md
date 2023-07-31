# Terminology

This page outlines some of the terminology that TexasHoldem.jl uses:

 - **Hand:** a set of 5-7 cards a player has, between their own cards and the community (table) cards.
 - **Player:** the people, or agents, playing in a hand
 - **Game:** players are dealt cards, bet, and winners of that hand are declared. Tournaments are comprised of N-players who play consecutive games until they lose all their chips.
 - **Round:** a game segment when betting is performed (`preflop`, `flop`, `turn`, and `river`)
 - **Action:** an action refers to `check`-ing, `fold`-ing, `call`-ing or `raise`-ing.
 - **Option:** the set of allowable actions that a player can choose from, given the situation during a round. For example, if a player is being raised all in, they may only call or fold.
 - **Bank roll:** the chips that a player has on the table, available for betting.
 - **Action line**: a sequence of actions during the round
 - **Reward**: a player's profit after a game (their bank roll after - their bank roll before the game).
