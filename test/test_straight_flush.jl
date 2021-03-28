@test NLH.rank((A♣, K♣, Q♣, J♣, 10♣)) == 1  #  Royal Flush
@test NLH.rank((K♣, Q♣, J♣, 10♣, 9♣)) == 2  #  King-High Straight Flush
@test NLH.rank((Q♣, J♣, 10♣, 9♣, 8♣)) == 3  #  Queen-High Straight Flush
@test NLH.rank((J♣, 10♣, 9♣, 8♣, 7♣)) == 4  #  Jack-High Straight Flush
@test NLH.rank((10♣, 9♣, 8♣, 7♣, 6♣)) == 5  #  Ten-High Straight Flush
@test NLH.rank((9♣, 8♣, 7♣, 6♣, 5♣)) == 6  #  Nine-High Straight Flush
@test NLH.rank((8♣, 7♣, 6♣, 5♣, 4♣)) == 7  #  Eight-High Straight Flush
@test NLH.rank((7♣, 6♣, 5♣, 4♣, 3♣)) == 8  #  Seven-High Straight Flush
@test NLH.rank((6♣, 5♣, 4♣, 3♣, 2♣)) == 9  #  Six-High Straight Flush
@test NLH.rank((5♣, 4♣, 3♣, 2♣, A♣)) == 10 #  Five-High Straight Flush
