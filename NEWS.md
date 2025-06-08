TexasHoldem.jl Release Notes
============================

main
-------

v0.5.0
-------
 - `player_option` was renamed to `get_action`
 - bug fixes were applied (minimum bet size is now the big blind)
 - Support for `play_to_options!` was added, which allows users to easily call
   TexasHoldem.jl in a client-server (or ML) setting.
 - Documentation was added clarifying the distinction between `Raise`
   (now temporarily unsupported) and `RaiseTo(game, amt)`, which raises to
   the amount `amt` _above_ the current total bet.
 - If you have an issue upgrading from v0.4.4, please open an issue.

v0.4.4
-------

