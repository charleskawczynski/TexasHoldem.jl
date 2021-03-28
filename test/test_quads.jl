@test NLH.rank((A♣, A♡, A♢, A♠, K♠)) == 11 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, Q♠)) == 12 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, J♠)) == 13 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 10♠)) == 14 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 9♠)) == 15 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 8♠)) == 16 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 7♠)) == 17 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 6♠)) == 18 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 5♠)) == 19 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 4♠)) == 20 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 3♠)) == 21 # Four Aces
@test NLH.rank((A♣, A♡, A♢, A♠, 2♠)) == 22 # Four Aces
@test NLH.rank((K♣, K♡, K♢, K♠, A♠)) == 23 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, Q♠)) == 24 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, J♠)) == 25 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 10♠)) == 26 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 9♠)) == 27 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 8♠)) == 28 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 7♠)) == 29 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 6♠)) == 30 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 5♠)) == 31 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 4♠)) == 32 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 3♠)) == 33 # Four Kings
@test NLH.rank((K♣, K♡, K♢, K♠, 2♠)) == 34 # Four Kings
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, A♠)) == 35 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, K♠)) == 36 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, J♠)) == 37 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 10♠)) == 38 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 9♠)) == 39 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 8♠)) == 40 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 7♠)) == 41 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 6♠)) == 42 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 5♠)) == 43 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 4♠)) == 44 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 3♠)) == 45 # Four Queens
@test NLH.rank((Q♣, Q♡, Q♢, Q♠, 2♠)) == 46 # Four Queens
@test NLH.rank((J♣, J♡, J♢, J♠, A♠)) == 47 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, K♠)) == 48 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, Q♠)) == 49 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 10♠)) == 50 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 9♠)) == 51 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 8♠)) == 52 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 7♠)) == 53 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 6♠)) == 54 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 5♠)) == 55 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 4♠)) == 56 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 3♠)) == 57 # Four Jacks
@test NLH.rank((J♣, J♡, J♢, J♠, 2♠)) == 58 # Four Jacks
@test NLH.rank((10♣, 10♡, 10♢, 10♠, A♠)) == 59 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, K♠)) == 60 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, Q♠)) == 61 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, J♠)) == 62 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 9♠)) == 63 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 8♠)) == 64 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 7♠)) == 65 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 6♠)) == 66 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 5♠)) == 67 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 4♠)) == 68 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 3♠)) == 69 # Four Tens
@test NLH.rank((10♣, 10♡, 10♢, 10♠, 2♠)) == 70 # Four Tens
@test NLH.rank((9♣, 9♡, 9♢, 9♠, A♠)) == 71 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, K♠)) == 72 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, Q♠)) == 73 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, J♠)) == 74 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 10♠)) == 75 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 8♠)) == 76 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 7♠)) == 77 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 6♠)) == 78 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 5♠)) == 79 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 4♠)) == 80 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 3♠)) == 81 # Four Nines
@test NLH.rank((9♣, 9♡, 9♢, 9♠, 2♠)) == 82 # Four Nines
@test NLH.rank((8♣, 8♡, 8♢, 8♠, A♠)) == 83 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, K♠)) == 84 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, Q♠)) == 85 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, J♠)) == 86 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 10♠)) == 87 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 9♠)) == 88 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 7♠)) == 89 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 6♠)) == 90 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 5♠)) == 91 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 4♠)) == 92 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 3♠)) == 93 # Four Eights
@test NLH.rank((8♣, 8♡, 8♢, 8♠, 2♠)) == 94 # Four Eights
@test NLH.rank((7♣, 7♡, 7♢, 7♠, A♠)) == 95 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, K♠)) == 96 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, Q♠)) == 97 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, J♠)) == 98 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 10♠)) == 99 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 9♠)) == 100 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 8♠)) == 101 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 6♠)) == 102 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 5♠)) == 103 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 4♠)) == 104 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 3♠)) == 105 # Four Sevens
@test NLH.rank((7♣, 7♡, 7♢, 7♠, 2♠)) == 106 # Four Sevens
@test NLH.rank((6♣, 6♡, 6♢, 6♠, A♠)) == 107 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, K♠)) == 108 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, Q♠)) == 109 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, J♠)) == 110 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 10♠)) == 111 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 9♠)) == 112 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 8♠)) == 113 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 7♠)) == 114 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 5♠)) == 115 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 4♠)) == 116 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 3♠)) == 117 # Four Sixes
@test NLH.rank((6♣, 6♡, 6♢, 6♠, 2♠)) == 118 # Four Sixes
@test NLH.rank((5♣, 5♡, 5♢, 5♠, A♠)) == 119 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, K♠)) == 120 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, Q♠)) == 121 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, J♠)) == 122 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 10♠)) == 123 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 9♠)) == 124 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 8♠)) == 125 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 7♠)) == 126 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 6♠)) == 127 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 4♠)) == 128 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 3♠)) == 129 # Four Fives
@test NLH.rank((5♣, 5♡, 5♢, 5♠, 2♠)) == 130 # Four Fives
@test NLH.rank((4♣, 4♡, 4♢, 4♠, A♠)) == 131 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, K♠)) == 132 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, Q♠)) == 133 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, J♠)) == 134 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 10♠)) == 135 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 9♠)) == 136 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 8♠)) == 137 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 7♠)) == 138 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 6♠)) == 139 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 5♠)) == 140 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 3♠)) == 141 # Four Fours
@test NLH.rank((4♣, 4♡, 4♢, 4♠, 2♠)) == 142 # Four Fours
@test NLH.rank((3♣, 3♡, 3♢, 3♠, A♠)) == 143 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, K♠)) == 144 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, Q♠)) == 145 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, J♠)) == 146 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 10♠)) == 147 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 9♠)) == 148 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 8♠)) == 149 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 7♠)) == 150 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 6♠)) == 151 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 5♠)) == 152 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 4♠)) == 153 # Four Treys
@test NLH.rank((3♣, 3♡, 3♢, 3♠, 2♠)) == 154 # Four Treys
@test NLH.rank((2♣, 2♡, 2♢, 2♠, A♠)) == 155 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, K♠)) == 156 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, Q♠)) == 157 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, J♠)) == 158 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 10♠)) == 159 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 9♠)) == 160 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 8♠)) == 161 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 7♠)) == 162 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 6♠)) == 163 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 5♠)) == 164 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 4♠)) == 165 # Four Deuces
@test NLH.rank((2♣, 2♡, 2♢, 2♠, 3♠)) == 166 # Four Deuces
@test NLH.rank((A♣, A♡, A♢, K♠, K♠)) == 167 # Aces Full over Kings
@test NLH.rank((A♣, A♡, A♢, Q♠, Q♠)) == 168 # Aces Full over Queens
@test NLH.rank((A♣, A♡, A♢, J♠, J♠)) == 169 # Aces Full over Jacks
@test NLH.rank((A♣, A♡, A♢, 10♠, 10♠)) == 170 # Aces Full over Tens
@test NLH.rank((A♣, A♡, A♢, 9♠, 9♠)) == 171 # Aces Full over Nines
@test NLH.rank((A♣, A♡, A♢, 8♠, 8♠)) == 172 # Aces Full over Eights
@test NLH.rank((A♣, A♡, A♢, 7♠, 7♠)) == 173 # Aces Full over Sevens
@test NLH.rank((A♣, A♡, A♢, 6♠, 6♠)) == 174 # Aces Full over Sixes
@test NLH.rank((A♣, A♡, A♢, 5♠, 5♠)) == 175 # Aces Full over Fives
@test NLH.rank((A♣, A♡, A♢, 4♠, 4♠)) == 176 # Aces Full over Fours
@test NLH.rank((A♣, A♡, A♢, 3♠, 3♠)) == 177 # Aces Full over Treys
@test NLH.rank((A♣, A♡, A♢, 2♠, 2♠)) == 178 # Aces Full over Deuces
@test NLH.rank((K♣, K♡, K♢, A♠, A♠)) == 179 # Kings Full over Aces
@test NLH.rank((K♣, K♡, K♢, Q♠, Q♠)) == 180 # Kings Full over Queens
@test NLH.rank((K♣, K♡, K♢, J♠, J♠)) == 181 # Kings Full over Jacks
@test NLH.rank((K♣, K♡, K♢, 10♠, 10♠)) == 182 # Kings Full over Tens
@test NLH.rank((K♣, K♡, K♢, 9♠, 9♠)) == 183 # Kings Full over Nines
@test NLH.rank((K♣, K♡, K♢, 8♠, 8♠)) == 184 # Kings Full over Eights
@test NLH.rank((K♣, K♡, K♢, 7♠, 7♠)) == 185 # Kings Full over Sevens
@test NLH.rank((K♣, K♡, K♢, 6♠, 6♠)) == 186 # Kings Full over Sixes
@test NLH.rank((K♣, K♡, K♢, 5♠, 5♠)) == 187 # Kings Full over Fives
@test NLH.rank((K♣, K♡, K♢, 4♠, 4♠)) == 188 # Kings Full over Fours
@test NLH.rank((K♣, K♡, K♢, 3♠, 3♠)) == 189 # Kings Full over Treys
@test NLH.rank((K♣, K♡, K♢, 2♠, 2♠)) == 190 # Kings Full over Deuces
@test NLH.rank((Q♣, Q♡, Q♢, A♠, A♠)) == 191 # Queens Full over Aces
@test NLH.rank((Q♣, Q♡, Q♢, K♠, K♠)) == 192 # Queens Full over Kings
@test NLH.rank((Q♣, Q♡, Q♢, J♠, J♠)) == 193 # Queens Full over Jacks
@test NLH.rank((Q♣, Q♡, Q♢, 10♠, 10♠)) == 194 # Queens Full over Tens
@test NLH.rank((Q♣, Q♡, Q♢, 9♠, 9♠)) == 195 # Queens Full over Nines
@test NLH.rank((Q♣, Q♡, Q♢, 8♠, 8♠)) == 196 # Queens Full over Eights
@test NLH.rank((Q♣, Q♡, Q♢, 7♠, 7♠)) == 197 # Queens Full over Sevens
@test NLH.rank((Q♣, Q♡, Q♢, 6♠, 6♠)) == 198 # Queens Full over Sixes
@test NLH.rank((Q♣, Q♡, Q♢, 5♠, 5♠)) == 199 # Queens Full over Fives
@test NLH.rank((Q♣, Q♡, Q♢, 4♠, 4♠)) == 200 # Queens Full over Fours
@test NLH.rank((Q♣, Q♡, Q♢, 3♠, 3♠)) == 201 # Queens Full over Treys
@test NLH.rank((Q♣, Q♡, Q♢, 2♠, 2♠)) == 202 # Queens Full over Deuces
@test NLH.rank((J♣, J♡, J♢, A♠, A♠)) == 203 # Jacks Full over Aces
@test NLH.rank((J♣, J♡, J♢, K♠, K♠)) == 204 # Jacks Full over Kings
@test NLH.rank((J♣, J♡, J♢, Q♠, Q♠)) == 205 # Jacks Full over Queens
@test NLH.rank((J♣, J♡, J♢, 10♠, 10♠)) == 206 # Jacks Full over Tens
@test NLH.rank((J♣, J♡, J♢, 9♠, 9♠)) == 207 # Jacks Full over Nines
@test NLH.rank((J♣, J♡, J♢, 8♠, 8♠)) == 208 # Jacks Full over Eights
@test NLH.rank((J♣, J♡, J♢, 7♠, 7♠)) == 209 # Jacks Full over Sevens
@test NLH.rank((J♣, J♡, J♢, 6♠, 6♠)) == 210 # Jacks Full over Sixes
@test NLH.rank((J♣, J♡, J♢, 5♠, 5♠)) == 211 # Jacks Full over Fives
@test NLH.rank((J♣, J♡, J♢, 4♠, 4♠)) == 212 # Jacks Full over Fours
@test NLH.rank((J♣, J♡, J♢, 3♠, 3♠)) == 213 # Jacks Full over Treys
@test NLH.rank((J♣, J♡, J♢, 2♠, 2♠)) == 214 # Jacks Full over Deuces
@test NLH.rank((10♣, 10♡, 10♢, A♠, A♠)) == 215 # Tens Full over Aces
@test NLH.rank((10♣, 10♡, 10♢, K♠, K♠)) == 216 # Tens Full over Kings
@test NLH.rank((10♣, 10♡, 10♢, Q♠, Q♠)) == 217 # Tens Full over Queens
@test NLH.rank((10♣, 10♡, 10♢, J♠, J♠)) == 218 # Tens Full over Jacks
@test NLH.rank((10♣, 10♡, 10♢, 9♠, 9♠)) == 219 # Tens Full over Nines
@test NLH.rank((10♣, 10♡, 10♢, 8♠, 8♠)) == 220 # Tens Full over Eights
@test NLH.rank((10♣, 10♡, 10♢, 7♠, 7♠)) == 221 # Tens Full over Sevens
@test NLH.rank((10♣, 10♡, 10♢, 6♠, 6♠)) == 222 # Tens Full over Sixes
@test NLH.rank((10♣, 10♡, 10♢, 5♠, 5♠)) == 223 # Tens Full over Fives
@test NLH.rank((10♣, 10♡, 10♢, 4♠, 4♠)) == 224 # Tens Full over Fours
@test NLH.rank((10♣, 10♡, 10♢, 3♠, 3♠)) == 225 # Tens Full over Treys
@test NLH.rank((10♣, 10♡, 10♢, 2♠, 2♠)) == 226 # Tens Full over Deuces
@test NLH.rank((9♣, 9♡, 9♢, A♠, A♠)) == 227 # Nines Full over Aces
@test NLH.rank((9♣, 9♡, 9♢, K♠, K♠)) == 228 # Nines Full over Kings
@test NLH.rank((9♣, 9♡, 9♢, Q♠, Q♠)) == 229 # Nines Full over Queens
@test NLH.rank((9♣, 9♡, 9♢, J♠, J♠)) == 230 # Nines Full over Jacks
@test NLH.rank((9♣, 9♡, 9♢, 10♠, 10♠)) == 231 # Nines Full over Tens
@test NLH.rank((9♣, 9♡, 9♢, 8♠, 8♠)) == 232 # Nines Full over Eights
@test NLH.rank((9♣, 9♡, 9♢, 7♠, 7♠)) == 233 # Nines Full over Sevens
@test NLH.rank((9♣, 9♡, 9♢, 6♠, 6♠)) == 234 # Nines Full over Sixes
@test NLH.rank((9♣, 9♡, 9♢, 5♠, 5♠)) == 235 # Nines Full over Fives
@test NLH.rank((9♣, 9♡, 9♢, 4♠, 4♠)) == 236 # Nines Full over Fours
@test NLH.rank((9♣, 9♡, 9♢, 3♠, 3♠)) == 237 # Nines Full over Treys
@test NLH.rank((9♣, 9♡, 9♢, 2♠, 2♠)) == 238 # Nines Full over Deuces
@test NLH.rank((8♣, 8♡, 8♢, A♠, A♠)) == 239 # Eights Full over Aces
@test NLH.rank((8♣, 8♡, 8♢, K♠, K♠)) == 240 # Eights Full over Kings
@test NLH.rank((8♣, 8♡, 8♢, Q♠, Q♠)) == 241 # Eights Full over Queens
@test NLH.rank((8♣, 8♡, 8♢, J♠, J♠)) == 242 # Eights Full over Jacks
@test NLH.rank((8♣, 8♡, 8♢, 10♠, 10♠)) == 243 # Eights Full over Tens
@test NLH.rank((8♣, 8♡, 8♢, 9♠, 9♠)) == 244 # Eights Full over Nines
@test NLH.rank((8♣, 8♡, 8♢, 7♠, 7♠)) == 245 # Eights Full over Sevens
@test NLH.rank((8♣, 8♡, 8♢, 6♠, 6♠)) == 246 # Eights Full over Sixes
@test NLH.rank((8♣, 8♡, 8♢, 5♠, 5♠)) == 247 # Eights Full over Fives
@test NLH.rank((8♣, 8♡, 8♢, 4♠, 4♠)) == 248 # Eights Full over Fours
@test NLH.rank((8♣, 8♡, 8♢, 3♠, 3♠)) == 249 # Eights Full over Treys
@test NLH.rank((8♣, 8♡, 8♢, 2♠, 2♠)) == 250 # Eights Full over Deuces
@test NLH.rank((7♣, 7♡, 7♢, A♠, A♠)) == 251 # Sevens Full over Aces
@test NLH.rank((7♣, 7♡, 7♢, K♠, K♠)) == 252 # Sevens Full over Kings
@test NLH.rank((7♣, 7♡, 7♢, Q♠, Q♠)) == 253 # Sevens Full over Queens
@test NLH.rank((7♣, 7♡, 7♢, J♠, J♠)) == 254 # Sevens Full over Jacks
@test NLH.rank((7♣, 7♡, 7♢, 10♠, 10♠)) == 255 # Sevens Full over Tens
@test NLH.rank((7♣, 7♡, 7♢, 9♠, 9♠)) == 256 # Sevens Full over Nines
@test NLH.rank((7♣, 7♡, 7♢, 8♠, 8♠)) == 257 # Sevens Full over Eights
@test NLH.rank((7♣, 7♡, 7♢, 6♠, 6♠)) == 258 # Sevens Full over Sixes
@test NLH.rank((7♣, 7♡, 7♢, 5♠, 5♠)) == 259 # Sevens Full over Fives
@test NLH.rank((7♣, 7♡, 7♢, 4♠, 4♠)) == 260 # Sevens Full over Fours
@test NLH.rank((7♣, 7♡, 7♢, 3♠, 3♠)) == 261 # Sevens Full over Treys
@test NLH.rank((7♣, 7♡, 7♢, 2♠, 2♠)) == 262 # Sevens Full over Deuces
@test NLH.rank((6♣, 6♡, 6♢, A♠, A♠)) == 263 # Sixes Full over Aces
@test NLH.rank((6♣, 6♡, 6♢, K♠, K♠)) == 264 # Sixes Full over Kings
@test NLH.rank((6♣, 6♡, 6♢, Q♠, Q♠)) == 265 # Sixes Full over Queens
@test NLH.rank((6♣, 6♡, 6♢, J♠, J♠)) == 266 # Sixes Full over Jacks
@test NLH.rank((6♣, 6♡, 6♢, 10♠, 10♠)) == 267 # Sixes Full over Tens
@test NLH.rank((6♣, 6♡, 6♢, 9♠, 9♠)) == 268 # Sixes Full over Nines
@test NLH.rank((6♣, 6♡, 6♢, 8♠, 8♠)) == 269 # Sixes Full over Eights
@test NLH.rank((6♣, 6♡, 6♢, 7♠, 7♠)) == 270 # Sixes Full over Sevens
@test NLH.rank((6♣, 6♡, 6♢, 5♠, 5♠)) == 271 # Sixes Full over Fives
@test NLH.rank((6♣, 6♡, 6♢, 4♠, 4♠)) == 272 # Sixes Full over Fours
@test NLH.rank((6♣, 6♡, 6♢, 3♠, 3♠)) == 273 # Sixes Full over Treys
@test NLH.rank((6♣, 6♡, 6♢, 2♠, 2♠)) == 274 # Sixes Full over Deuces
@test NLH.rank((5♣, 5♡, 5♢, A♠, A♠)) == 275 # Fives Full over Aces
@test NLH.rank((5♣, 5♡, 5♢, K♠, K♠)) == 276 # Fives Full over Kings
@test NLH.rank((5♣, 5♡, 5♢, Q♠, Q♠)) == 277 # Fives Full over Queens
@test NLH.rank((5♣, 5♡, 5♢, J♠, J♠)) == 278 # Fives Full over Jacks
@test NLH.rank((5♣, 5♡, 5♢, 10♠, 10♠)) == 279 # Fives Full over Tens
@test NLH.rank((5♣, 5♡, 5♢, 9♠, 9♠)) == 280 # Fives Full over Nines
@test NLH.rank((5♣, 5♡, 5♢, 8♠, 8♠)) == 281 # Fives Full over Eights
@test NLH.rank((5♣, 5♡, 5♢, 7♠, 7♠)) == 282 # Fives Full over Sevens
@test NLH.rank((5♣, 5♡, 5♢, 6♠, 6♠)) == 283 # Fives Full over Sixes
@test NLH.rank((5♣, 5♡, 5♢, 4♠, 4♠)) == 284 # Fives Full over Fours
@test NLH.rank((5♣, 5♡, 5♢, 3♠, 3♠)) == 285 # Fives Full over Treys
@test NLH.rank((5♣, 5♡, 5♢, 2♠, 2♠)) == 286 # Fives Full over Deuces
@test NLH.rank((4♣, 4♡, 4♢, A♠, A♠)) == 287 # Fours Full over Aces
@test NLH.rank((4♣, 4♡, 4♢, K♠, K♠)) == 288 # Fours Full over Kings
@test NLH.rank((4♣, 4♡, 4♢, Q♠, Q♠)) == 289 # Fours Full over Queens
@test NLH.rank((4♣, 4♡, 4♢, J♠, J♠)) == 290 # Fours Full over Jacks
@test NLH.rank((4♣, 4♡, 4♢, 10♠, 10♠)) == 291 # Fours Full over Tens
@test NLH.rank((4♣, 4♡, 4♢, 9♠, 9♠)) == 292 # Fours Full over Nines
@test NLH.rank((4♣, 4♡, 4♢, 8♠, 8♠)) == 293 # Fours Full over Eights
@test NLH.rank((4♣, 4♡, 4♢, 7♠, 7♠)) == 294 # Fours Full over Sevens
@test NLH.rank((4♣, 4♡, 4♢, 6♠, 6♠)) == 295 # Fours Full over Sixes
@test NLH.rank((4♣, 4♡, 4♢, 5♠, 5♠)) == 296 # Fours Full over Fives
@test NLH.rank((4♣, 4♡, 4♢, 3♠, 3♠)) == 297 # Fours Full over Treys
@test NLH.rank((4♣, 4♡, 4♢, 2♠, 2♠)) == 298 # Fours Full over Deuces
@test NLH.rank((3♣, 3♡, 3♢, A♠, A♠)) == 299 # Treys Full over Aces
@test NLH.rank((3♣, 3♡, 3♢, K♠, K♠)) == 300 # Treys Full over Kings
@test NLH.rank((3♣, 3♡, 3♢, Q♠, Q♠)) == 301 # Treys Full over Queens
@test NLH.rank((3♣, 3♡, 3♢, J♠, J♠)) == 302 # Treys Full over Jacks
@test NLH.rank((3♣, 3♡, 3♢, 10♠, 10♠)) == 303 # Treys Full over Tens
@test NLH.rank((3♣, 3♡, 3♢, 9♠, 9♠)) == 304 # Treys Full over Nines
@test NLH.rank((3♣, 3♡, 3♢, 8♠, 8♠)) == 305 # Treys Full over Eights
@test NLH.rank((3♣, 3♡, 3♢, 7♠, 7♠)) == 306 # Treys Full over Sevens
@test NLH.rank((3♣, 3♡, 3♢, 6♠, 6♠)) == 307 # Treys Full over Sixes
@test NLH.rank((3♣, 3♡, 3♢, 5♠, 5♠)) == 308 # Treys Full over Fives
@test NLH.rank((3♣, 3♡, 3♢, 4♠, 4♠)) == 309 # Treys Full over Fours
@test NLH.rank((3♣, 3♡, 3♢, 2♠, 2♠)) == 310 # Treys Full over Deuces
@test NLH.rank((2♣, 2♡, 2♢, A♠, A♠)) == 311 # Deuces Full over Aces
@test NLH.rank((2♣, 2♡, 2♢, K♠, K♠)) == 312 # Deuces Full over Kings
@test NLH.rank((2♣, 2♡, 2♢, Q♠, Q♠)) == 313 # Deuces Full over Queens
@test NLH.rank((2♣, 2♡, 2♢, J♠, J♠)) == 314 # Deuces Full over Jacks
@test NLH.rank((2♣, 2♡, 2♢, 10♠, 10♠)) == 315 # Deuces Full over Tens
@test NLH.rank((2♣, 2♡, 2♢, 9♠, 9♠)) == 316 # Deuces Full over Nines
@test NLH.rank((2♣, 2♡, 2♢, 8♠, 8♠)) == 317 # Deuces Full over Eights
@test NLH.rank((2♣, 2♡, 2♢, 7♠, 7♠)) == 318 # Deuces Full over Sevens
@test NLH.rank((2♣, 2♡, 2♢, 6♠, 6♠)) == 319 # Deuces Full over Sixes
@test NLH.rank((2♣, 2♡, 2♢, 5♠, 5♠)) == 320 # Deuces Full over Fives
@test NLH.rank((2♣, 2♡, 2♢, 4♠, 4♠)) == 321 # Deuces Full over Fours
@test NLH.rank((2♣, 2♡, 2♢, 3♠, 3♠)) == 322 # Deuces Full over Treys
