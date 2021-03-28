@test NLH.rank((A, K, Q, J, T)) == 1 # Royal Flush
@test NLH.rank((K, Q, J, T, 9)) == 2 # King-High Straight Flush
@test NLH.rank((Q, J, T, 9, 8)) == 3 # Queen-High Straight Flush
@test NLH.rank((J, T, 9, 8, 7)) == 4 # Jack-High Straight Flush
@test NLH.rank((T, 9, 8, 7, 6)) == 5 # Ten-High Straight Flush
@test NLH.rank((9, 8, 7, 6, 5)) == 6 # Nine-High Straight Flush
@test NLH.rank((8, 7, 6, 5, 4)) == 7 # Eight-High Straight Flush
@test NLH.rank((7, 6, 5, 4, 3)) == 8 # Seven-High Straight Flush
@test NLH.rank((6, 5, 4, 3, 2)) == 9 # Six-High Straight Flush
@test NLH.rank((5, 4, 3, 2, A)) == 10 # Five-High Straight Flush
@test NLH.rank((A, A, A, A, K)) == 11 # Four Aces
@test NLH.rank((A, A, A, A, Q)) == 12 # Four Aces
@test NLH.rank((A, A, A, A, J)) == 13 # Four Aces
@test NLH.rank((A, A, A, A, T)) == 14 # Four Aces
@test NLH.rank((A, A, A, A, 9)) == 15 # Four Aces
@test NLH.rank((A, A, A, A, 8)) == 16 # Four Aces
@test NLH.rank((A, A, A, A, 7)) == 17 # Four Aces
@test NLH.rank((A, A, A, A, 6)) == 18 # Four Aces
@test NLH.rank((A, A, A, A, 5)) == 19 # Four Aces
@test NLH.rank((A, A, A, A, 4)) == 20 # Four Aces
@test NLH.rank((A, A, A, A, 3)) == 21 # Four Aces
@test NLH.rank((A, A, A, A, 2)) == 22 # Four Aces
@test NLH.rank((K, K, K, K, A)) == 23 # Four Kings
@test NLH.rank((K, K, K, K, Q)) == 24 # Four Kings
@test NLH.rank((K, K, K, K, J)) == 25 # Four Kings
@test NLH.rank((K, K, K, K, T)) == 26 # Four Kings
@test NLH.rank((K, K, K, K, 9)) == 27 # Four Kings
@test NLH.rank((K, K, K, K, 8)) == 28 # Four Kings
@test NLH.rank((K, K, K, K, 7)) == 29 # Four Kings
@test NLH.rank((K, K, K, K, 6)) == 30 # Four Kings
@test NLH.rank((K, K, K, K, 5)) == 31 # Four Kings
@test NLH.rank((K, K, K, K, 4)) == 32 # Four Kings
@test NLH.rank((K, K, K, K, 3)) == 33 # Four Kings
@test NLH.rank((K, K, K, K, 2)) == 34 # Four Kings
@test NLH.rank((Q, Q, Q, Q, A)) == 35 # Four Queens
@test NLH.rank((Q, Q, Q, Q, K)) == 36 # Four Queens
@test NLH.rank((Q, Q, Q, Q, J)) == 37 # Four Queens
@test NLH.rank((Q, Q, Q, Q, T)) == 38 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 9)) == 39 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 8)) == 40 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 7)) == 41 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 6)) == 42 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 5)) == 43 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 4)) == 44 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 3)) == 45 # Four Queens
@test NLH.rank((Q, Q, Q, Q, 2)) == 46 # Four Queens
@test NLH.rank((J, J, J, J, A)) == 47 # Four Jacks
@test NLH.rank((J, J, J, J, K)) == 48 # Four Jacks
@test NLH.rank((J, J, J, J, Q)) == 49 # Four Jacks
@test NLH.rank((J, J, J, J, T)) == 50 # Four Jacks
@test NLH.rank((J, J, J, J, 9)) == 51 # Four Jacks
@test NLH.rank((J, J, J, J, 8)) == 52 # Four Jacks
@test NLH.rank((J, J, J, J, 7)) == 53 # Four Jacks
@test NLH.rank((J, J, J, J, 6)) == 54 # Four Jacks
@test NLH.rank((J, J, J, J, 5)) == 55 # Four Jacks
@test NLH.rank((J, J, J, J, 4)) == 56 # Four Jacks
@test NLH.rank((J, J, J, J, 3)) == 57 # Four Jacks
@test NLH.rank((J, J, J, J, 2)) == 58 # Four Jacks
@test NLH.rank((T, T, T, T, A)) == 59 # Four Tens
@test NLH.rank((T, T, T, T, K)) == 60 # Four Tens
@test NLH.rank((T, T, T, T, Q)) == 61 # Four Tens
@test NLH.rank((T, T, T, T, J)) == 62 # Four Tens
@test NLH.rank((T, T, T, T, 9)) == 63 # Four Tens
@test NLH.rank((T, T, T, T, 8)) == 64 # Four Tens
@test NLH.rank((T, T, T, T, 7)) == 65 # Four Tens
@test NLH.rank((T, T, T, T, 6)) == 66 # Four Tens
@test NLH.rank((T, T, T, T, 5)) == 67 # Four Tens
@test NLH.rank((T, T, T, T, 4)) == 68 # Four Tens
@test NLH.rank((T, T, T, T, 3)) == 69 # Four Tens
@test NLH.rank((T, T, T, T, 2)) == 70 # Four Tens
@test NLH.rank((9, 9, 9, 9, A)) == 71 # Four Nines
@test NLH.rank((9, 9, 9, 9, K)) == 72 # Four Nines
@test NLH.rank((9, 9, 9, 9, Q)) == 73 # Four Nines
@test NLH.rank((9, 9, 9, 9, J)) == 74 # Four Nines
@test NLH.rank((9, 9, 9, 9, T)) == 75 # Four Nines
@test NLH.rank((9, 9, 9, 9, 8)) == 76 # Four Nines
@test NLH.rank((9, 9, 9, 9, 7)) == 77 # Four Nines
@test NLH.rank((9, 9, 9, 9, 6)) == 78 # Four Nines
@test NLH.rank((9, 9, 9, 9, 5)) == 79 # Four Nines
@test NLH.rank((9, 9, 9, 9, 4)) == 80 # Four Nines
@test NLH.rank((9, 9, 9, 9, 3)) == 81 # Four Nines
@test NLH.rank((9, 9, 9, 9, 2)) == 82 # Four Nines
@test NLH.rank((8, 8, 8, 8, A)) == 83 # Four Eights
@test NLH.rank((8, 8, 8, 8, K)) == 84 # Four Eights
@test NLH.rank((8, 8, 8, 8, Q)) == 85 # Four Eights
@test NLH.rank((8, 8, 8, 8, J)) == 86 # Four Eights
@test NLH.rank((8, 8, 8, 8, T)) == 87 # Four Eights
@test NLH.rank((8, 8, 8, 8, 9)) == 88 # Four Eights
@test NLH.rank((8, 8, 8, 8, 7)) == 89 # Four Eights
@test NLH.rank((8, 8, 8, 8, 6)) == 90 # Four Eights
@test NLH.rank((8, 8, 8, 8, 5)) == 91 # Four Eights
@test NLH.rank((8, 8, 8, 8, 4)) == 92 # Four Eights
@test NLH.rank((8, 8, 8, 8, 3)) == 93 # Four Eights
@test NLH.rank((8, 8, 8, 8, 2)) == 94 # Four Eights
@test NLH.rank((7, 7, 7, 7, A)) == 95 # Four Sevens
@test NLH.rank((7, 7, 7, 7, K)) == 96 # Four Sevens
@test NLH.rank((7, 7, 7, 7, Q)) == 97 # Four Sevens
@test NLH.rank((7, 7, 7, 7, J)) == 98 # Four Sevens
@test NLH.rank((7, 7, 7, 7, T)) == 99 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 9)) == 100 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 8)) == 101 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 6)) == 102 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 5)) == 103 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 4)) == 104 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 3)) == 105 # Four Sevens
@test NLH.rank((7, 7, 7, 7, 2)) == 106 # Four Sevens
@test NLH.rank((6, 6, 6, 6, A)) == 107 # Four Sixes
@test NLH.rank((6, 6, 6, 6, K)) == 108 # Four Sixes
@test NLH.rank((6, 6, 6, 6, Q)) == 109 # Four Sixes
@test NLH.rank((6, 6, 6, 6, J)) == 110 # Four Sixes
@test NLH.rank((6, 6, 6, 6, T)) == 111 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 9)) == 112 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 8)) == 113 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 7)) == 114 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 5)) == 115 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 4)) == 116 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 3)) == 117 # Four Sixes
@test NLH.rank((6, 6, 6, 6, 2)) == 118 # Four Sixes
@test NLH.rank((5, 5, 5, 5, A)) == 119 # Four Fives
@test NLH.rank((5, 5, 5, 5, K)) == 120 # Four Fives
@test NLH.rank((5, 5, 5, 5, Q)) == 121 # Four Fives
@test NLH.rank((5, 5, 5, 5, J)) == 122 # Four Fives
@test NLH.rank((5, 5, 5, 5, T)) == 123 # Four Fives
@test NLH.rank((5, 5, 5, 5, 9)) == 124 # Four Fives
@test NLH.rank((5, 5, 5, 5, 8)) == 125 # Four Fives
@test NLH.rank((5, 5, 5, 5, 7)) == 126 # Four Fives
@test NLH.rank((5, 5, 5, 5, 6)) == 127 # Four Fives
@test NLH.rank((5, 5, 5, 5, 4)) == 128 # Four Fives
@test NLH.rank((5, 5, 5, 5, 3)) == 129 # Four Fives
@test NLH.rank((5, 5, 5, 5, 2)) == 130 # Four Fives
@test NLH.rank((4, 4, 4, 4, A)) == 131 # Four Fours
@test NLH.rank((4, 4, 4, 4, K)) == 132 # Four Fours
@test NLH.rank((4, 4, 4, 4, Q)) == 133 # Four Fours
@test NLH.rank((4, 4, 4, 4, J)) == 134 # Four Fours
@test NLH.rank((4, 4, 4, 4, T)) == 135 # Four Fours
@test NLH.rank((4, 4, 4, 4, 9)) == 136 # Four Fours
@test NLH.rank((4, 4, 4, 4, 8)) == 137 # Four Fours
@test NLH.rank((4, 4, 4, 4, 7)) == 138 # Four Fours
@test NLH.rank((4, 4, 4, 4, 6)) == 139 # Four Fours
@test NLH.rank((4, 4, 4, 4, 5)) == 140 # Four Fours
@test NLH.rank((4, 4, 4, 4, 3)) == 141 # Four Fours
@test NLH.rank((4, 4, 4, 4, 2)) == 142 # Four Fours
@test NLH.rank((3, 3, 3, 3, A)) == 143 # Four Treys
@test NLH.rank((3, 3, 3, 3, K)) == 144 # Four Treys
@test NLH.rank((3, 3, 3, 3, Q)) == 145 # Four Treys
@test NLH.rank((3, 3, 3, 3, J)) == 146 # Four Treys
@test NLH.rank((3, 3, 3, 3, T)) == 147 # Four Treys
@test NLH.rank((3, 3, 3, 3, 9)) == 148 # Four Treys
@test NLH.rank((3, 3, 3, 3, 8)) == 149 # Four Treys
@test NLH.rank((3, 3, 3, 3, 7)) == 150 # Four Treys
@test NLH.rank((3, 3, 3, 3, 6)) == 151 # Four Treys
@test NLH.rank((3, 3, 3, 3, 5)) == 152 # Four Treys
@test NLH.rank((3, 3, 3, 3, 4)) == 153 # Four Treys
@test NLH.rank((3, 3, 3, 3, 2)) == 154 # Four Treys
@test NLH.rank((2, 2, 2, 2, A)) == 155 # Four Deuces
@test NLH.rank((2, 2, 2, 2, K)) == 156 # Four Deuces
@test NLH.rank((2, 2, 2, 2, Q)) == 157 # Four Deuces
@test NLH.rank((2, 2, 2, 2, J)) == 158 # Four Deuces
@test NLH.rank((2, 2, 2, 2, T)) == 159 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 9)) == 160 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 8)) == 161 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 7)) == 162 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 6)) == 163 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 5)) == 164 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 4)) == 165 # Four Deuces
@test NLH.rank((2, 2, 2, 2, 3)) == 166 # Four Deuces
@test NLH.rank((A, A, A, K, K)) == 167 # Aces Full over Kings
@test NLH.rank((A, A, A, Q, Q)) == 168 # Aces Full over Queens
@test NLH.rank((A, A, A, J, J)) == 169 # Aces Full over Jacks
@test NLH.rank((A, A, A, T, T)) == 170 # Aces Full over Tens
@test NLH.rank((A, A, A, 9, 9)) == 171 # Aces Full over Nines
@test NLH.rank((A, A, A, 8, 8)) == 172 # Aces Full over Eights
@test NLH.rank((A, A, A, 7, 7)) == 173 # Aces Full over Sevens
@test NLH.rank((A, A, A, 6, 6)) == 174 # Aces Full over Sixes
@test NLH.rank((A, A, A, 5, 5)) == 175 # Aces Full over Fives
@test NLH.rank((A, A, A, 4, 4)) == 176 # Aces Full over Fours
@test NLH.rank((A, A, A, 3, 3)) == 177 # Aces Full over Treys
@test NLH.rank((A, A, A, 2, 2)) == 178 # Aces Full over Deuces
@test NLH.rank((K, K, K, A, A)) == 179 # Kings Full over Aces
@test NLH.rank((K, K, K, Q, Q)) == 180 # Kings Full over Queens
@test NLH.rank((K, K, K, J, J)) == 181 # Kings Full over Jacks
@test NLH.rank((K, K, K, T, T)) == 182 # Kings Full over Tens
@test NLH.rank((K, K, K, 9, 9)) == 183 # Kings Full over Nines
@test NLH.rank((K, K, K, 8, 8)) == 184 # Kings Full over Eights
@test NLH.rank((K, K, K, 7, 7)) == 185 # Kings Full over Sevens
@test NLH.rank((K, K, K, 6, 6)) == 186 # Kings Full over Sixes
@test NLH.rank((K, K, K, 5, 5)) == 187 # Kings Full over Fives
@test NLH.rank((K, K, K, 4, 4)) == 188 # Kings Full over Fours
@test NLH.rank((K, K, K, 3, 3)) == 189 # Kings Full over Treys
@test NLH.rank((K, K, K, 2, 2)) == 190 # Kings Full over Deuces
@test NLH.rank((Q, Q, Q, A, A)) == 191 # Queens Full over Aces
@test NLH.rank((Q, Q, Q, K, K)) == 192 # Queens Full over Kings
@test NLH.rank((Q, Q, Q, J, J)) == 193 # Queens Full over Jacks
@test NLH.rank((Q, Q, Q, T, T)) == 194 # Queens Full over Tens
@test NLH.rank((Q, Q, Q, 9, 9)) == 195 # Queens Full over Nines
@test NLH.rank((Q, Q, Q, 8, 8)) == 196 # Queens Full over Eights
@test NLH.rank((Q, Q, Q, 7, 7)) == 197 # Queens Full over Sevens
@test NLH.rank((Q, Q, Q, 6, 6)) == 198 # Queens Full over Sixes
@test NLH.rank((Q, Q, Q, 5, 5)) == 199 # Queens Full over Fives
@test NLH.rank((Q, Q, Q, 4, 4)) == 200 # Queens Full over Fours
@test NLH.rank((Q, Q, Q, 3, 3)) == 201 # Queens Full over Treys
@test NLH.rank((Q, Q, Q, 2, 2)) == 202 # Queens Full over Deuces
@test NLH.rank((J, J, J, A, A)) == 203 # Jacks Full over Aces
@test NLH.rank((J, J, J, K, K)) == 204 # Jacks Full over Kings
@test NLH.rank((J, J, J, Q, Q)) == 205 # Jacks Full over Queens
@test NLH.rank((J, J, J, T, T)) == 206 # Jacks Full over Tens
@test NLH.rank((J, J, J, 9, 9)) == 207 # Jacks Full over Nines
@test NLH.rank((J, J, J, 8, 8)) == 208 # Jacks Full over Eights
@test NLH.rank((J, J, J, 7, 7)) == 209 # Jacks Full over Sevens
@test NLH.rank((J, J, J, 6, 6)) == 210 # Jacks Full over Sixes
@test NLH.rank((J, J, J, 5, 5)) == 211 # Jacks Full over Fives
@test NLH.rank((J, J, J, 4, 4)) == 212 # Jacks Full over Fours
@test NLH.rank((J, J, J, 3, 3)) == 213 # Jacks Full over Treys
@test NLH.rank((J, J, J, 2, 2)) == 214 # Jacks Full over Deuces
@test NLH.rank((T, T, T, A, A)) == 215 # Tens Full over Aces
@test NLH.rank((T, T, T, K, K)) == 216 # Tens Full over Kings
@test NLH.rank((T, T, T, Q, Q)) == 217 # Tens Full over Queens
@test NLH.rank((T, T, T, J, J)) == 218 # Tens Full over Jacks
@test NLH.rank((T, T, T, 9, 9)) == 219 # Tens Full over Nines
@test NLH.rank((T, T, T, 8, 8)) == 220 # Tens Full over Eights
@test NLH.rank((T, T, T, 7, 7)) == 221 # Tens Full over Sevens
@test NLH.rank((T, T, T, 6, 6)) == 222 # Tens Full over Sixes
@test NLH.rank((T, T, T, 5, 5)) == 223 # Tens Full over Fives
@test NLH.rank((T, T, T, 4, 4)) == 224 # Tens Full over Fours
@test NLH.rank((T, T, T, 3, 3)) == 225 # Tens Full over Treys
@test NLH.rank((T, T, T, 2, 2)) == 226 # Tens Full over Deuces
@test NLH.rank((9, 9, 9, A, A)) == 227 # Nines Full over Aces
@test NLH.rank((9, 9, 9, K, K)) == 228 # Nines Full over Kings
@test NLH.rank((9, 9, 9, Q, Q)) == 229 # Nines Full over Queens
@test NLH.rank((9, 9, 9, J, J)) == 230 # Nines Full over Jacks
@test NLH.rank((9, 9, 9, T, T)) == 231 # Nines Full over Tens
@test NLH.rank((9, 9, 9, 8, 8)) == 232 # Nines Full over Eights
@test NLH.rank((9, 9, 9, 7, 7)) == 233 # Nines Full over Sevens
@test NLH.rank((9, 9, 9, 6, 6)) == 234 # Nines Full over Sixes
@test NLH.rank((9, 9, 9, 5, 5)) == 235 # Nines Full over Fives
@test NLH.rank((9, 9, 9, 4, 4)) == 236 # Nines Full over Fours
@test NLH.rank((9, 9, 9, 3, 3)) == 237 # Nines Full over Treys
@test NLH.rank((9, 9, 9, 2, 2)) == 238 # Nines Full over Deuces
@test NLH.rank((8, 8, 8, A, A)) == 239 # Eights Full over Aces
@test NLH.rank((8, 8, 8, K, K)) == 240 # Eights Full over Kings
@test NLH.rank((8, 8, 8, Q, Q)) == 241 # Eights Full over Queens
@test NLH.rank((8, 8, 8, J, J)) == 242 # Eights Full over Jacks
@test NLH.rank((8, 8, 8, T, T)) == 243 # Eights Full over Tens
@test NLH.rank((8, 8, 8, 9, 9)) == 244 # Eights Full over Nines
@test NLH.rank((8, 8, 8, 7, 7)) == 245 # Eights Full over Sevens
@test NLH.rank((8, 8, 8, 6, 6)) == 246 # Eights Full over Sixes
@test NLH.rank((8, 8, 8, 5, 5)) == 247 # Eights Full over Fives
@test NLH.rank((8, 8, 8, 4, 4)) == 248 # Eights Full over Fours
@test NLH.rank((8, 8, 8, 3, 3)) == 249 # Eights Full over Treys
@test NLH.rank((8, 8, 8, 2, 2)) == 250 # Eights Full over Deuces
@test NLH.rank((7, 7, 7, A, A)) == 251 # Sevens Full over Aces
@test NLH.rank((7, 7, 7, K, K)) == 252 # Sevens Full over Kings
@test NLH.rank((7, 7, 7, Q, Q)) == 253 # Sevens Full over Queens
@test NLH.rank((7, 7, 7, J, J)) == 254 # Sevens Full over Jacks
@test NLH.rank((7, 7, 7, T, T)) == 255 # Sevens Full over Tens
@test NLH.rank((7, 7, 7, 9, 9)) == 256 # Sevens Full over Nines
@test NLH.rank((7, 7, 7, 8, 8)) == 257 # Sevens Full over Eights
@test NLH.rank((7, 7, 7, 6, 6)) == 258 # Sevens Full over Sixes
@test NLH.rank((7, 7, 7, 5, 5)) == 259 # Sevens Full over Fives
@test NLH.rank((7, 7, 7, 4, 4)) == 260 # Sevens Full over Fours
@test NLH.rank((7, 7, 7, 3, 3)) == 261 # Sevens Full over Treys
@test NLH.rank((7, 7, 7, 2, 2)) == 262 # Sevens Full over Deuces
@test NLH.rank((6, 6, 6, A, A)) == 263 # Sixes Full over Aces
@test NLH.rank((6, 6, 6, K, K)) == 264 # Sixes Full over Kings
@test NLH.rank((6, 6, 6, Q, Q)) == 265 # Sixes Full over Queens
@test NLH.rank((6, 6, 6, J, J)) == 266 # Sixes Full over Jacks
@test NLH.rank((6, 6, 6, T, T)) == 267 # Sixes Full over Tens
@test NLH.rank((6, 6, 6, 9, 9)) == 268 # Sixes Full over Nines
@test NLH.rank((6, 6, 6, 8, 8)) == 269 # Sixes Full over Eights
@test NLH.rank((6, 6, 6, 7, 7)) == 270 # Sixes Full over Sevens
@test NLH.rank((6, 6, 6, 5, 5)) == 271 # Sixes Full over Fives
@test NLH.rank((6, 6, 6, 4, 4)) == 272 # Sixes Full over Fours
@test NLH.rank((6, 6, 6, 3, 3)) == 273 # Sixes Full over Treys
@test NLH.rank((6, 6, 6, 2, 2)) == 274 # Sixes Full over Deuces
@test NLH.rank((5, 5, 5, A, A)) == 275 # Fives Full over Aces
@test NLH.rank((5, 5, 5, K, K)) == 276 # Fives Full over Kings
@test NLH.rank((5, 5, 5, Q, Q)) == 277 # Fives Full over Queens
@test NLH.rank((5, 5, 5, J, J)) == 278 # Fives Full over Jacks
@test NLH.rank((5, 5, 5, T, T)) == 279 # Fives Full over Tens
@test NLH.rank((5, 5, 5, 9, 9)) == 280 # Fives Full over Nines
@test NLH.rank((5, 5, 5, 8, 8)) == 281 # Fives Full over Eights
@test NLH.rank((5, 5, 5, 7, 7)) == 282 # Fives Full over Sevens
@test NLH.rank((5, 5, 5, 6, 6)) == 283 # Fives Full over Sixes
@test NLH.rank((5, 5, 5, 4, 4)) == 284 # Fives Full over Fours
@test NLH.rank((5, 5, 5, 3, 3)) == 285 # Fives Full over Treys
@test NLH.rank((5, 5, 5, 2, 2)) == 286 # Fives Full over Deuces
@test NLH.rank((4, 4, 4, A, A)) == 287 # Fours Full over Aces
@test NLH.rank((4, 4, 4, K, K)) == 288 # Fours Full over Kings
@test NLH.rank((4, 4, 4, Q, Q)) == 289 # Fours Full over Queens
@test NLH.rank((4, 4, 4, J, J)) == 290 # Fours Full over Jacks
@test NLH.rank((4, 4, 4, T, T)) == 291 # Fours Full over Tens
@test NLH.rank((4, 4, 4, 9, 9)) == 292 # Fours Full over Nines
@test NLH.rank((4, 4, 4, 8, 8)) == 293 # Fours Full over Eights
@test NLH.rank((4, 4, 4, 7, 7)) == 294 # Fours Full over Sevens
@test NLH.rank((4, 4, 4, 6, 6)) == 295 # Fours Full over Sixes
@test NLH.rank((4, 4, 4, 5, 5)) == 296 # Fours Full over Fives
@test NLH.rank((4, 4, 4, 3, 3)) == 297 # Fours Full over Treys
@test NLH.rank((4, 4, 4, 2, 2)) == 298 # Fours Full over Deuces
@test NLH.rank((3, 3, 3, A, A)) == 299 # Treys Full over Aces
@test NLH.rank((3, 3, 3, K, K)) == 300 # Treys Full over Kings
@test NLH.rank((3, 3, 3, Q, Q)) == 301 # Treys Full over Queens
@test NLH.rank((3, 3, 3, J, J)) == 302 # Treys Full over Jacks
@test NLH.rank((3, 3, 3, T, T)) == 303 # Treys Full over Tens
@test NLH.rank((3, 3, 3, 9, 9)) == 304 # Treys Full over Nines
@test NLH.rank((3, 3, 3, 8, 8)) == 305 # Treys Full over Eights
@test NLH.rank((3, 3, 3, 7, 7)) == 306 # Treys Full over Sevens
@test NLH.rank((3, 3, 3, 6, 6)) == 307 # Treys Full over Sixes
@test NLH.rank((3, 3, 3, 5, 5)) == 308 # Treys Full over Fives
@test NLH.rank((3, 3, 3, 4, 4)) == 309 # Treys Full over Fours
@test NLH.rank((3, 3, 3, 2, 2)) == 310 # Treys Full over Deuces
@test NLH.rank((2, 2, 2, A, A)) == 311 # Deuces Full over Aces
@test NLH.rank((2, 2, 2, K, K)) == 312 # Deuces Full over Kings
@test NLH.rank((2, 2, 2, Q, Q)) == 313 # Deuces Full over Queens
@test NLH.rank((2, 2, 2, J, J)) == 314 # Deuces Full over Jacks
@test NLH.rank((2, 2, 2, T, T)) == 315 # Deuces Full over Tens
@test NLH.rank((2, 2, 2, 9, 9)) == 316 # Deuces Full over Nines
@test NLH.rank((2, 2, 2, 8, 8)) == 317 # Deuces Full over Eights
@test NLH.rank((2, 2, 2, 7, 7)) == 318 # Deuces Full over Sevens
@test NLH.rank((2, 2, 2, 6, 6)) == 319 # Deuces Full over Sixes
@test NLH.rank((2, 2, 2, 5, 5)) == 320 # Deuces Full over Fives
@test NLH.rank((2, 2, 2, 4, 4)) == 321 # Deuces Full over Fours
@test NLH.rank((2, 2, 2, 3, 3)) == 322 # Deuces Full over Treys
@test NLH.rank((A, K, Q, J, 9)) == 323 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 8)) == 324 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 7)) == 325 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 6)) == 326 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 5)) == 327 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 4)) == 328 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 3)) == 329 # Ace-High Flush
@test NLH.rank((A, K, Q, J, 2)) == 330 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 9)) == 331 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 8)) == 332 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 7)) == 333 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 6)) == 334 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 5)) == 335 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 4)) == 336 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 3)) == 337 # Ace-High Flush
@test NLH.rank((A, K, Q, T, 2)) == 338 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 8)) == 339 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 7)) == 340 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 6)) == 341 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 5)) == 342 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 4)) == 343 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 3)) == 344 # Ace-High Flush
@test NLH.rank((A, K, Q, 9, 2)) == 345 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 7)) == 346 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 6)) == 347 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 5)) == 348 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 4)) == 349 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 3)) == 350 # Ace-High Flush
@test NLH.rank((A, K, Q, 8, 2)) == 351 # Ace-High Flush
@test NLH.rank((A, K, Q, 7, 6)) == 352 # Ace-High Flush
@test NLH.rank((A, K, Q, 7, 5)) == 353 # Ace-High Flush
@test NLH.rank((A, K, Q, 7, 4)) == 354 # Ace-High Flush
@test NLH.rank((A, K, Q, 7, 3)) == 355 # Ace-High Flush
@test NLH.rank((A, K, Q, 7, 2)) == 356 # Ace-High Flush
@test NLH.rank((A, K, Q, 6, 5)) == 357 # Ace-High Flush
@test NLH.rank((A, K, Q, 6, 4)) == 358 # Ace-High Flush
@test NLH.rank((A, K, Q, 6, 3)) == 359 # Ace-High Flush
@test NLH.rank((A, K, Q, 6, 2)) == 360 # Ace-High Flush
@test NLH.rank((A, K, Q, 5, 4)) == 361 # Ace-High Flush
@test NLH.rank((A, K, Q, 5, 3)) == 362 # Ace-High Flush
@test NLH.rank((A, K, Q, 5, 2)) == 363 # Ace-High Flush
@test NLH.rank((A, K, Q, 4, 3)) == 364 # Ace-High Flush
@test NLH.rank((A, K, Q, 4, 2)) == 365 # Ace-High Flush
@test NLH.rank((A, K, Q, 3, 2)) == 366 # Ace-High Flush
@test NLH.rank((A, K, J, T, 9)) == 367 # Ace-High Flush
@test NLH.rank((A, K, J, T, 8)) == 368 # Ace-High Flush
@test NLH.rank((A, K, J, T, 7)) == 369 # Ace-High Flush
@test NLH.rank((A, K, J, T, 6)) == 370 # Ace-High Flush
@test NLH.rank((A, K, J, T, 5)) == 371 # Ace-High Flush
@test NLH.rank((A, K, J, T, 4)) == 372 # Ace-High Flush
@test NLH.rank((A, K, J, T, 3)) == 373 # Ace-High Flush
@test NLH.rank((A, K, J, T, 2)) == 374 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 8)) == 375 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 7)) == 376 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 6)) == 377 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 5)) == 378 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 4)) == 379 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 3)) == 380 # Ace-High Flush
@test NLH.rank((A, K, J, 9, 2)) == 381 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 7)) == 382 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 6)) == 383 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 5)) == 384 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 4)) == 385 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 3)) == 386 # Ace-High Flush
@test NLH.rank((A, K, J, 8, 2)) == 387 # Ace-High Flush
@test NLH.rank((A, K, J, 7, 6)) == 388 # Ace-High Flush
@test NLH.rank((A, K, J, 7, 5)) == 389 # Ace-High Flush
@test NLH.rank((A, K, J, 7, 4)) == 390 # Ace-High Flush
@test NLH.rank((A, K, J, 7, 3)) == 391 # Ace-High Flush
@test NLH.rank((A, K, J, 7, 2)) == 392 # Ace-High Flush
@test NLH.rank((A, K, J, 6, 5)) == 393 # Ace-High Flush
@test NLH.rank((A, K, J, 6, 4)) == 394 # Ace-High Flush
@test NLH.rank((A, K, J, 6, 3)) == 395 # Ace-High Flush
@test NLH.rank((A, K, J, 6, 2)) == 396 # Ace-High Flush
@test NLH.rank((A, K, J, 5, 4)) == 397 # Ace-High Flush
@test NLH.rank((A, K, J, 5, 3)) == 398 # Ace-High Flush
@test NLH.rank((A, K, J, 5, 2)) == 399 # Ace-High Flush
@test NLH.rank((A, K, J, 4, 3)) == 400 # Ace-High Flush
@test NLH.rank((A, K, J, 4, 2)) == 401 # Ace-High Flush
@test NLH.rank((A, K, J, 3, 2)) == 402 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 8)) == 403 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 7)) == 404 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 6)) == 405 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 5)) == 406 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 4)) == 407 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 3)) == 408 # Ace-High Flush
@test NLH.rank((A, K, T, 9, 2)) == 409 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 7)) == 410 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 6)) == 411 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 5)) == 412 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 4)) == 413 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 3)) == 414 # Ace-High Flush
@test NLH.rank((A, K, T, 8, 2)) == 415 # Ace-High Flush
@test NLH.rank((A, K, T, 7, 6)) == 416 # Ace-High Flush
@test NLH.rank((A, K, T, 7, 5)) == 417 # Ace-High Flush
@test NLH.rank((A, K, T, 7, 4)) == 418 # Ace-High Flush
@test NLH.rank((A, K, T, 7, 3)) == 419 # Ace-High Flush
@test NLH.rank((A, K, T, 7, 2)) == 420 # Ace-High Flush
@test NLH.rank((A, K, T, 6, 5)) == 421 # Ace-High Flush
@test NLH.rank((A, K, T, 6, 4)) == 422 # Ace-High Flush
@test NLH.rank((A, K, T, 6, 3)) == 423 # Ace-High Flush
@test NLH.rank((A, K, T, 6, 2)) == 424 # Ace-High Flush
@test NLH.rank((A, K, T, 5, 4)) == 425 # Ace-High Flush
@test NLH.rank((A, K, T, 5, 3)) == 426 # Ace-High Flush
@test NLH.rank((A, K, T, 5, 2)) == 427 # Ace-High Flush
@test NLH.rank((A, K, T, 4, 3)) == 428 # Ace-High Flush
@test NLH.rank((A, K, T, 4, 2)) == 429 # Ace-High Flush
@test NLH.rank((A, K, T, 3, 2)) == 430 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 7)) == 431 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 6)) == 432 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 5)) == 433 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 4)) == 434 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 3)) == 435 # Ace-High Flush
@test NLH.rank((A, K, 9, 8, 2)) == 436 # Ace-High Flush
@test NLH.rank((A, K, 9, 7, 6)) == 437 # Ace-High Flush
@test NLH.rank((A, K, 9, 7, 5)) == 438 # Ace-High Flush
@test NLH.rank((A, K, 9, 7, 4)) == 439 # Ace-High Flush
@test NLH.rank((A, K, 9, 7, 3)) == 440 # Ace-High Flush
@test NLH.rank((A, K, 9, 7, 2)) == 441 # Ace-High Flush
@test NLH.rank((A, K, 9, 6, 5)) == 442 # Ace-High Flush
@test NLH.rank((A, K, 9, 6, 4)) == 443 # Ace-High Flush
@test NLH.rank((A, K, 9, 6, 3)) == 444 # Ace-High Flush
@test NLH.rank((A, K, 9, 6, 2)) == 445 # Ace-High Flush
@test NLH.rank((A, K, 9, 5, 4)) == 446 # Ace-High Flush
@test NLH.rank((A, K, 9, 5, 3)) == 447 # Ace-High Flush
@test NLH.rank((A, K, 9, 5, 2)) == 448 # Ace-High Flush
@test NLH.rank((A, K, 9, 4, 3)) == 449 # Ace-High Flush
@test NLH.rank((A, K, 9, 4, 2)) == 450 # Ace-High Flush
@test NLH.rank((A, K, 9, 3, 2)) == 451 # Ace-High Flush
@test NLH.rank((A, K, 8, 7, 6)) == 452 # Ace-High Flush
@test NLH.rank((A, K, 8, 7, 5)) == 453 # Ace-High Flush
@test NLH.rank((A, K, 8, 7, 4)) == 454 # Ace-High Flush
@test NLH.rank((A, K, 8, 7, 3)) == 455 # Ace-High Flush
@test NLH.rank((A, K, 8, 7, 2)) == 456 # Ace-High Flush
@test NLH.rank((A, K, 8, 6, 5)) == 457 # Ace-High Flush
@test NLH.rank((A, K, 8, 6, 4)) == 458 # Ace-High Flush
@test NLH.rank((A, K, 8, 6, 3)) == 459 # Ace-High Flush
@test NLH.rank((A, K, 8, 6, 2)) == 460 # Ace-High Flush
@test NLH.rank((A, K, 8, 5, 4)) == 461 # Ace-High Flush
@test NLH.rank((A, K, 8, 5, 3)) == 462 # Ace-High Flush
@test NLH.rank((A, K, 8, 5, 2)) == 463 # Ace-High Flush
@test NLH.rank((A, K, 8, 4, 3)) == 464 # Ace-High Flush
@test NLH.rank((A, K, 8, 4, 2)) == 465 # Ace-High Flush
@test NLH.rank((A, K, 8, 3, 2)) == 466 # Ace-High Flush
@test NLH.rank((A, K, 7, 6, 5)) == 467 # Ace-High Flush
@test NLH.rank((A, K, 7, 6, 4)) == 468 # Ace-High Flush
@test NLH.rank((A, K, 7, 6, 3)) == 469 # Ace-High Flush
@test NLH.rank((A, K, 7, 6, 2)) == 470 # Ace-High Flush
@test NLH.rank((A, K, 7, 5, 4)) == 471 # Ace-High Flush
@test NLH.rank((A, K, 7, 5, 3)) == 472 # Ace-High Flush
@test NLH.rank((A, K, 7, 5, 2)) == 473 # Ace-High Flush
@test NLH.rank((A, K, 7, 4, 3)) == 474 # Ace-High Flush
@test NLH.rank((A, K, 7, 4, 2)) == 475 # Ace-High Flush
@test NLH.rank((A, K, 7, 3, 2)) == 476 # Ace-High Flush
@test NLH.rank((A, K, 6, 5, 4)) == 477 # Ace-High Flush
@test NLH.rank((A, K, 6, 5, 3)) == 478 # Ace-High Flush
@test NLH.rank((A, K, 6, 5, 2)) == 479 # Ace-High Flush
@test NLH.rank((A, K, 6, 4, 3)) == 480 # Ace-High Flush
@test NLH.rank((A, K, 6, 4, 2)) == 481 # Ace-High Flush
@test NLH.rank((A, K, 6, 3, 2)) == 482 # Ace-High Flush
@test NLH.rank((A, K, 5, 4, 3)) == 483 # Ace-High Flush
@test NLH.rank((A, K, 5, 4, 2)) == 484 # Ace-High Flush
@test NLH.rank((A, K, 5, 3, 2)) == 485 # Ace-High Flush
@test NLH.rank((A, K, 4, 3, 2)) == 486 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 9)) == 487 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 8)) == 488 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 7)) == 489 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 6)) == 490 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 5)) == 491 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 4)) == 492 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 3)) == 493 # Ace-High Flush
@test NLH.rank((A, Q, J, T, 2)) == 494 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 8)) == 495 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 7)) == 496 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 6)) == 497 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 5)) == 498 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 4)) == 499 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 3)) == 500 # Ace-High Flush
@test NLH.rank((A, Q, J, 9, 2)) == 501 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 7)) == 502 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 6)) == 503 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 5)) == 504 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 4)) == 505 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 3)) == 506 # Ace-High Flush
@test NLH.rank((A, Q, J, 8, 2)) == 507 # Ace-High Flush
@test NLH.rank((A, Q, J, 7, 6)) == 508 # Ace-High Flush
@test NLH.rank((A, Q, J, 7, 5)) == 509 # Ace-High Flush
@test NLH.rank((A, Q, J, 7, 4)) == 510 # Ace-High Flush
@test NLH.rank((A, Q, J, 7, 3)) == 511 # Ace-High Flush
@test NLH.rank((A, Q, J, 7, 2)) == 512 # Ace-High Flush
@test NLH.rank((A, Q, J, 6, 5)) == 513 # Ace-High Flush
@test NLH.rank((A, Q, J, 6, 4)) == 514 # Ace-High Flush
@test NLH.rank((A, Q, J, 6, 3)) == 515 # Ace-High Flush
@test NLH.rank((A, Q, J, 6, 2)) == 516 # Ace-High Flush
@test NLH.rank((A, Q, J, 5, 4)) == 517 # Ace-High Flush
@test NLH.rank((A, Q, J, 5, 3)) == 518 # Ace-High Flush
@test NLH.rank((A, Q, J, 5, 2)) == 519 # Ace-High Flush
@test NLH.rank((A, Q, J, 4, 3)) == 520 # Ace-High Flush
@test NLH.rank((A, Q, J, 4, 2)) == 521 # Ace-High Flush
@test NLH.rank((A, Q, J, 3, 2)) == 522 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 8)) == 523 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 7)) == 524 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 6)) == 525 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 5)) == 526 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 4)) == 527 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 3)) == 528 # Ace-High Flush
@test NLH.rank((A, Q, T, 9, 2)) == 529 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 7)) == 530 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 6)) == 531 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 5)) == 532 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 4)) == 533 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 3)) == 534 # Ace-High Flush
@test NLH.rank((A, Q, T, 8, 2)) == 535 # Ace-High Flush
@test NLH.rank((A, Q, T, 7, 6)) == 536 # Ace-High Flush
@test NLH.rank((A, Q, T, 7, 5)) == 537 # Ace-High Flush
@test NLH.rank((A, Q, T, 7, 4)) == 538 # Ace-High Flush
@test NLH.rank((A, Q, T, 7, 3)) == 539 # Ace-High Flush
@test NLH.rank((A, Q, T, 7, 2)) == 540 # Ace-High Flush
@test NLH.rank((A, Q, T, 6, 5)) == 541 # Ace-High Flush
@test NLH.rank((A, Q, T, 6, 4)) == 542 # Ace-High Flush
@test NLH.rank((A, Q, T, 6, 3)) == 543 # Ace-High Flush
@test NLH.rank((A, Q, T, 6, 2)) == 544 # Ace-High Flush
@test NLH.rank((A, Q, T, 5, 4)) == 545 # Ace-High Flush
@test NLH.rank((A, Q, T, 5, 3)) == 546 # Ace-High Flush
@test NLH.rank((A, Q, T, 5, 2)) == 547 # Ace-High Flush
@test NLH.rank((A, Q, T, 4, 3)) == 548 # Ace-High Flush
@test NLH.rank((A, Q, T, 4, 2)) == 549 # Ace-High Flush
@test NLH.rank((A, Q, T, 3, 2)) == 550 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 7)) == 551 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 6)) == 552 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 5)) == 553 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 4)) == 554 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 3)) == 555 # Ace-High Flush
@test NLH.rank((A, Q, 9, 8, 2)) == 556 # Ace-High Flush
@test NLH.rank((A, Q, 9, 7, 6)) == 557 # Ace-High Flush
@test NLH.rank((A, Q, 9, 7, 5)) == 558 # Ace-High Flush
@test NLH.rank((A, Q, 9, 7, 4)) == 559 # Ace-High Flush
@test NLH.rank((A, Q, 9, 7, 3)) == 560 # Ace-High Flush
@test NLH.rank((A, Q, 9, 7, 2)) == 561 # Ace-High Flush
@test NLH.rank((A, Q, 9, 6, 5)) == 562 # Ace-High Flush
@test NLH.rank((A, Q, 9, 6, 4)) == 563 # Ace-High Flush
@test NLH.rank((A, Q, 9, 6, 3)) == 564 # Ace-High Flush
@test NLH.rank((A, Q, 9, 6, 2)) == 565 # Ace-High Flush
@test NLH.rank((A, Q, 9, 5, 4)) == 566 # Ace-High Flush
@test NLH.rank((A, Q, 9, 5, 3)) == 567 # Ace-High Flush
@test NLH.rank((A, Q, 9, 5, 2)) == 568 # Ace-High Flush
@test NLH.rank((A, Q, 9, 4, 3)) == 569 # Ace-High Flush
@test NLH.rank((A, Q, 9, 4, 2)) == 570 # Ace-High Flush
@test NLH.rank((A, Q, 9, 3, 2)) == 571 # Ace-High Flush
@test NLH.rank((A, Q, 8, 7, 6)) == 572 # Ace-High Flush
@test NLH.rank((A, Q, 8, 7, 5)) == 573 # Ace-High Flush
@test NLH.rank((A, Q, 8, 7, 4)) == 574 # Ace-High Flush
@test NLH.rank((A, Q, 8, 7, 3)) == 575 # Ace-High Flush
@test NLH.rank((A, Q, 8, 7, 2)) == 576 # Ace-High Flush
@test NLH.rank((A, Q, 8, 6, 5)) == 577 # Ace-High Flush
@test NLH.rank((A, Q, 8, 6, 4)) == 578 # Ace-High Flush
@test NLH.rank((A, Q, 8, 6, 3)) == 579 # Ace-High Flush
@test NLH.rank((A, Q, 8, 6, 2)) == 580 # Ace-High Flush
@test NLH.rank((A, Q, 8, 5, 4)) == 581 # Ace-High Flush
@test NLH.rank((A, Q, 8, 5, 3)) == 582 # Ace-High Flush
@test NLH.rank((A, Q, 8, 5, 2)) == 583 # Ace-High Flush
@test NLH.rank((A, Q, 8, 4, 3)) == 584 # Ace-High Flush
@test NLH.rank((A, Q, 8, 4, 2)) == 585 # Ace-High Flush
@test NLH.rank((A, Q, 8, 3, 2)) == 586 # Ace-High Flush
@test NLH.rank((A, Q, 7, 6, 5)) == 587 # Ace-High Flush
@test NLH.rank((A, Q, 7, 6, 4)) == 588 # Ace-High Flush
@test NLH.rank((A, Q, 7, 6, 3)) == 589 # Ace-High Flush
@test NLH.rank((A, Q, 7, 6, 2)) == 590 # Ace-High Flush
@test NLH.rank((A, Q, 7, 5, 4)) == 591 # Ace-High Flush
@test NLH.rank((A, Q, 7, 5, 3)) == 592 # Ace-High Flush
@test NLH.rank((A, Q, 7, 5, 2)) == 593 # Ace-High Flush
@test NLH.rank((A, Q, 7, 4, 3)) == 594 # Ace-High Flush
@test NLH.rank((A, Q, 7, 4, 2)) == 595 # Ace-High Flush
@test NLH.rank((A, Q, 7, 3, 2)) == 596 # Ace-High Flush
@test NLH.rank((A, Q, 6, 5, 4)) == 597 # Ace-High Flush
@test NLH.rank((A, Q, 6, 5, 3)) == 598 # Ace-High Flush
@test NLH.rank((A, Q, 6, 5, 2)) == 599 # Ace-High Flush
@test NLH.rank((A, Q, 6, 4, 3)) == 600 # Ace-High Flush
@test NLH.rank((A, Q, 6, 4, 2)) == 601 # Ace-High Flush
@test NLH.rank((A, Q, 6, 3, 2)) == 602 # Ace-High Flush
@test NLH.rank((A, Q, 5, 4, 3)) == 603 # Ace-High Flush
@test NLH.rank((A, Q, 5, 4, 2)) == 604 # Ace-High Flush
@test NLH.rank((A, Q, 5, 3, 2)) == 605 # Ace-High Flush
@test NLH.rank((A, Q, 4, 3, 2)) == 606 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 8)) == 607 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 7)) == 608 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 6)) == 609 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 5)) == 610 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 4)) == 611 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 3)) == 612 # Ace-High Flush
@test NLH.rank((A, J, T, 9, 2)) == 613 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 7)) == 614 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 6)) == 615 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 5)) == 616 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 4)) == 617 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 3)) == 618 # Ace-High Flush
@test NLH.rank((A, J, T, 8, 2)) == 619 # Ace-High Flush
@test NLH.rank((A, J, T, 7, 6)) == 620 # Ace-High Flush
@test NLH.rank((A, J, T, 7, 5)) == 621 # Ace-High Flush
@test NLH.rank((A, J, T, 7, 4)) == 622 # Ace-High Flush
@test NLH.rank((A, J, T, 7, 3)) == 623 # Ace-High Flush
@test NLH.rank((A, J, T, 7, 2)) == 624 # Ace-High Flush
@test NLH.rank((A, J, T, 6, 5)) == 625 # Ace-High Flush
@test NLH.rank((A, J, T, 6, 4)) == 626 # Ace-High Flush
@test NLH.rank((A, J, T, 6, 3)) == 627 # Ace-High Flush
@test NLH.rank((A, J, T, 6, 2)) == 628 # Ace-High Flush
@test NLH.rank((A, J, T, 5, 4)) == 629 # Ace-High Flush
@test NLH.rank((A, J, T, 5, 3)) == 630 # Ace-High Flush
@test NLH.rank((A, J, T, 5, 2)) == 631 # Ace-High Flush
@test NLH.rank((A, J, T, 4, 3)) == 632 # Ace-High Flush
@test NLH.rank((A, J, T, 4, 2)) == 633 # Ace-High Flush
@test NLH.rank((A, J, T, 3, 2)) == 634 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 7)) == 635 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 6)) == 636 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 5)) == 637 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 4)) == 638 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 3)) == 639 # Ace-High Flush
@test NLH.rank((A, J, 9, 8, 2)) == 640 # Ace-High Flush
@test NLH.rank((A, J, 9, 7, 6)) == 641 # Ace-High Flush
@test NLH.rank((A, J, 9, 7, 5)) == 642 # Ace-High Flush
@test NLH.rank((A, J, 9, 7, 4)) == 643 # Ace-High Flush
@test NLH.rank((A, J, 9, 7, 3)) == 644 # Ace-High Flush
@test NLH.rank((A, J, 9, 7, 2)) == 645 # Ace-High Flush
@test NLH.rank((A, J, 9, 6, 5)) == 646 # Ace-High Flush
@test NLH.rank((A, J, 9, 6, 4)) == 647 # Ace-High Flush
@test NLH.rank((A, J, 9, 6, 3)) == 648 # Ace-High Flush
@test NLH.rank((A, J, 9, 6, 2)) == 649 # Ace-High Flush
@test NLH.rank((A, J, 9, 5, 4)) == 650 # Ace-High Flush
@test NLH.rank((A, J, 9, 5, 3)) == 651 # Ace-High Flush
@test NLH.rank((A, J, 9, 5, 2)) == 652 # Ace-High Flush
@test NLH.rank((A, J, 9, 4, 3)) == 653 # Ace-High Flush
@test NLH.rank((A, J, 9, 4, 2)) == 654 # Ace-High Flush
@test NLH.rank((A, J, 9, 3, 2)) == 655 # Ace-High Flush
@test NLH.rank((A, J, 8, 7, 6)) == 656 # Ace-High Flush
@test NLH.rank((A, J, 8, 7, 5)) == 657 # Ace-High Flush
@test NLH.rank((A, J, 8, 7, 4)) == 658 # Ace-High Flush
@test NLH.rank((A, J, 8, 7, 3)) == 659 # Ace-High Flush
@test NLH.rank((A, J, 8, 7, 2)) == 660 # Ace-High Flush
@test NLH.rank((A, J, 8, 6, 5)) == 661 # Ace-High Flush
@test NLH.rank((A, J, 8, 6, 4)) == 662 # Ace-High Flush
@test NLH.rank((A, J, 8, 6, 3)) == 663 # Ace-High Flush
@test NLH.rank((A, J, 8, 6, 2)) == 664 # Ace-High Flush
@test NLH.rank((A, J, 8, 5, 4)) == 665 # Ace-High Flush
@test NLH.rank((A, J, 8, 5, 3)) == 666 # Ace-High Flush
@test NLH.rank((A, J, 8, 5, 2)) == 667 # Ace-High Flush
@test NLH.rank((A, J, 8, 4, 3)) == 668 # Ace-High Flush
@test NLH.rank((A, J, 8, 4, 2)) == 669 # Ace-High Flush
@test NLH.rank((A, J, 8, 3, 2)) == 670 # Ace-High Flush
@test NLH.rank((A, J, 7, 6, 5)) == 671 # Ace-High Flush
@test NLH.rank((A, J, 7, 6, 4)) == 672 # Ace-High Flush
@test NLH.rank((A, J, 7, 6, 3)) == 673 # Ace-High Flush
@test NLH.rank((A, J, 7, 6, 2)) == 674 # Ace-High Flush
@test NLH.rank((A, J, 7, 5, 4)) == 675 # Ace-High Flush
@test NLH.rank((A, J, 7, 5, 3)) == 676 # Ace-High Flush
@test NLH.rank((A, J, 7, 5, 2)) == 677 # Ace-High Flush
@test NLH.rank((A, J, 7, 4, 3)) == 678 # Ace-High Flush
@test NLH.rank((A, J, 7, 4, 2)) == 679 # Ace-High Flush
@test NLH.rank((A, J, 7, 3, 2)) == 680 # Ace-High Flush
@test NLH.rank((A, J, 6, 5, 4)) == 681 # Ace-High Flush
@test NLH.rank((A, J, 6, 5, 3)) == 682 # Ace-High Flush
@test NLH.rank((A, J, 6, 5, 2)) == 683 # Ace-High Flush
@test NLH.rank((A, J, 6, 4, 3)) == 684 # Ace-High Flush
@test NLH.rank((A, J, 6, 4, 2)) == 685 # Ace-High Flush
@test NLH.rank((A, J, 6, 3, 2)) == 686 # Ace-High Flush
@test NLH.rank((A, J, 5, 4, 3)) == 687 # Ace-High Flush
@test NLH.rank((A, J, 5, 4, 2)) == 688 # Ace-High Flush
@test NLH.rank((A, J, 5, 3, 2)) == 689 # Ace-High Flush
@test NLH.rank((A, J, 4, 3, 2)) == 690 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 7)) == 691 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 6)) == 692 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 5)) == 693 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 4)) == 694 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 3)) == 695 # Ace-High Flush
@test NLH.rank((A, T, 9, 8, 2)) == 696 # Ace-High Flush
@test NLH.rank((A, T, 9, 7, 6)) == 697 # Ace-High Flush
@test NLH.rank((A, T, 9, 7, 5)) == 698 # Ace-High Flush
@test NLH.rank((A, T, 9, 7, 4)) == 699 # Ace-High Flush
@test NLH.rank((A, T, 9, 7, 3)) == 700 # Ace-High Flush
@test NLH.rank((A, T, 9, 7, 2)) == 701 # Ace-High Flush
@test NLH.rank((A, T, 9, 6, 5)) == 702 # Ace-High Flush
@test NLH.rank((A, T, 9, 6, 4)) == 703 # Ace-High Flush
@test NLH.rank((A, T, 9, 6, 3)) == 704 # Ace-High Flush
@test NLH.rank((A, T, 9, 6, 2)) == 705 # Ace-High Flush
@test NLH.rank((A, T, 9, 5, 4)) == 706 # Ace-High Flush
@test NLH.rank((A, T, 9, 5, 3)) == 707 # Ace-High Flush
@test NLH.rank((A, T, 9, 5, 2)) == 708 # Ace-High Flush
@test NLH.rank((A, T, 9, 4, 3)) == 709 # Ace-High Flush
@test NLH.rank((A, T, 9, 4, 2)) == 710 # Ace-High Flush
@test NLH.rank((A, T, 9, 3, 2)) == 711 # Ace-High Flush
@test NLH.rank((A, T, 8, 7, 6)) == 712 # Ace-High Flush
@test NLH.rank((A, T, 8, 7, 5)) == 713 # Ace-High Flush
@test NLH.rank((A, T, 8, 7, 4)) == 714 # Ace-High Flush
@test NLH.rank((A, T, 8, 7, 3)) == 715 # Ace-High Flush
@test NLH.rank((A, T, 8, 7, 2)) == 716 # Ace-High Flush
@test NLH.rank((A, T, 8, 6, 5)) == 717 # Ace-High Flush
@test NLH.rank((A, T, 8, 6, 4)) == 718 # Ace-High Flush
@test NLH.rank((A, T, 8, 6, 3)) == 719 # Ace-High Flush
@test NLH.rank((A, T, 8, 6, 2)) == 720 # Ace-High Flush
@test NLH.rank((A, T, 8, 5, 4)) == 721 # Ace-High Flush
@test NLH.rank((A, T, 8, 5, 3)) == 722 # Ace-High Flush
@test NLH.rank((A, T, 8, 5, 2)) == 723 # Ace-High Flush
@test NLH.rank((A, T, 8, 4, 3)) == 724 # Ace-High Flush
@test NLH.rank((A, T, 8, 4, 2)) == 725 # Ace-High Flush
@test NLH.rank((A, T, 8, 3, 2)) == 726 # Ace-High Flush
@test NLH.rank((A, T, 7, 6, 5)) == 727 # Ace-High Flush
@test NLH.rank((A, T, 7, 6, 4)) == 728 # Ace-High Flush
@test NLH.rank((A, T, 7, 6, 3)) == 729 # Ace-High Flush
@test NLH.rank((A, T, 7, 6, 2)) == 730 # Ace-High Flush
@test NLH.rank((A, T, 7, 5, 4)) == 731 # Ace-High Flush
@test NLH.rank((A, T, 7, 5, 3)) == 732 # Ace-High Flush
@test NLH.rank((A, T, 7, 5, 2)) == 733 # Ace-High Flush
@test NLH.rank((A, T, 7, 4, 3)) == 734 # Ace-High Flush
@test NLH.rank((A, T, 7, 4, 2)) == 735 # Ace-High Flush
@test NLH.rank((A, T, 7, 3, 2)) == 736 # Ace-High Flush
@test NLH.rank((A, T, 6, 5, 4)) == 737 # Ace-High Flush
@test NLH.rank((A, T, 6, 5, 3)) == 738 # Ace-High Flush
@test NLH.rank((A, T, 6, 5, 2)) == 739 # Ace-High Flush
@test NLH.rank((A, T, 6, 4, 3)) == 740 # Ace-High Flush
@test NLH.rank((A, T, 6, 4, 2)) == 741 # Ace-High Flush
@test NLH.rank((A, T, 6, 3, 2)) == 742 # Ace-High Flush
@test NLH.rank((A, T, 5, 4, 3)) == 743 # Ace-High Flush
@test NLH.rank((A, T, 5, 4, 2)) == 744 # Ace-High Flush
@test NLH.rank((A, T, 5, 3, 2)) == 745 # Ace-High Flush
@test NLH.rank((A, T, 4, 3, 2)) == 746 # Ace-High Flush
@test NLH.rank((A, 9, 8, 7, 6)) == 747 # Ace-High Flush
@test NLH.rank((A, 9, 8, 7, 5)) == 748 # Ace-High Flush
@test NLH.rank((A, 9, 8, 7, 4)) == 749 # Ace-High Flush
@test NLH.rank((A, 9, 8, 7, 3)) == 750 # Ace-High Flush
@test NLH.rank((A, 9, 8, 7, 2)) == 751 # Ace-High Flush
@test NLH.rank((A, 9, 8, 6, 5)) == 752 # Ace-High Flush
@test NLH.rank((A, 9, 8, 6, 4)) == 753 # Ace-High Flush
@test NLH.rank((A, 9, 8, 6, 3)) == 754 # Ace-High Flush
@test NLH.rank((A, 9, 8, 6, 2)) == 755 # Ace-High Flush
@test NLH.rank((A, 9, 8, 5, 4)) == 756 # Ace-High Flush
@test NLH.rank((A, 9, 8, 5, 3)) == 757 # Ace-High Flush
@test NLH.rank((A, 9, 8, 5, 2)) == 758 # Ace-High Flush
@test NLH.rank((A, 9, 8, 4, 3)) == 759 # Ace-High Flush
@test NLH.rank((A, 9, 8, 4, 2)) == 760 # Ace-High Flush
@test NLH.rank((A, 9, 8, 3, 2)) == 761 # Ace-High Flush
@test NLH.rank((A, 9, 7, 6, 5)) == 762 # Ace-High Flush
@test NLH.rank((A, 9, 7, 6, 4)) == 763 # Ace-High Flush
@test NLH.rank((A, 9, 7, 6, 3)) == 764 # Ace-High Flush
@test NLH.rank((A, 9, 7, 6, 2)) == 765 # Ace-High Flush
@test NLH.rank((A, 9, 7, 5, 4)) == 766 # Ace-High Flush
@test NLH.rank((A, 9, 7, 5, 3)) == 767 # Ace-High Flush
@test NLH.rank((A, 9, 7, 5, 2)) == 768 # Ace-High Flush
@test NLH.rank((A, 9, 7, 4, 3)) == 769 # Ace-High Flush
@test NLH.rank((A, 9, 7, 4, 2)) == 770 # Ace-High Flush
@test NLH.rank((A, 9, 7, 3, 2)) == 771 # Ace-High Flush
@test NLH.rank((A, 9, 6, 5, 4)) == 772 # Ace-High Flush
@test NLH.rank((A, 9, 6, 5, 3)) == 773 # Ace-High Flush
@test NLH.rank((A, 9, 6, 5, 2)) == 774 # Ace-High Flush
@test NLH.rank((A, 9, 6, 4, 3)) == 775 # Ace-High Flush
@test NLH.rank((A, 9, 6, 4, 2)) == 776 # Ace-High Flush
@test NLH.rank((A, 9, 6, 3, 2)) == 777 # Ace-High Flush
@test NLH.rank((A, 9, 5, 4, 3)) == 778 # Ace-High Flush
@test NLH.rank((A, 9, 5, 4, 2)) == 779 # Ace-High Flush
@test NLH.rank((A, 9, 5, 3, 2)) == 780 # Ace-High Flush
@test NLH.rank((A, 9, 4, 3, 2)) == 781 # Ace-High Flush
@test NLH.rank((A, 8, 7, 6, 5)) == 782 # Ace-High Flush
@test NLH.rank((A, 8, 7, 6, 4)) == 783 # Ace-High Flush
@test NLH.rank((A, 8, 7, 6, 3)) == 784 # Ace-High Flush
@test NLH.rank((A, 8, 7, 6, 2)) == 785 # Ace-High Flush
@test NLH.rank((A, 8, 7, 5, 4)) == 786 # Ace-High Flush
@test NLH.rank((A, 8, 7, 5, 3)) == 787 # Ace-High Flush
@test NLH.rank((A, 8, 7, 5, 2)) == 788 # Ace-High Flush
@test NLH.rank((A, 8, 7, 4, 3)) == 789 # Ace-High Flush
@test NLH.rank((A, 8, 7, 4, 2)) == 790 # Ace-High Flush
@test NLH.rank((A, 8, 7, 3, 2)) == 791 # Ace-High Flush
@test NLH.rank((A, 8, 6, 5, 4)) == 792 # Ace-High Flush
@test NLH.rank((A, 8, 6, 5, 3)) == 793 # Ace-High Flush
@test NLH.rank((A, 8, 6, 5, 2)) == 794 # Ace-High Flush
@test NLH.rank((A, 8, 6, 4, 3)) == 795 # Ace-High Flush
@test NLH.rank((A, 8, 6, 4, 2)) == 796 # Ace-High Flush
@test NLH.rank((A, 8, 6, 3, 2)) == 797 # Ace-High Flush
@test NLH.rank((A, 8, 5, 4, 3)) == 798 # Ace-High Flush
@test NLH.rank((A, 8, 5, 4, 2)) == 799 # Ace-High Flush
@test NLH.rank((A, 8, 5, 3, 2)) == 800 # Ace-High Flush
@test NLH.rank((A, 8, 4, 3, 2)) == 801 # Ace-High Flush
@test NLH.rank((A, 7, 6, 5, 4)) == 802 # Ace-High Flush
@test NLH.rank((A, 7, 6, 5, 3)) == 803 # Ace-High Flush
@test NLH.rank((A, 7, 6, 5, 2)) == 804 # Ace-High Flush
@test NLH.rank((A, 7, 6, 4, 3)) == 805 # Ace-High Flush
@test NLH.rank((A, 7, 6, 4, 2)) == 806 # Ace-High Flush
@test NLH.rank((A, 7, 6, 3, 2)) == 807 # Ace-High Flush
@test NLH.rank((A, 7, 5, 4, 3)) == 808 # Ace-High Flush
@test NLH.rank((A, 7, 5, 4, 2)) == 809 # Ace-High Flush
@test NLH.rank((A, 7, 5, 3, 2)) == 810 # Ace-High Flush
@test NLH.rank((A, 7, 4, 3, 2)) == 811 # Ace-High Flush
@test NLH.rank((A, 6, 5, 4, 3)) == 812 # Ace-High Flush
@test NLH.rank((A, 6, 5, 4, 2)) == 813 # Ace-High Flush
@test NLH.rank((A, 6, 5, 3, 2)) == 814 # Ace-High Flush
@test NLH.rank((A, 6, 4, 3, 2)) == 815 # Ace-High Flush
@test NLH.rank((K, Q, J, T, 8)) == 816 # King-High Flush
@test NLH.rank((K, Q, J, T, 7)) == 817 # King-High Flush
@test NLH.rank((K, Q, J, T, 6)) == 818 # King-High Flush
@test NLH.rank((K, Q, J, T, 5)) == 819 # King-High Flush
@test NLH.rank((K, Q, J, T, 4)) == 820 # King-High Flush
@test NLH.rank((K, Q, J, T, 3)) == 821 # King-High Flush
@test NLH.rank((K, Q, J, T, 2)) == 822 # King-High Flush
@test NLH.rank((K, Q, J, 9, 8)) == 823 # King-High Flush
@test NLH.rank((K, Q, J, 9, 7)) == 824 # King-High Flush
@test NLH.rank((K, Q, J, 9, 6)) == 825 # King-High Flush
@test NLH.rank((K, Q, J, 9, 5)) == 826 # King-High Flush
@test NLH.rank((K, Q, J, 9, 4)) == 827 # King-High Flush
@test NLH.rank((K, Q, J, 9, 3)) == 828 # King-High Flush
@test NLH.rank((K, Q, J, 9, 2)) == 829 # King-High Flush
@test NLH.rank((K, Q, J, 8, 7)) == 830 # King-High Flush
@test NLH.rank((K, Q, J, 8, 6)) == 831 # King-High Flush
@test NLH.rank((K, Q, J, 8, 5)) == 832 # King-High Flush
@test NLH.rank((K, Q, J, 8, 4)) == 833 # King-High Flush
@test NLH.rank((K, Q, J, 8, 3)) == 834 # King-High Flush
@test NLH.rank((K, Q, J, 8, 2)) == 835 # King-High Flush
@test NLH.rank((K, Q, J, 7, 6)) == 836 # King-High Flush
@test NLH.rank((K, Q, J, 7, 5)) == 837 # King-High Flush
@test NLH.rank((K, Q, J, 7, 4)) == 838 # King-High Flush
@test NLH.rank((K, Q, J, 7, 3)) == 839 # King-High Flush
@test NLH.rank((K, Q, J, 7, 2)) == 840 # King-High Flush
@test NLH.rank((K, Q, J, 6, 5)) == 841 # King-High Flush
@test NLH.rank((K, Q, J, 6, 4)) == 842 # King-High Flush
@test NLH.rank((K, Q, J, 6, 3)) == 843 # King-High Flush
@test NLH.rank((K, Q, J, 6, 2)) == 844 # King-High Flush
@test NLH.rank((K, Q, J, 5, 4)) == 845 # King-High Flush
@test NLH.rank((K, Q, J, 5, 3)) == 846 # King-High Flush
@test NLH.rank((K, Q, J, 5, 2)) == 847 # King-High Flush
@test NLH.rank((K, Q, J, 4, 3)) == 848 # King-High Flush
@test NLH.rank((K, Q, J, 4, 2)) == 849 # King-High Flush
@test NLH.rank((K, Q, J, 3, 2)) == 850 # King-High Flush
@test NLH.rank((K, Q, T, 9, 8)) == 851 # King-High Flush
@test NLH.rank((K, Q, T, 9, 7)) == 852 # King-High Flush
@test NLH.rank((K, Q, T, 9, 6)) == 853 # King-High Flush
@test NLH.rank((K, Q, T, 9, 5)) == 854 # King-High Flush
@test NLH.rank((K, Q, T, 9, 4)) == 855 # King-High Flush
@test NLH.rank((K, Q, T, 9, 3)) == 856 # King-High Flush
@test NLH.rank((K, Q, T, 9, 2)) == 857 # King-High Flush
@test NLH.rank((K, Q, T, 8, 7)) == 858 # King-High Flush
@test NLH.rank((K, Q, T, 8, 6)) == 859 # King-High Flush
@test NLH.rank((K, Q, T, 8, 5)) == 860 # King-High Flush
@test NLH.rank((K, Q, T, 8, 4)) == 861 # King-High Flush
@test NLH.rank((K, Q, T, 8, 3)) == 862 # King-High Flush
@test NLH.rank((K, Q, T, 8, 2)) == 863 # King-High Flush
@test NLH.rank((K, Q, T, 7, 6)) == 864 # King-High Flush
@test NLH.rank((K, Q, T, 7, 5)) == 865 # King-High Flush
@test NLH.rank((K, Q, T, 7, 4)) == 866 # King-High Flush
@test NLH.rank((K, Q, T, 7, 3)) == 867 # King-High Flush
@test NLH.rank((K, Q, T, 7, 2)) == 868 # King-High Flush
@test NLH.rank((K, Q, T, 6, 5)) == 869 # King-High Flush
@test NLH.rank((K, Q, T, 6, 4)) == 870 # King-High Flush
@test NLH.rank((K, Q, T, 6, 3)) == 871 # King-High Flush
@test NLH.rank((K, Q, T, 6, 2)) == 872 # King-High Flush
@test NLH.rank((K, Q, T, 5, 4)) == 873 # King-High Flush
@test NLH.rank((K, Q, T, 5, 3)) == 874 # King-High Flush
@test NLH.rank((K, Q, T, 5, 2)) == 875 # King-High Flush
@test NLH.rank((K, Q, T, 4, 3)) == 876 # King-High Flush
@test NLH.rank((K, Q, T, 4, 2)) == 877 # King-High Flush
@test NLH.rank((K, Q, T, 3, 2)) == 878 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 7)) == 879 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 6)) == 880 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 5)) == 881 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 4)) == 882 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 3)) == 883 # King-High Flush
@test NLH.rank((K, Q, 9, 8, 2)) == 884 # King-High Flush
@test NLH.rank((K, Q, 9, 7, 6)) == 885 # King-High Flush
@test NLH.rank((K, Q, 9, 7, 5)) == 886 # King-High Flush
@test NLH.rank((K, Q, 9, 7, 4)) == 887 # King-High Flush
@test NLH.rank((K, Q, 9, 7, 3)) == 888 # King-High Flush
@test NLH.rank((K, Q, 9, 7, 2)) == 889 # King-High Flush
@test NLH.rank((K, Q, 9, 6, 5)) == 890 # King-High Flush
@test NLH.rank((K, Q, 9, 6, 4)) == 891 # King-High Flush
@test NLH.rank((K, Q, 9, 6, 3)) == 892 # King-High Flush
@test NLH.rank((K, Q, 9, 6, 2)) == 893 # King-High Flush
@test NLH.rank((K, Q, 9, 5, 4)) == 894 # King-High Flush
@test NLH.rank((K, Q, 9, 5, 3)) == 895 # King-High Flush
@test NLH.rank((K, Q, 9, 5, 2)) == 896 # King-High Flush
@test NLH.rank((K, Q, 9, 4, 3)) == 897 # King-High Flush
@test NLH.rank((K, Q, 9, 4, 2)) == 898 # King-High Flush
@test NLH.rank((K, Q, 9, 3, 2)) == 899 # King-High Flush
@test NLH.rank((K, Q, 8, 7, 6)) == 900 # King-High Flush
@test NLH.rank((K, Q, 8, 7, 5)) == 901 # King-High Flush
@test NLH.rank((K, Q, 8, 7, 4)) == 902 # King-High Flush
@test NLH.rank((K, Q, 8, 7, 3)) == 903 # King-High Flush
@test NLH.rank((K, Q, 8, 7, 2)) == 904 # King-High Flush
@test NLH.rank((K, Q, 8, 6, 5)) == 905 # King-High Flush
@test NLH.rank((K, Q, 8, 6, 4)) == 906 # King-High Flush
@test NLH.rank((K, Q, 8, 6, 3)) == 907 # King-High Flush
@test NLH.rank((K, Q, 8, 6, 2)) == 908 # King-High Flush
@test NLH.rank((K, Q, 8, 5, 4)) == 909 # King-High Flush
@test NLH.rank((K, Q, 8, 5, 3)) == 910 # King-High Flush
@test NLH.rank((K, Q, 8, 5, 2)) == 911 # King-High Flush
@test NLH.rank((K, Q, 8, 4, 3)) == 912 # King-High Flush
@test NLH.rank((K, Q, 8, 4, 2)) == 913 # King-High Flush
@test NLH.rank((K, Q, 8, 3, 2)) == 914 # King-High Flush
@test NLH.rank((K, Q, 7, 6, 5)) == 915 # King-High Flush
@test NLH.rank((K, Q, 7, 6, 4)) == 916 # King-High Flush
@test NLH.rank((K, Q, 7, 6, 3)) == 917 # King-High Flush
@test NLH.rank((K, Q, 7, 6, 2)) == 918 # King-High Flush
@test NLH.rank((K, Q, 7, 5, 4)) == 919 # King-High Flush
@test NLH.rank((K, Q, 7, 5, 3)) == 920 # King-High Flush
@test NLH.rank((K, Q, 7, 5, 2)) == 921 # King-High Flush
@test NLH.rank((K, Q, 7, 4, 3)) == 922 # King-High Flush
@test NLH.rank((K, Q, 7, 4, 2)) == 923 # King-High Flush
@test NLH.rank((K, Q, 7, 3, 2)) == 924 # King-High Flush
@test NLH.rank((K, Q, 6, 5, 4)) == 925 # King-High Flush
@test NLH.rank((K, Q, 6, 5, 3)) == 926 # King-High Flush
@test NLH.rank((K, Q, 6, 5, 2)) == 927 # King-High Flush
@test NLH.rank((K, Q, 6, 4, 3)) == 928 # King-High Flush
@test NLH.rank((K, Q, 6, 4, 2)) == 929 # King-High Flush
@test NLH.rank((K, Q, 6, 3, 2)) == 930 # King-High Flush
@test NLH.rank((K, Q, 5, 4, 3)) == 931 # King-High Flush
@test NLH.rank((K, Q, 5, 4, 2)) == 932 # King-High Flush
@test NLH.rank((K, Q, 5, 3, 2)) == 933 # King-High Flush
@test NLH.rank((K, Q, 4, 3, 2)) == 934 # King-High Flush
@test NLH.rank((K, J, T, 9, 8)) == 935 # King-High Flush
@test NLH.rank((K, J, T, 9, 7)) == 936 # King-High Flush
@test NLH.rank((K, J, T, 9, 6)) == 937 # King-High Flush
@test NLH.rank((K, J, T, 9, 5)) == 938 # King-High Flush
@test NLH.rank((K, J, T, 9, 4)) == 939 # King-High Flush
@test NLH.rank((K, J, T, 9, 3)) == 940 # King-High Flush
@test NLH.rank((K, J, T, 9, 2)) == 941 # King-High Flush
@test NLH.rank((K, J, T, 8, 7)) == 942 # King-High Flush
@test NLH.rank((K, J, T, 8, 6)) == 943 # King-High Flush
@test NLH.rank((K, J, T, 8, 5)) == 944 # King-High Flush
@test NLH.rank((K, J, T, 8, 4)) == 945 # King-High Flush
@test NLH.rank((K, J, T, 8, 3)) == 946 # King-High Flush
@test NLH.rank((K, J, T, 8, 2)) == 947 # King-High Flush
@test NLH.rank((K, J, T, 7, 6)) == 948 # King-High Flush
@test NLH.rank((K, J, T, 7, 5)) == 949 # King-High Flush
@test NLH.rank((K, J, T, 7, 4)) == 950 # King-High Flush
@test NLH.rank((K, J, T, 7, 3)) == 951 # King-High Flush
@test NLH.rank((K, J, T, 7, 2)) == 952 # King-High Flush
@test NLH.rank((K, J, T, 6, 5)) == 953 # King-High Flush
@test NLH.rank((K, J, T, 6, 4)) == 954 # King-High Flush
@test NLH.rank((K, J, T, 6, 3)) == 955 # King-High Flush
@test NLH.rank((K, J, T, 6, 2)) == 956 # King-High Flush
@test NLH.rank((K, J, T, 5, 4)) == 957 # King-High Flush
@test NLH.rank((K, J, T, 5, 3)) == 958 # King-High Flush
@test NLH.rank((K, J, T, 5, 2)) == 959 # King-High Flush
@test NLH.rank((K, J, T, 4, 3)) == 960 # King-High Flush
@test NLH.rank((K, J, T, 4, 2)) == 961 # King-High Flush
@test NLH.rank((K, J, T, 3, 2)) == 962 # King-High Flush
@test NLH.rank((K, J, 9, 8, 7)) == 963 # King-High Flush
@test NLH.rank((K, J, 9, 8, 6)) == 964 # King-High Flush
@test NLH.rank((K, J, 9, 8, 5)) == 965 # King-High Flush
@test NLH.rank((K, J, 9, 8, 4)) == 966 # King-High Flush
@test NLH.rank((K, J, 9, 8, 3)) == 967 # King-High Flush
@test NLH.rank((K, J, 9, 8, 2)) == 968 # King-High Flush
@test NLH.rank((K, J, 9, 7, 6)) == 969 # King-High Flush
@test NLH.rank((K, J, 9, 7, 5)) == 970 # King-High Flush
@test NLH.rank((K, J, 9, 7, 4)) == 971 # King-High Flush
@test NLH.rank((K, J, 9, 7, 3)) == 972 # King-High Flush
@test NLH.rank((K, J, 9, 7, 2)) == 973 # King-High Flush
@test NLH.rank((K, J, 9, 6, 5)) == 974 # King-High Flush
@test NLH.rank((K, J, 9, 6, 4)) == 975 # King-High Flush
@test NLH.rank((K, J, 9, 6, 3)) == 976 # King-High Flush
@test NLH.rank((K, J, 9, 6, 2)) == 977 # King-High Flush
@test NLH.rank((K, J, 9, 5, 4)) == 978 # King-High Flush
@test NLH.rank((K, J, 9, 5, 3)) == 979 # King-High Flush
@test NLH.rank((K, J, 9, 5, 2)) == 980 # King-High Flush
@test NLH.rank((K, J, 9, 4, 3)) == 981 # King-High Flush
@test NLH.rank((K, J, 9, 4, 2)) == 982 # King-High Flush
@test NLH.rank((K, J, 9, 3, 2)) == 983 # King-High Flush
@test NLH.rank((K, J, 8, 7, 6)) == 984 # King-High Flush
@test NLH.rank((K, J, 8, 7, 5)) == 985 # King-High Flush
@test NLH.rank((K, J, 8, 7, 4)) == 986 # King-High Flush
@test NLH.rank((K, J, 8, 7, 3)) == 987 # King-High Flush
@test NLH.rank((K, J, 8, 7, 2)) == 988 # King-High Flush
@test NLH.rank((K, J, 8, 6, 5)) == 989 # King-High Flush
@test NLH.rank((K, J, 8, 6, 4)) == 990 # King-High Flush
@test NLH.rank((K, J, 8, 6, 3)) == 991 # King-High Flush
@test NLH.rank((K, J, 8, 6, 2)) == 992 # King-High Flush
@test NLH.rank((K, J, 8, 5, 4)) == 993 # King-High Flush
@test NLH.rank((K, J, 8, 5, 3)) == 994 # King-High Flush
@test NLH.rank((K, J, 8, 5, 2)) == 995 # King-High Flush
@test NLH.rank((K, J, 8, 4, 3)) == 996 # King-High Flush
@test NLH.rank((K, J, 8, 4, 2)) == 997 # King-High Flush
@test NLH.rank((K, J, 8, 3, 2)) == 998 # King-High Flush
@test NLH.rank((K, J, 7, 6, 5)) == 999 # King-High Flush
@test NLH.rank((K, J, 7, 6, 4)) == 1000 # King-High Flush
@test NLH.rank((K, J, 7, 6, 3)) == 1001 # King-High Flush
@test NLH.rank((K, J, 7, 6, 2)) == 1002 # King-High Flush
@test NLH.rank((K, J, 7, 5, 4)) == 1003 # King-High Flush
@test NLH.rank((K, J, 7, 5, 3)) == 1004 # King-High Flush
@test NLH.rank((K, J, 7, 5, 2)) == 1005 # King-High Flush
@test NLH.rank((K, J, 7, 4, 3)) == 1006 # King-High Flush
@test NLH.rank((K, J, 7, 4, 2)) == 1007 # King-High Flush
@test NLH.rank((K, J, 7, 3, 2)) == 1008 # King-High Flush
@test NLH.rank((K, J, 6, 5, 4)) == 1009 # King-High Flush
@test NLH.rank((K, J, 6, 5, 3)) == 1010 # King-High Flush
@test NLH.rank((K, J, 6, 5, 2)) == 1011 # King-High Flush
@test NLH.rank((K, J, 6, 4, 3)) == 1012 # King-High Flush
@test NLH.rank((K, J, 6, 4, 2)) == 1013 # King-High Flush
@test NLH.rank((K, J, 6, 3, 2)) == 1014 # King-High Flush
@test NLH.rank((K, J, 5, 4, 3)) == 1015 # King-High Flush
@test NLH.rank((K, J, 5, 4, 2)) == 1016 # King-High Flush
@test NLH.rank((K, J, 5, 3, 2)) == 1017 # King-High Flush
@test NLH.rank((K, J, 4, 3, 2)) == 1018 # King-High Flush
@test NLH.rank((K, T, 9, 8, 7)) == 1019 # King-High Flush
@test NLH.rank((K, T, 9, 8, 6)) == 1020 # King-High Flush
@test NLH.rank((K, T, 9, 8, 5)) == 1021 # King-High Flush
@test NLH.rank((K, T, 9, 8, 4)) == 1022 # King-High Flush
@test NLH.rank((K, T, 9, 8, 3)) == 1023 # King-High Flush
@test NLH.rank((K, T, 9, 8, 2)) == 1024 # King-High Flush
@test NLH.rank((K, T, 9, 7, 6)) == 1025 # King-High Flush
@test NLH.rank((K, T, 9, 7, 5)) == 1026 # King-High Flush
@test NLH.rank((K, T, 9, 7, 4)) == 1027 # King-High Flush
@test NLH.rank((K, T, 9, 7, 3)) == 1028 # King-High Flush
@test NLH.rank((K, T, 9, 7, 2)) == 1029 # King-High Flush
@test NLH.rank((K, T, 9, 6, 5)) == 1030 # King-High Flush
@test NLH.rank((K, T, 9, 6, 4)) == 1031 # King-High Flush
@test NLH.rank((K, T, 9, 6, 3)) == 1032 # King-High Flush
@test NLH.rank((K, T, 9, 6, 2)) == 1033 # King-High Flush
@test NLH.rank((K, T, 9, 5, 4)) == 1034 # King-High Flush
@test NLH.rank((K, T, 9, 5, 3)) == 1035 # King-High Flush
@test NLH.rank((K, T, 9, 5, 2)) == 1036 # King-High Flush
@test NLH.rank((K, T, 9, 4, 3)) == 1037 # King-High Flush
@test NLH.rank((K, T, 9, 4, 2)) == 1038 # King-High Flush
@test NLH.rank((K, T, 9, 3, 2)) == 1039 # King-High Flush
@test NLH.rank((K, T, 8, 7, 6)) == 1040 # King-High Flush
@test NLH.rank((K, T, 8, 7, 5)) == 1041 # King-High Flush
@test NLH.rank((K, T, 8, 7, 4)) == 1042 # King-High Flush
@test NLH.rank((K, T, 8, 7, 3)) == 1043 # King-High Flush
@test NLH.rank((K, T, 8, 7, 2)) == 1044 # King-High Flush
@test NLH.rank((K, T, 8, 6, 5)) == 1045 # King-High Flush
@test NLH.rank((K, T, 8, 6, 4)) == 1046 # King-High Flush
@test NLH.rank((K, T, 8, 6, 3)) == 1047 # King-High Flush
@test NLH.rank((K, T, 8, 6, 2)) == 1048 # King-High Flush
@test NLH.rank((K, T, 8, 5, 4)) == 1049 # King-High Flush
@test NLH.rank((K, T, 8, 5, 3)) == 1050 # King-High Flush
@test NLH.rank((K, T, 8, 5, 2)) == 1051 # King-High Flush
@test NLH.rank((K, T, 8, 4, 3)) == 1052 # King-High Flush
@test NLH.rank((K, T, 8, 4, 2)) == 1053 # King-High Flush
@test NLH.rank((K, T, 8, 3, 2)) == 1054 # King-High Flush
@test NLH.rank((K, T, 7, 6, 5)) == 1055 # King-High Flush
@test NLH.rank((K, T, 7, 6, 4)) == 1056 # King-High Flush
@test NLH.rank((K, T, 7, 6, 3)) == 1057 # King-High Flush
@test NLH.rank((K, T, 7, 6, 2)) == 1058 # King-High Flush
@test NLH.rank((K, T, 7, 5, 4)) == 1059 # King-High Flush
@test NLH.rank((K, T, 7, 5, 3)) == 1060 # King-High Flush
@test NLH.rank((K, T, 7, 5, 2)) == 1061 # King-High Flush
@test NLH.rank((K, T, 7, 4, 3)) == 1062 # King-High Flush
@test NLH.rank((K, T, 7, 4, 2)) == 1063 # King-High Flush
@test NLH.rank((K, T, 7, 3, 2)) == 1064 # King-High Flush
@test NLH.rank((K, T, 6, 5, 4)) == 1065 # King-High Flush
@test NLH.rank((K, T, 6, 5, 3)) == 1066 # King-High Flush
@test NLH.rank((K, T, 6, 5, 2)) == 1067 # King-High Flush
@test NLH.rank((K, T, 6, 4, 3)) == 1068 # King-High Flush
@test NLH.rank((K, T, 6, 4, 2)) == 1069 # King-High Flush
@test NLH.rank((K, T, 6, 3, 2)) == 1070 # King-High Flush
@test NLH.rank((K, T, 5, 4, 3)) == 1071 # King-High Flush
@test NLH.rank((K, T, 5, 4, 2)) == 1072 # King-High Flush
@test NLH.rank((K, T, 5, 3, 2)) == 1073 # King-High Flush
@test NLH.rank((K, T, 4, 3, 2)) == 1074 # King-High Flush
@test NLH.rank((K, 9, 8, 7, 6)) == 1075 # King-High Flush
@test NLH.rank((K, 9, 8, 7, 5)) == 1076 # King-High Flush
@test NLH.rank((K, 9, 8, 7, 4)) == 1077 # King-High Flush
@test NLH.rank((K, 9, 8, 7, 3)) == 1078 # King-High Flush
@test NLH.rank((K, 9, 8, 7, 2)) == 1079 # King-High Flush
@test NLH.rank((K, 9, 8, 6, 5)) == 1080 # King-High Flush
@test NLH.rank((K, 9, 8, 6, 4)) == 1081 # King-High Flush
@test NLH.rank((K, 9, 8, 6, 3)) == 1082 # King-High Flush
@test NLH.rank((K, 9, 8, 6, 2)) == 1083 # King-High Flush
@test NLH.rank((K, 9, 8, 5, 4)) == 1084 # King-High Flush
@test NLH.rank((K, 9, 8, 5, 3)) == 1085 # King-High Flush
@test NLH.rank((K, 9, 8, 5, 2)) == 1086 # King-High Flush
@test NLH.rank((K, 9, 8, 4, 3)) == 1087 # King-High Flush
@test NLH.rank((K, 9, 8, 4, 2)) == 1088 # King-High Flush
@test NLH.rank((K, 9, 8, 3, 2)) == 1089 # King-High Flush
@test NLH.rank((K, 9, 7, 6, 5)) == 1090 # King-High Flush
@test NLH.rank((K, 9, 7, 6, 4)) == 1091 # King-High Flush
@test NLH.rank((K, 9, 7, 6, 3)) == 1092 # King-High Flush
@test NLH.rank((K, 9, 7, 6, 2)) == 1093 # King-High Flush
@test NLH.rank((K, 9, 7, 5, 4)) == 1094 # King-High Flush
@test NLH.rank((K, 9, 7, 5, 3)) == 1095 # King-High Flush
@test NLH.rank((K, 9, 7, 5, 2)) == 1096 # King-High Flush
@test NLH.rank((K, 9, 7, 4, 3)) == 1097 # King-High Flush
@test NLH.rank((K, 9, 7, 4, 2)) == 1098 # King-High Flush
@test NLH.rank((K, 9, 7, 3, 2)) == 1099 # King-High Flush
@test NLH.rank((K, 9, 6, 5, 4)) == 1100 # King-High Flush
@test NLH.rank((K, 9, 6, 5, 3)) == 1101 # King-High Flush
@test NLH.rank((K, 9, 6, 5, 2)) == 1102 # King-High Flush
@test NLH.rank((K, 9, 6, 4, 3)) == 1103 # King-High Flush
@test NLH.rank((K, 9, 6, 4, 2)) == 1104 # King-High Flush
@test NLH.rank((K, 9, 6, 3, 2)) == 1105 # King-High Flush
@test NLH.rank((K, 9, 5, 4, 3)) == 1106 # King-High Flush
@test NLH.rank((K, 9, 5, 4, 2)) == 1107 # King-High Flush
@test NLH.rank((K, 9, 5, 3, 2)) == 1108 # King-High Flush
@test NLH.rank((K, 9, 4, 3, 2)) == 1109 # King-High Flush
@test NLH.rank((K, 8, 7, 6, 5)) == 1110 # King-High Flush
@test NLH.rank((K, 8, 7, 6, 4)) == 1111 # King-High Flush
@test NLH.rank((K, 8, 7, 6, 3)) == 1112 # King-High Flush
@test NLH.rank((K, 8, 7, 6, 2)) == 1113 # King-High Flush
@test NLH.rank((K, 8, 7, 5, 4)) == 1114 # King-High Flush
@test NLH.rank((K, 8, 7, 5, 3)) == 1115 # King-High Flush
@test NLH.rank((K, 8, 7, 5, 2)) == 1116 # King-High Flush
@test NLH.rank((K, 8, 7, 4, 3)) == 1117 # King-High Flush
@test NLH.rank((K, 8, 7, 4, 2)) == 1118 # King-High Flush
@test NLH.rank((K, 8, 7, 3, 2)) == 1119 # King-High Flush
@test NLH.rank((K, 8, 6, 5, 4)) == 1120 # King-High Flush
@test NLH.rank((K, 8, 6, 5, 3)) == 1121 # King-High Flush
@test NLH.rank((K, 8, 6, 5, 2)) == 1122 # King-High Flush
@test NLH.rank((K, 8, 6, 4, 3)) == 1123 # King-High Flush
@test NLH.rank((K, 8, 6, 4, 2)) == 1124 # King-High Flush
@test NLH.rank((K, 8, 6, 3, 2)) == 1125 # King-High Flush
@test NLH.rank((K, 8, 5, 4, 3)) == 1126 # King-High Flush
@test NLH.rank((K, 8, 5, 4, 2)) == 1127 # King-High Flush
@test NLH.rank((K, 8, 5, 3, 2)) == 1128 # King-High Flush
@test NLH.rank((K, 8, 4, 3, 2)) == 1129 # King-High Flush
@test NLH.rank((K, 7, 6, 5, 4)) == 1130 # King-High Flush
@test NLH.rank((K, 7, 6, 5, 3)) == 1131 # King-High Flush
@test NLH.rank((K, 7, 6, 5, 2)) == 1132 # King-High Flush
@test NLH.rank((K, 7, 6, 4, 3)) == 1133 # King-High Flush
@test NLH.rank((K, 7, 6, 4, 2)) == 1134 # King-High Flush
@test NLH.rank((K, 7, 6, 3, 2)) == 1135 # King-High Flush
@test NLH.rank((K, 7, 5, 4, 3)) == 1136 # King-High Flush
@test NLH.rank((K, 7, 5, 4, 2)) == 1137 # King-High Flush
@test NLH.rank((K, 7, 5, 3, 2)) == 1138 # King-High Flush
@test NLH.rank((K, 7, 4, 3, 2)) == 1139 # King-High Flush
@test NLH.rank((K, 6, 5, 4, 3)) == 1140 # King-High Flush
@test NLH.rank((K, 6, 5, 4, 2)) == 1141 # King-High Flush
@test NLH.rank((K, 6, 5, 3, 2)) == 1142 # King-High Flush
@test NLH.rank((K, 6, 4, 3, 2)) == 1143 # King-High Flush
@test NLH.rank((K, 5, 4, 3, 2)) == 1144 # King-High Flush
@test NLH.rank((Q, J, T, 9, 7)) == 1145 # Queen-High Flush
@test NLH.rank((Q, J, T, 9, 6)) == 1146 # Queen-High Flush
@test NLH.rank((Q, J, T, 9, 5)) == 1147 # Queen-High Flush
@test NLH.rank((Q, J, T, 9, 4)) == 1148 # Queen-High Flush
@test NLH.rank((Q, J, T, 9, 3)) == 1149 # Queen-High Flush
@test NLH.rank((Q, J, T, 9, 2)) == 1150 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 7)) == 1151 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 6)) == 1152 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 5)) == 1153 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 4)) == 1154 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 3)) == 1155 # Queen-High Flush
@test NLH.rank((Q, J, T, 8, 2)) == 1156 # Queen-High Flush
@test NLH.rank((Q, J, T, 7, 6)) == 1157 # Queen-High Flush
@test NLH.rank((Q, J, T, 7, 5)) == 1158 # Queen-High Flush
@test NLH.rank((Q, J, T, 7, 4)) == 1159 # Queen-High Flush
@test NLH.rank((Q, J, T, 7, 3)) == 1160 # Queen-High Flush
@test NLH.rank((Q, J, T, 7, 2)) == 1161 # Queen-High Flush
@test NLH.rank((Q, J, T, 6, 5)) == 1162 # Queen-High Flush
@test NLH.rank((Q, J, T, 6, 4)) == 1163 # Queen-High Flush
@test NLH.rank((Q, J, T, 6, 3)) == 1164 # Queen-High Flush
@test NLH.rank((Q, J, T, 6, 2)) == 1165 # Queen-High Flush
@test NLH.rank((Q, J, T, 5, 4)) == 1166 # Queen-High Flush
@test NLH.rank((Q, J, T, 5, 3)) == 1167 # Queen-High Flush
@test NLH.rank((Q, J, T, 5, 2)) == 1168 # Queen-High Flush
@test NLH.rank((Q, J, T, 4, 3)) == 1169 # Queen-High Flush
@test NLH.rank((Q, J, T, 4, 2)) == 1170 # Queen-High Flush
@test NLH.rank((Q, J, T, 3, 2)) == 1171 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 7)) == 1172 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 6)) == 1173 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 5)) == 1174 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 4)) == 1175 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 3)) == 1176 # Queen-High Flush
@test NLH.rank((Q, J, 9, 8, 2)) == 1177 # Queen-High Flush
@test NLH.rank((Q, J, 9, 7, 6)) == 1178 # Queen-High Flush
@test NLH.rank((Q, J, 9, 7, 5)) == 1179 # Queen-High Flush
@test NLH.rank((Q, J, 9, 7, 4)) == 1180 # Queen-High Flush
@test NLH.rank((Q, J, 9, 7, 3)) == 1181 # Queen-High Flush
@test NLH.rank((Q, J, 9, 7, 2)) == 1182 # Queen-High Flush
@test NLH.rank((Q, J, 9, 6, 5)) == 1183 # Queen-High Flush
@test NLH.rank((Q, J, 9, 6, 4)) == 1184 # Queen-High Flush
@test NLH.rank((Q, J, 9, 6, 3)) == 1185 # Queen-High Flush
@test NLH.rank((Q, J, 9, 6, 2)) == 1186 # Queen-High Flush
@test NLH.rank((Q, J, 9, 5, 4)) == 1187 # Queen-High Flush
@test NLH.rank((Q, J, 9, 5, 3)) == 1188 # Queen-High Flush
@test NLH.rank((Q, J, 9, 5, 2)) == 1189 # Queen-High Flush
@test NLH.rank((Q, J, 9, 4, 3)) == 1190 # Queen-High Flush
@test NLH.rank((Q, J, 9, 4, 2)) == 1191 # Queen-High Flush
@test NLH.rank((Q, J, 9, 3, 2)) == 1192 # Queen-High Flush
@test NLH.rank((Q, J, 8, 7, 6)) == 1193 # Queen-High Flush
@test NLH.rank((Q, J, 8, 7, 5)) == 1194 # Queen-High Flush
@test NLH.rank((Q, J, 8, 7, 4)) == 1195 # Queen-High Flush
@test NLH.rank((Q, J, 8, 7, 3)) == 1196 # Queen-High Flush
@test NLH.rank((Q, J, 8, 7, 2)) == 1197 # Queen-High Flush
@test NLH.rank((Q, J, 8, 6, 5)) == 1198 # Queen-High Flush
@test NLH.rank((Q, J, 8, 6, 4)) == 1199 # Queen-High Flush
@test NLH.rank((Q, J, 8, 6, 3)) == 1200 # Queen-High Flush
@test NLH.rank((Q, J, 8, 6, 2)) == 1201 # Queen-High Flush
@test NLH.rank((Q, J, 8, 5, 4)) == 1202 # Queen-High Flush
@test NLH.rank((Q, J, 8, 5, 3)) == 1203 # Queen-High Flush
@test NLH.rank((Q, J, 8, 5, 2)) == 1204 # Queen-High Flush
@test NLH.rank((Q, J, 8, 4, 3)) == 1205 # Queen-High Flush
@test NLH.rank((Q, J, 8, 4, 2)) == 1206 # Queen-High Flush
@test NLH.rank((Q, J, 8, 3, 2)) == 1207 # Queen-High Flush
@test NLH.rank((Q, J, 7, 6, 5)) == 1208 # Queen-High Flush
@test NLH.rank((Q, J, 7, 6, 4)) == 1209 # Queen-High Flush
@test NLH.rank((Q, J, 7, 6, 3)) == 1210 # Queen-High Flush
@test NLH.rank((Q, J, 7, 6, 2)) == 1211 # Queen-High Flush
@test NLH.rank((Q, J, 7, 5, 4)) == 1212 # Queen-High Flush
@test NLH.rank((Q, J, 7, 5, 3)) == 1213 # Queen-High Flush
@test NLH.rank((Q, J, 7, 5, 2)) == 1214 # Queen-High Flush
@test NLH.rank((Q, J, 7, 4, 3)) == 1215 # Queen-High Flush
@test NLH.rank((Q, J, 7, 4, 2)) == 1216 # Queen-High Flush
@test NLH.rank((Q, J, 7, 3, 2)) == 1217 # Queen-High Flush
@test NLH.rank((Q, J, 6, 5, 4)) == 1218 # Queen-High Flush
@test NLH.rank((Q, J, 6, 5, 3)) == 1219 # Queen-High Flush
@test NLH.rank((Q, J, 6, 5, 2)) == 1220 # Queen-High Flush
@test NLH.rank((Q, J, 6, 4, 3)) == 1221 # Queen-High Flush
@test NLH.rank((Q, J, 6, 4, 2)) == 1222 # Queen-High Flush
@test NLH.rank((Q, J, 6, 3, 2)) == 1223 # Queen-High Flush
@test NLH.rank((Q, J, 5, 4, 3)) == 1224 # Queen-High Flush
@test NLH.rank((Q, J, 5, 4, 2)) == 1225 # Queen-High Flush
@test NLH.rank((Q, J, 5, 3, 2)) == 1226 # Queen-High Flush
@test NLH.rank((Q, J, 4, 3, 2)) == 1227 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 7)) == 1228 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 6)) == 1229 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 5)) == 1230 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 4)) == 1231 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 3)) == 1232 # Queen-High Flush
@test NLH.rank((Q, T, 9, 8, 2)) == 1233 # Queen-High Flush
@test NLH.rank((Q, T, 9, 7, 6)) == 1234 # Queen-High Flush
@test NLH.rank((Q, T, 9, 7, 5)) == 1235 # Queen-High Flush
@test NLH.rank((Q, T, 9, 7, 4)) == 1236 # Queen-High Flush
@test NLH.rank((Q, T, 9, 7, 3)) == 1237 # Queen-High Flush
@test NLH.rank((Q, T, 9, 7, 2)) == 1238 # Queen-High Flush
@test NLH.rank((Q, T, 9, 6, 5)) == 1239 # Queen-High Flush
@test NLH.rank((Q, T, 9, 6, 4)) == 1240 # Queen-High Flush
@test NLH.rank((Q, T, 9, 6, 3)) == 1241 # Queen-High Flush
@test NLH.rank((Q, T, 9, 6, 2)) == 1242 # Queen-High Flush
@test NLH.rank((Q, T, 9, 5, 4)) == 1243 # Queen-High Flush
@test NLH.rank((Q, T, 9, 5, 3)) == 1244 # Queen-High Flush
@test NLH.rank((Q, T, 9, 5, 2)) == 1245 # Queen-High Flush
@test NLH.rank((Q, T, 9, 4, 3)) == 1246 # Queen-High Flush
@test NLH.rank((Q, T, 9, 4, 2)) == 1247 # Queen-High Flush
@test NLH.rank((Q, T, 9, 3, 2)) == 1248 # Queen-High Flush
@test NLH.rank((Q, T, 8, 7, 6)) == 1249 # Queen-High Flush
@test NLH.rank((Q, T, 8, 7, 5)) == 1250 # Queen-High Flush
@test NLH.rank((Q, T, 8, 7, 4)) == 1251 # Queen-High Flush
@test NLH.rank((Q, T, 8, 7, 3)) == 1252 # Queen-High Flush
@test NLH.rank((Q, T, 8, 7, 2)) == 1253 # Queen-High Flush
@test NLH.rank((Q, T, 8, 6, 5)) == 1254 # Queen-High Flush
@test NLH.rank((Q, T, 8, 6, 4)) == 1255 # Queen-High Flush
@test NLH.rank((Q, T, 8, 6, 3)) == 1256 # Queen-High Flush
@test NLH.rank((Q, T, 8, 6, 2)) == 1257 # Queen-High Flush
@test NLH.rank((Q, T, 8, 5, 4)) == 1258 # Queen-High Flush
@test NLH.rank((Q, T, 8, 5, 3)) == 1259 # Queen-High Flush
@test NLH.rank((Q, T, 8, 5, 2)) == 1260 # Queen-High Flush
@test NLH.rank((Q, T, 8, 4, 3)) == 1261 # Queen-High Flush
@test NLH.rank((Q, T, 8, 4, 2)) == 1262 # Queen-High Flush
@test NLH.rank((Q, T, 8, 3, 2)) == 1263 # Queen-High Flush
@test NLH.rank((Q, T, 7, 6, 5)) == 1264 # Queen-High Flush
@test NLH.rank((Q, T, 7, 6, 4)) == 1265 # Queen-High Flush
@test NLH.rank((Q, T, 7, 6, 3)) == 1266 # Queen-High Flush
@test NLH.rank((Q, T, 7, 6, 2)) == 1267 # Queen-High Flush
@test NLH.rank((Q, T, 7, 5, 4)) == 1268 # Queen-High Flush
@test NLH.rank((Q, T, 7, 5, 3)) == 1269 # Queen-High Flush
@test NLH.rank((Q, T, 7, 5, 2)) == 1270 # Queen-High Flush
@test NLH.rank((Q, T, 7, 4, 3)) == 1271 # Queen-High Flush
@test NLH.rank((Q, T, 7, 4, 2)) == 1272 # Queen-High Flush
@test NLH.rank((Q, T, 7, 3, 2)) == 1273 # Queen-High Flush
@test NLH.rank((Q, T, 6, 5, 4)) == 1274 # Queen-High Flush
@test NLH.rank((Q, T, 6, 5, 3)) == 1275 # Queen-High Flush
@test NLH.rank((Q, T, 6, 5, 2)) == 1276 # Queen-High Flush
@test NLH.rank((Q, T, 6, 4, 3)) == 1277 # Queen-High Flush
@test NLH.rank((Q, T, 6, 4, 2)) == 1278 # Queen-High Flush
@test NLH.rank((Q, T, 6, 3, 2)) == 1279 # Queen-High Flush
@test NLH.rank((Q, T, 5, 4, 3)) == 1280 # Queen-High Flush
@test NLH.rank((Q, T, 5, 4, 2)) == 1281 # Queen-High Flush
@test NLH.rank((Q, T, 5, 3, 2)) == 1282 # Queen-High Flush
@test NLH.rank((Q, T, 4, 3, 2)) == 1283 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 7, 6)) == 1284 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 7, 5)) == 1285 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 7, 4)) == 1286 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 7, 3)) == 1287 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 7, 2)) == 1288 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 6, 5)) == 1289 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 6, 4)) == 1290 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 6, 3)) == 1291 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 6, 2)) == 1292 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 5, 4)) == 1293 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 5, 3)) == 1294 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 5, 2)) == 1295 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 4, 3)) == 1296 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 4, 2)) == 1297 # Queen-High Flush
@test NLH.rank((Q, 9, 8, 3, 2)) == 1298 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 6, 5)) == 1299 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 6, 4)) == 1300 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 6, 3)) == 1301 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 6, 2)) == 1302 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 5, 4)) == 1303 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 5, 3)) == 1304 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 5, 2)) == 1305 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 4, 3)) == 1306 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 4, 2)) == 1307 # Queen-High Flush
@test NLH.rank((Q, 9, 7, 3, 2)) == 1308 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 5, 4)) == 1309 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 5, 3)) == 1310 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 5, 2)) == 1311 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 4, 3)) == 1312 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 4, 2)) == 1313 # Queen-High Flush
@test NLH.rank((Q, 9, 6, 3, 2)) == 1314 # Queen-High Flush
@test NLH.rank((Q, 9, 5, 4, 3)) == 1315 # Queen-High Flush
@test NLH.rank((Q, 9, 5, 4, 2)) == 1316 # Queen-High Flush
@test NLH.rank((Q, 9, 5, 3, 2)) == 1317 # Queen-High Flush
@test NLH.rank((Q, 9, 4, 3, 2)) == 1318 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 6, 5)) == 1319 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 6, 4)) == 1320 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 6, 3)) == 1321 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 6, 2)) == 1322 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 5, 4)) == 1323 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 5, 3)) == 1324 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 5, 2)) == 1325 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 4, 3)) == 1326 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 4, 2)) == 1327 # Queen-High Flush
@test NLH.rank((Q, 8, 7, 3, 2)) == 1328 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 5, 4)) == 1329 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 5, 3)) == 1330 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 5, 2)) == 1331 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 4, 3)) == 1332 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 4, 2)) == 1333 # Queen-High Flush
@test NLH.rank((Q, 8, 6, 3, 2)) == 1334 # Queen-High Flush
@test NLH.rank((Q, 8, 5, 4, 3)) == 1335 # Queen-High Flush
@test NLH.rank((Q, 8, 5, 4, 2)) == 1336 # Queen-High Flush
@test NLH.rank((Q, 8, 5, 3, 2)) == 1337 # Queen-High Flush
@test NLH.rank((Q, 8, 4, 3, 2)) == 1338 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 5, 4)) == 1339 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 5, 3)) == 1340 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 5, 2)) == 1341 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 4, 3)) == 1342 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 4, 2)) == 1343 # Queen-High Flush
@test NLH.rank((Q, 7, 6, 3, 2)) == 1344 # Queen-High Flush
@test NLH.rank((Q, 7, 5, 4, 3)) == 1345 # Queen-High Flush
@test NLH.rank((Q, 7, 5, 4, 2)) == 1346 # Queen-High Flush
@test NLH.rank((Q, 7, 5, 3, 2)) == 1347 # Queen-High Flush
@test NLH.rank((Q, 7, 4, 3, 2)) == 1348 # Queen-High Flush
@test NLH.rank((Q, 6, 5, 4, 3)) == 1349 # Queen-High Flush
@test NLH.rank((Q, 6, 5, 4, 2)) == 1350 # Queen-High Flush
@test NLH.rank((Q, 6, 5, 3, 2)) == 1351 # Queen-High Flush
@test NLH.rank((Q, 6, 4, 3, 2)) == 1352 # Queen-High Flush
@test NLH.rank((Q, 5, 4, 3, 2)) == 1353 # Queen-High Flush
@test NLH.rank((J, T, 9, 8, 6)) == 1354 # Jack-High Flush
@test NLH.rank((J, T, 9, 8, 5)) == 1355 # Jack-High Flush
@test NLH.rank((J, T, 9, 8, 4)) == 1356 # Jack-High Flush
@test NLH.rank((J, T, 9, 8, 3)) == 1357 # Jack-High Flush
@test NLH.rank((J, T, 9, 8, 2)) == 1358 # Jack-High Flush
@test NLH.rank((J, T, 9, 7, 6)) == 1359 # Jack-High Flush
@test NLH.rank((J, T, 9, 7, 5)) == 1360 # Jack-High Flush
@test NLH.rank((J, T, 9, 7, 4)) == 1361 # Jack-High Flush
@test NLH.rank((J, T, 9, 7, 3)) == 1362 # Jack-High Flush
@test NLH.rank((J, T, 9, 7, 2)) == 1363 # Jack-High Flush
@test NLH.rank((J, T, 9, 6, 5)) == 1364 # Jack-High Flush
@test NLH.rank((J, T, 9, 6, 4)) == 1365 # Jack-High Flush
@test NLH.rank((J, T, 9, 6, 3)) == 1366 # Jack-High Flush
@test NLH.rank((J, T, 9, 6, 2)) == 1367 # Jack-High Flush
@test NLH.rank((J, T, 9, 5, 4)) == 1368 # Jack-High Flush
@test NLH.rank((J, T, 9, 5, 3)) == 1369 # Jack-High Flush
@test NLH.rank((J, T, 9, 5, 2)) == 1370 # Jack-High Flush
@test NLH.rank((J, T, 9, 4, 3)) == 1371 # Jack-High Flush
@test NLH.rank((J, T, 9, 4, 2)) == 1372 # Jack-High Flush
@test NLH.rank((J, T, 9, 3, 2)) == 1373 # Jack-High Flush
@test NLH.rank((J, T, 8, 7, 6)) == 1374 # Jack-High Flush
@test NLH.rank((J, T, 8, 7, 5)) == 1375 # Jack-High Flush
@test NLH.rank((J, T, 8, 7, 4)) == 1376 # Jack-High Flush
@test NLH.rank((J, T, 8, 7, 3)) == 1377 # Jack-High Flush
@test NLH.rank((J, T, 8, 7, 2)) == 1378 # Jack-High Flush
@test NLH.rank((J, T, 8, 6, 5)) == 1379 # Jack-High Flush
@test NLH.rank((J, T, 8, 6, 4)) == 1380 # Jack-High Flush
@test NLH.rank((J, T, 8, 6, 3)) == 1381 # Jack-High Flush
@test NLH.rank((J, T, 8, 6, 2)) == 1382 # Jack-High Flush
@test NLH.rank((J, T, 8, 5, 4)) == 1383 # Jack-High Flush
@test NLH.rank((J, T, 8, 5, 3)) == 1384 # Jack-High Flush
@test NLH.rank((J, T, 8, 5, 2)) == 1385 # Jack-High Flush
@test NLH.rank((J, T, 8, 4, 3)) == 1386 # Jack-High Flush
@test NLH.rank((J, T, 8, 4, 2)) == 1387 # Jack-High Flush
@test NLH.rank((J, T, 8, 3, 2)) == 1388 # Jack-High Flush
@test NLH.rank((J, T, 7, 6, 5)) == 1389 # Jack-High Flush
@test NLH.rank((J, T, 7, 6, 4)) == 1390 # Jack-High Flush
@test NLH.rank((J, T, 7, 6, 3)) == 1391 # Jack-High Flush
@test NLH.rank((J, T, 7, 6, 2)) == 1392 # Jack-High Flush
@test NLH.rank((J, T, 7, 5, 4)) == 1393 # Jack-High Flush
@test NLH.rank((J, T, 7, 5, 3)) == 1394 # Jack-High Flush
@test NLH.rank((J, T, 7, 5, 2)) == 1395 # Jack-High Flush
@test NLH.rank((J, T, 7, 4, 3)) == 1396 # Jack-High Flush
@test NLH.rank((J, T, 7, 4, 2)) == 1397 # Jack-High Flush
@test NLH.rank((J, T, 7, 3, 2)) == 1398 # Jack-High Flush
@test NLH.rank((J, T, 6, 5, 4)) == 1399 # Jack-High Flush
@test NLH.rank((J, T, 6, 5, 3)) == 1400 # Jack-High Flush
@test NLH.rank((J, T, 6, 5, 2)) == 1401 # Jack-High Flush
@test NLH.rank((J, T, 6, 4, 3)) == 1402 # Jack-High Flush
@test NLH.rank((J, T, 6, 4, 2)) == 1403 # Jack-High Flush
@test NLH.rank((J, T, 6, 3, 2)) == 1404 # Jack-High Flush
@test NLH.rank((J, T, 5, 4, 3)) == 1405 # Jack-High Flush
@test NLH.rank((J, T, 5, 4, 2)) == 1406 # Jack-High Flush
@test NLH.rank((J, T, 5, 3, 2)) == 1407 # Jack-High Flush
@test NLH.rank((J, T, 4, 3, 2)) == 1408 # Jack-High Flush
@test NLH.rank((J, 9, 8, 7, 6)) == 1409 # Jack-High Flush
@test NLH.rank((J, 9, 8, 7, 5)) == 1410 # Jack-High Flush
@test NLH.rank((J, 9, 8, 7, 4)) == 1411 # Jack-High Flush
@test NLH.rank((J, 9, 8, 7, 3)) == 1412 # Jack-High Flush
@test NLH.rank((J, 9, 8, 7, 2)) == 1413 # Jack-High Flush
@test NLH.rank((J, 9, 8, 6, 5)) == 1414 # Jack-High Flush
@test NLH.rank((J, 9, 8, 6, 4)) == 1415 # Jack-High Flush
@test NLH.rank((J, 9, 8, 6, 3)) == 1416 # Jack-High Flush
@test NLH.rank((J, 9, 8, 6, 2)) == 1417 # Jack-High Flush
@test NLH.rank((J, 9, 8, 5, 4)) == 1418 # Jack-High Flush
@test NLH.rank((J, 9, 8, 5, 3)) == 1419 # Jack-High Flush
@test NLH.rank((J, 9, 8, 5, 2)) == 1420 # Jack-High Flush
@test NLH.rank((J, 9, 8, 4, 3)) == 1421 # Jack-High Flush
@test NLH.rank((J, 9, 8, 4, 2)) == 1422 # Jack-High Flush
@test NLH.rank((J, 9, 8, 3, 2)) == 1423 # Jack-High Flush
@test NLH.rank((J, 9, 7, 6, 5)) == 1424 # Jack-High Flush
@test NLH.rank((J, 9, 7, 6, 4)) == 1425 # Jack-High Flush
@test NLH.rank((J, 9, 7, 6, 3)) == 1426 # Jack-High Flush
@test NLH.rank((J, 9, 7, 6, 2)) == 1427 # Jack-High Flush
@test NLH.rank((J, 9, 7, 5, 4)) == 1428 # Jack-High Flush
@test NLH.rank((J, 9, 7, 5, 3)) == 1429 # Jack-High Flush
@test NLH.rank((J, 9, 7, 5, 2)) == 1430 # Jack-High Flush
@test NLH.rank((J, 9, 7, 4, 3)) == 1431 # Jack-High Flush
@test NLH.rank((J, 9, 7, 4, 2)) == 1432 # Jack-High Flush
@test NLH.rank((J, 9, 7, 3, 2)) == 1433 # Jack-High Flush
@test NLH.rank((J, 9, 6, 5, 4)) == 1434 # Jack-High Flush
@test NLH.rank((J, 9, 6, 5, 3)) == 1435 # Jack-High Flush
@test NLH.rank((J, 9, 6, 5, 2)) == 1436 # Jack-High Flush
@test NLH.rank((J, 9, 6, 4, 3)) == 1437 # Jack-High Flush
@test NLH.rank((J, 9, 6, 4, 2)) == 1438 # Jack-High Flush
@test NLH.rank((J, 9, 6, 3, 2)) == 1439 # Jack-High Flush
@test NLH.rank((J, 9, 5, 4, 3)) == 1440 # Jack-High Flush
@test NLH.rank((J, 9, 5, 4, 2)) == 1441 # Jack-High Flush
@test NLH.rank((J, 9, 5, 3, 2)) == 1442 # Jack-High Flush
@test NLH.rank((J, 9, 4, 3, 2)) == 1443 # Jack-High Flush
@test NLH.rank((J, 8, 7, 6, 5)) == 1444 # Jack-High Flush
@test NLH.rank((J, 8, 7, 6, 4)) == 1445 # Jack-High Flush
@test NLH.rank((J, 8, 7, 6, 3)) == 1446 # Jack-High Flush
@test NLH.rank((J, 8, 7, 6, 2)) == 1447 # Jack-High Flush
@test NLH.rank((J, 8, 7, 5, 4)) == 1448 # Jack-High Flush
@test NLH.rank((J, 8, 7, 5, 3)) == 1449 # Jack-High Flush
@test NLH.rank((J, 8, 7, 5, 2)) == 1450 # Jack-High Flush
@test NLH.rank((J, 8, 7, 4, 3)) == 1451 # Jack-High Flush
@test NLH.rank((J, 8, 7, 4, 2)) == 1452 # Jack-High Flush
@test NLH.rank((J, 8, 7, 3, 2)) == 1453 # Jack-High Flush
@test NLH.rank((J, 8, 6, 5, 4)) == 1454 # Jack-High Flush
@test NLH.rank((J, 8, 6, 5, 3)) == 1455 # Jack-High Flush
@test NLH.rank((J, 8, 6, 5, 2)) == 1456 # Jack-High Flush
@test NLH.rank((J, 8, 6, 4, 3)) == 1457 # Jack-High Flush
@test NLH.rank((J, 8, 6, 4, 2)) == 1458 # Jack-High Flush
@test NLH.rank((J, 8, 6, 3, 2)) == 1459 # Jack-High Flush
@test NLH.rank((J, 8, 5, 4, 3)) == 1460 # Jack-High Flush
@test NLH.rank((J, 8, 5, 4, 2)) == 1461 # Jack-High Flush
@test NLH.rank((J, 8, 5, 3, 2)) == 1462 # Jack-High Flush
@test NLH.rank((J, 8, 4, 3, 2)) == 1463 # Jack-High Flush
@test NLH.rank((J, 7, 6, 5, 4)) == 1464 # Jack-High Flush
@test NLH.rank((J, 7, 6, 5, 3)) == 1465 # Jack-High Flush
@test NLH.rank((J, 7, 6, 5, 2)) == 1466 # Jack-High Flush
@test NLH.rank((J, 7, 6, 4, 3)) == 1467 # Jack-High Flush
@test NLH.rank((J, 7, 6, 4, 2)) == 1468 # Jack-High Flush
@test NLH.rank((J, 7, 6, 3, 2)) == 1469 # Jack-High Flush
@test NLH.rank((J, 7, 5, 4, 3)) == 1470 # Jack-High Flush
@test NLH.rank((J, 7, 5, 4, 2)) == 1471 # Jack-High Flush
@test NLH.rank((J, 7, 5, 3, 2)) == 1472 # Jack-High Flush
@test NLH.rank((J, 7, 4, 3, 2)) == 1473 # Jack-High Flush
@test NLH.rank((J, 6, 5, 4, 3)) == 1474 # Jack-High Flush
@test NLH.rank((J, 6, 5, 4, 2)) == 1475 # Jack-High Flush
@test NLH.rank((J, 6, 5, 3, 2)) == 1476 # Jack-High Flush
@test NLH.rank((J, 6, 4, 3, 2)) == 1477 # Jack-High Flush
@test NLH.rank((J, 5, 4, 3, 2)) == 1478 # Jack-High Flush
@test NLH.rank((T, 9, 8, 7, 5)) == 1479 # Ten-High Flush
@test NLH.rank((T, 9, 8, 7, 4)) == 1480 # Ten-High Flush
@test NLH.rank((T, 9, 8, 7, 3)) == 1481 # Ten-High Flush
@test NLH.rank((T, 9, 8, 7, 2)) == 1482 # Ten-High Flush
@test NLH.rank((T, 9, 8, 6, 5)) == 1483 # Ten-High Flush
@test NLH.rank((T, 9, 8, 6, 4)) == 1484 # Ten-High Flush
@test NLH.rank((T, 9, 8, 6, 3)) == 1485 # Ten-High Flush
@test NLH.rank((T, 9, 8, 6, 2)) == 1486 # Ten-High Flush
@test NLH.rank((T, 9, 8, 5, 4)) == 1487 # Ten-High Flush
@test NLH.rank((T, 9, 8, 5, 3)) == 1488 # Ten-High Flush
@test NLH.rank((T, 9, 8, 5, 2)) == 1489 # Ten-High Flush
@test NLH.rank((T, 9, 8, 4, 3)) == 1490 # Ten-High Flush
@test NLH.rank((T, 9, 8, 4, 2)) == 1491 # Ten-High Flush
@test NLH.rank((T, 9, 8, 3, 2)) == 1492 # Ten-High Flush
@test NLH.rank((T, 9, 7, 6, 5)) == 1493 # Ten-High Flush
@test NLH.rank((T, 9, 7, 6, 4)) == 1494 # Ten-High Flush
@test NLH.rank((T, 9, 7, 6, 3)) == 1495 # Ten-High Flush
@test NLH.rank((T, 9, 7, 6, 2)) == 1496 # Ten-High Flush
@test NLH.rank((T, 9, 7, 5, 4)) == 1497 # Ten-High Flush
@test NLH.rank((T, 9, 7, 5, 3)) == 1498 # Ten-High Flush
@test NLH.rank((T, 9, 7, 5, 2)) == 1499 # Ten-High Flush
@test NLH.rank((T, 9, 7, 4, 3)) == 1500 # Ten-High Flush
@test NLH.rank((T, 9, 7, 4, 2)) == 1501 # Ten-High Flush
@test NLH.rank((T, 9, 7, 3, 2)) == 1502 # Ten-High Flush
@test NLH.rank((T, 9, 6, 5, 4)) == 1503 # Ten-High Flush
@test NLH.rank((T, 9, 6, 5, 3)) == 1504 # Ten-High Flush
@test NLH.rank((T, 9, 6, 5, 2)) == 1505 # Ten-High Flush
@test NLH.rank((T, 9, 6, 4, 3)) == 1506 # Ten-High Flush
@test NLH.rank((T, 9, 6, 4, 2)) == 1507 # Ten-High Flush
@test NLH.rank((T, 9, 6, 3, 2)) == 1508 # Ten-High Flush
@test NLH.rank((T, 9, 5, 4, 3)) == 1509 # Ten-High Flush
@test NLH.rank((T, 9, 5, 4, 2)) == 1510 # Ten-High Flush
@test NLH.rank((T, 9, 5, 3, 2)) == 1511 # Ten-High Flush
@test NLH.rank((T, 9, 4, 3, 2)) == 1512 # Ten-High Flush
@test NLH.rank((T, 8, 7, 6, 5)) == 1513 # Ten-High Flush
@test NLH.rank((T, 8, 7, 6, 4)) == 1514 # Ten-High Flush
@test NLH.rank((T, 8, 7, 6, 3)) == 1515 # Ten-High Flush
@test NLH.rank((T, 8, 7, 6, 2)) == 1516 # Ten-High Flush
@test NLH.rank((T, 8, 7, 5, 4)) == 1517 # Ten-High Flush
@test NLH.rank((T, 8, 7, 5, 3)) == 1518 # Ten-High Flush
@test NLH.rank((T, 8, 7, 5, 2)) == 1519 # Ten-High Flush
@test NLH.rank((T, 8, 7, 4, 3)) == 1520 # Ten-High Flush
@test NLH.rank((T, 8, 7, 4, 2)) == 1521 # Ten-High Flush
@test NLH.rank((T, 8, 7, 3, 2)) == 1522 # Ten-High Flush
@test NLH.rank((T, 8, 6, 5, 4)) == 1523 # Ten-High Flush
@test NLH.rank((T, 8, 6, 5, 3)) == 1524 # Ten-High Flush
@test NLH.rank((T, 8, 6, 5, 2)) == 1525 # Ten-High Flush
@test NLH.rank((T, 8, 6, 4, 3)) == 1526 # Ten-High Flush
@test NLH.rank((T, 8, 6, 4, 2)) == 1527 # Ten-High Flush
@test NLH.rank((T, 8, 6, 3, 2)) == 1528 # Ten-High Flush
@test NLH.rank((T, 8, 5, 4, 3)) == 1529 # Ten-High Flush
@test NLH.rank((T, 8, 5, 4, 2)) == 1530 # Ten-High Flush
@test NLH.rank((T, 8, 5, 3, 2)) == 1531 # Ten-High Flush
@test NLH.rank((T, 8, 4, 3, 2)) == 1532 # Ten-High Flush
@test NLH.rank((T, 7, 6, 5, 4)) == 1533 # Ten-High Flush
@test NLH.rank((T, 7, 6, 5, 3)) == 1534 # Ten-High Flush
@test NLH.rank((T, 7, 6, 5, 2)) == 1535 # Ten-High Flush
@test NLH.rank((T, 7, 6, 4, 3)) == 1536 # Ten-High Flush
@test NLH.rank((T, 7, 6, 4, 2)) == 1537 # Ten-High Flush
@test NLH.rank((T, 7, 6, 3, 2)) == 1538 # Ten-High Flush
@test NLH.rank((T, 7, 5, 4, 3)) == 1539 # Ten-High Flush
@test NLH.rank((T, 7, 5, 4, 2)) == 1540 # Ten-High Flush
@test NLH.rank((T, 7, 5, 3, 2)) == 1541 # Ten-High Flush
@test NLH.rank((T, 7, 4, 3, 2)) == 1542 # Ten-High Flush
@test NLH.rank((T, 6, 5, 4, 3)) == 1543 # Ten-High Flush
@test NLH.rank((T, 6, 5, 4, 2)) == 1544 # Ten-High Flush
@test NLH.rank((T, 6, 5, 3, 2)) == 1545 # Ten-High Flush
@test NLH.rank((T, 6, 4, 3, 2)) == 1546 # Ten-High Flush
@test NLH.rank((T, 5, 4, 3, 2)) == 1547 # Ten-High Flush
@test NLH.rank((9, 8, 7, 6, 4)) == 1548 # Nine-High Flush
@test NLH.rank((9, 8, 7, 6, 3)) == 1549 # Nine-High Flush
@test NLH.rank((9, 8, 7, 6, 2)) == 1550 # Nine-High Flush
@test NLH.rank((9, 8, 7, 5, 4)) == 1551 # Nine-High Flush
@test NLH.rank((9, 8, 7, 5, 3)) == 1552 # Nine-High Flush
@test NLH.rank((9, 8, 7, 5, 2)) == 1553 # Nine-High Flush
@test NLH.rank((9, 8, 7, 4, 3)) == 1554 # Nine-High Flush
@test NLH.rank((9, 8, 7, 4, 2)) == 1555 # Nine-High Flush
@test NLH.rank((9, 8, 7, 3, 2)) == 1556 # Nine-High Flush
@test NLH.rank((9, 8, 6, 5, 4)) == 1557 # Nine-High Flush
@test NLH.rank((9, 8, 6, 5, 3)) == 1558 # Nine-High Flush
@test NLH.rank((9, 8, 6, 5, 2)) == 1559 # Nine-High Flush
@test NLH.rank((9, 8, 6, 4, 3)) == 1560 # Nine-High Flush
@test NLH.rank((9, 8, 6, 4, 2)) == 1561 # Nine-High Flush
@test NLH.rank((9, 8, 6, 3, 2)) == 1562 # Nine-High Flush
@test NLH.rank((9, 8, 5, 4, 3)) == 1563 # Nine-High Flush
@test NLH.rank((9, 8, 5, 4, 2)) == 1564 # Nine-High Flush
@test NLH.rank((9, 8, 5, 3, 2)) == 1565 # Nine-High Flush
@test NLH.rank((9, 8, 4, 3, 2)) == 1566 # Nine-High Flush
@test NLH.rank((9, 7, 6, 5, 4)) == 1567 # Nine-High Flush
@test NLH.rank((9, 7, 6, 5, 3)) == 1568 # Nine-High Flush
@test NLH.rank((9, 7, 6, 5, 2)) == 1569 # Nine-High Flush
@test NLH.rank((9, 7, 6, 4, 3)) == 1570 # Nine-High Flush
@test NLH.rank((9, 7, 6, 4, 2)) == 1571 # Nine-High Flush
@test NLH.rank((9, 7, 6, 3, 2)) == 1572 # Nine-High Flush
@test NLH.rank((9, 7, 5, 4, 3)) == 1573 # Nine-High Flush
@test NLH.rank((9, 7, 5, 4, 2)) == 1574 # Nine-High Flush
@test NLH.rank((9, 7, 5, 3, 2)) == 1575 # Nine-High Flush
@test NLH.rank((9, 7, 4, 3, 2)) == 1576 # Nine-High Flush
@test NLH.rank((9, 6, 5, 4, 3)) == 1577 # Nine-High Flush
@test NLH.rank((9, 6, 5, 4, 2)) == 1578 # Nine-High Flush
@test NLH.rank((9, 6, 5, 3, 2)) == 1579 # Nine-High Flush
@test NLH.rank((9, 6, 4, 3, 2)) == 1580 # Nine-High Flush
@test NLH.rank((9, 5, 4, 3, 2)) == 1581 # Nine-High Flush
@test NLH.rank((8, 7, 6, 5, 3)) == 1582 # Eight-High Flush
@test NLH.rank((8, 7, 6, 5, 2)) == 1583 # Eight-High Flush
@test NLH.rank((8, 7, 6, 4, 3)) == 1584 # Eight-High Flush
@test NLH.rank((8, 7, 6, 4, 2)) == 1585 # Eight-High Flush
@test NLH.rank((8, 7, 6, 3, 2)) == 1586 # Eight-High Flush
@test NLH.rank((8, 7, 5, 4, 3)) == 1587 # Eight-High Flush
@test NLH.rank((8, 7, 5, 4, 2)) == 1588 # Eight-High Flush
@test NLH.rank((8, 7, 5, 3, 2)) == 1589 # Eight-High Flush
@test NLH.rank((8, 7, 4, 3, 2)) == 1590 # Eight-High Flush
@test NLH.rank((8, 6, 5, 4, 3)) == 1591 # Eight-High Flush
@test NLH.rank((8, 6, 5, 4, 2)) == 1592 # Eight-High Flush
@test NLH.rank((8, 6, 5, 3, 2)) == 1593 # Eight-High Flush
@test NLH.rank((8, 6, 4, 3, 2)) == 1594 # Eight-High Flush
@test NLH.rank((8, 5, 4, 3, 2)) == 1595 # Eight-High Flush
@test NLH.rank((7, 6, 5, 4, 2)) == 1596 # Seven-High Flush
@test NLH.rank((7, 6, 5, 3, 2)) == 1597 # Seven-High Flush
@test NLH.rank((7, 6, 4, 3, 2)) == 1598 # Seven-High Flush
@test NLH.rank((7, 5, 4, 3, 2)) == 1599 # Seven-High Flush
@test NLH.rank((A, K, Q, J, T)) == 1600 # Ace-High Straight
@test NLH.rank((K, Q, J, T, 9)) == 1601 # King-High Straight
@test NLH.rank((Q, J, T, 9, 8)) == 1602 # Queen-High Straight
@test NLH.rank((J, T, 9, 8, 7)) == 1603 # Jack-High Straight
@test NLH.rank((T, 9, 8, 7, 6)) == 1604 # Ten-High Straight
@test NLH.rank((9, 8, 7, 6, 5)) == 1605 # Nine-High Straight
@test NLH.rank((8, 7, 6, 5, 4)) == 1606 # Eight-High Straight
@test NLH.rank((7, 6, 5, 4, 3)) == 1607 # Seven-High Straight
@test NLH.rank((6, 5, 4, 3, 2)) == 1608 # Six-High Straight
@test NLH.rank((5, 4, 3, 2, A)) == 1609 # Five-High Straight
@test NLH.rank((A, A, A, K, Q)) == 1610 # Three Aces
@test NLH.rank((A, A, A, K, J)) == 1611 # Three Aces
@test NLH.rank((A, A, A, K, T)) == 1612 # Three Aces
@test NLH.rank((A, A, A, K, 9)) == 1613 # Three Aces
@test NLH.rank((A, A, A, K, 8)) == 1614 # Three Aces
@test NLH.rank((A, A, A, K, 7)) == 1615 # Three Aces
@test NLH.rank((A, A, A, K, 6)) == 1616 # Three Aces
@test NLH.rank((A, A, A, K, 5)) == 1617 # Three Aces
@test NLH.rank((A, A, A, K, 4)) == 1618 # Three Aces
@test NLH.rank((A, A, A, K, 3)) == 1619 # Three Aces
@test NLH.rank((A, A, A, K, 2)) == 1620 # Three Aces
@test NLH.rank((A, A, A, Q, J)) == 1621 # Three Aces
@test NLH.rank((A, A, A, Q, T)) == 1622 # Three Aces
@test NLH.rank((A, A, A, Q, 9)) == 1623 # Three Aces
@test NLH.rank((A, A, A, Q, 8)) == 1624 # Three Aces
@test NLH.rank((A, A, A, Q, 7)) == 1625 # Three Aces
@test NLH.rank((A, A, A, Q, 6)) == 1626 # Three Aces
@test NLH.rank((A, A, A, Q, 5)) == 1627 # Three Aces
@test NLH.rank((A, A, A, Q, 4)) == 1628 # Three Aces
@test NLH.rank((A, A, A, Q, 3)) == 1629 # Three Aces
@test NLH.rank((A, A, A, Q, 2)) == 1630 # Three Aces
@test NLH.rank((A, A, A, J, T)) == 1631 # Three Aces
@test NLH.rank((A, A, A, J, 9)) == 1632 # Three Aces
@test NLH.rank((A, A, A, J, 8)) == 1633 # Three Aces
@test NLH.rank((A, A, A, J, 7)) == 1634 # Three Aces
@test NLH.rank((A, A, A, J, 6)) == 1635 # Three Aces
@test NLH.rank((A, A, A, J, 5)) == 1636 # Three Aces
@test NLH.rank((A, A, A, J, 4)) == 1637 # Three Aces
@test NLH.rank((A, A, A, J, 3)) == 1638 # Three Aces
@test NLH.rank((A, A, A, J, 2)) == 1639 # Three Aces
@test NLH.rank((A, A, A, T, 9)) == 1640 # Three Aces
@test NLH.rank((A, A, A, T, 8)) == 1641 # Three Aces
@test NLH.rank((A, A, A, T, 7)) == 1642 # Three Aces
@test NLH.rank((A, A, A, T, 6)) == 1643 # Three Aces
@test NLH.rank((A, A, A, T, 5)) == 1644 # Three Aces
@test NLH.rank((A, A, A, T, 4)) == 1645 # Three Aces
@test NLH.rank((A, A, A, T, 3)) == 1646 # Three Aces
@test NLH.rank((A, A, A, T, 2)) == 1647 # Three Aces
@test NLH.rank((A, A, A, 9, 8)) == 1648 # Three Aces
@test NLH.rank((A, A, A, 9, 7)) == 1649 # Three Aces
@test NLH.rank((A, A, A, 9, 6)) == 1650 # Three Aces
@test NLH.rank((A, A, A, 9, 5)) == 1651 # Three Aces
@test NLH.rank((A, A, A, 9, 4)) == 1652 # Three Aces
@test NLH.rank((A, A, A, 9, 3)) == 1653 # Three Aces
@test NLH.rank((A, A, A, 9, 2)) == 1654 # Three Aces
@test NLH.rank((A, A, A, 8, 7)) == 1655 # Three Aces
@test NLH.rank((A, A, A, 8, 6)) == 1656 # Three Aces
@test NLH.rank((A, A, A, 8, 5)) == 1657 # Three Aces
@test NLH.rank((A, A, A, 8, 4)) == 1658 # Three Aces
@test NLH.rank((A, A, A, 8, 3)) == 1659 # Three Aces
@test NLH.rank((A, A, A, 8, 2)) == 1660 # Three Aces
@test NLH.rank((A, A, A, 7, 6)) == 1661 # Three Aces
@test NLH.rank((A, A, A, 7, 5)) == 1662 # Three Aces
@test NLH.rank((A, A, A, 7, 4)) == 1663 # Three Aces
@test NLH.rank((A, A, A, 7, 3)) == 1664 # Three Aces
@test NLH.rank((A, A, A, 7, 2)) == 1665 # Three Aces
@test NLH.rank((A, A, A, 6, 5)) == 1666 # Three Aces
@test NLH.rank((A, A, A, 6, 4)) == 1667 # Three Aces
@test NLH.rank((A, A, A, 6, 3)) == 1668 # Three Aces
@test NLH.rank((A, A, A, 6, 2)) == 1669 # Three Aces
@test NLH.rank((A, A, A, 5, 4)) == 1670 # Three Aces
@test NLH.rank((A, A, A, 5, 3)) == 1671 # Three Aces
@test NLH.rank((A, A, A, 5, 2)) == 1672 # Three Aces
@test NLH.rank((A, A, A, 4, 3)) == 1673 # Three Aces
@test NLH.rank((A, A, A, 4, 2)) == 1674 # Three Aces
@test NLH.rank((A, A, A, 3, 2)) == 1675 # Three Aces
@test NLH.rank((K, K, K, A, Q)) == 1676 # Three Kings
@test NLH.rank((K, K, K, A, J)) == 1677 # Three Kings
@test NLH.rank((K, K, K, A, T)) == 1678 # Three Kings
@test NLH.rank((K, K, K, A, 9)) == 1679 # Three Kings
@test NLH.rank((K, K, K, A, 8)) == 1680 # Three Kings
@test NLH.rank((K, K, K, A, 7)) == 1681 # Three Kings
@test NLH.rank((K, K, K, A, 6)) == 1682 # Three Kings
@test NLH.rank((K, K, K, A, 5)) == 1683 # Three Kings
@test NLH.rank((K, K, K, A, 4)) == 1684 # Three Kings
@test NLH.rank((K, K, K, A, 3)) == 1685 # Three Kings
@test NLH.rank((K, K, K, A, 2)) == 1686 # Three Kings
@test NLH.rank((K, K, K, Q, J)) == 1687 # Three Kings
@test NLH.rank((K, K, K, Q, T)) == 1688 # Three Kings
@test NLH.rank((K, K, K, Q, 9)) == 1689 # Three Kings
@test NLH.rank((K, K, K, Q, 8)) == 1690 # Three Kings
@test NLH.rank((K, K, K, Q, 7)) == 1691 # Three Kings
@test NLH.rank((K, K, K, Q, 6)) == 1692 # Three Kings
@test NLH.rank((K, K, K, Q, 5)) == 1693 # Three Kings
@test NLH.rank((K, K, K, Q, 4)) == 1694 # Three Kings
@test NLH.rank((K, K, K, Q, 3)) == 1695 # Three Kings
@test NLH.rank((K, K, K, Q, 2)) == 1696 # Three Kings
@test NLH.rank((K, K, K, J, T)) == 1697 # Three Kings
@test NLH.rank((K, K, K, J, 9)) == 1698 # Three Kings
@test NLH.rank((K, K, K, J, 8)) == 1699 # Three Kings
@test NLH.rank((K, K, K, J, 7)) == 1700 # Three Kings
@test NLH.rank((K, K, K, J, 6)) == 1701 # Three Kings
@test NLH.rank((K, K, K, J, 5)) == 1702 # Three Kings
@test NLH.rank((K, K, K, J, 4)) == 1703 # Three Kings
@test NLH.rank((K, K, K, J, 3)) == 1704 # Three Kings
@test NLH.rank((K, K, K, J, 2)) == 1705 # Three Kings
@test NLH.rank((K, K, K, T, 9)) == 1706 # Three Kings
@test NLH.rank((K, K, K, T, 8)) == 1707 # Three Kings
@test NLH.rank((K, K, K, T, 7)) == 1708 # Three Kings
@test NLH.rank((K, K, K, T, 6)) == 1709 # Three Kings
@test NLH.rank((K, K, K, T, 5)) == 1710 # Three Kings
@test NLH.rank((K, K, K, T, 4)) == 1711 # Three Kings
@test NLH.rank((K, K, K, T, 3)) == 1712 # Three Kings
@test NLH.rank((K, K, K, T, 2)) == 1713 # Three Kings
@test NLH.rank((K, K, K, 9, 8)) == 1714 # Three Kings
@test NLH.rank((K, K, K, 9, 7)) == 1715 # Three Kings
@test NLH.rank((K, K, K, 9, 6)) == 1716 # Three Kings
@test NLH.rank((K, K, K, 9, 5)) == 1717 # Three Kings
@test NLH.rank((K, K, K, 9, 4)) == 1718 # Three Kings
@test NLH.rank((K, K, K, 9, 3)) == 1719 # Three Kings
@test NLH.rank((K, K, K, 9, 2)) == 1720 # Three Kings
@test NLH.rank((K, K, K, 8, 7)) == 1721 # Three Kings
@test NLH.rank((K, K, K, 8, 6)) == 1722 # Three Kings
@test NLH.rank((K, K, K, 8, 5)) == 1723 # Three Kings
@test NLH.rank((K, K, K, 8, 4)) == 1724 # Three Kings
@test NLH.rank((K, K, K, 8, 3)) == 1725 # Three Kings
@test NLH.rank((K, K, K, 8, 2)) == 1726 # Three Kings
@test NLH.rank((K, K, K, 7, 6)) == 1727 # Three Kings
@test NLH.rank((K, K, K, 7, 5)) == 1728 # Three Kings
@test NLH.rank((K, K, K, 7, 4)) == 1729 # Three Kings
@test NLH.rank((K, K, K, 7, 3)) == 1730 # Three Kings
@test NLH.rank((K, K, K, 7, 2)) == 1731 # Three Kings
@test NLH.rank((K, K, K, 6, 5)) == 1732 # Three Kings
@test NLH.rank((K, K, K, 6, 4)) == 1733 # Three Kings
@test NLH.rank((K, K, K, 6, 3)) == 1734 # Three Kings
@test NLH.rank((K, K, K, 6, 2)) == 1735 # Three Kings
@test NLH.rank((K, K, K, 5, 4)) == 1736 # Three Kings
@test NLH.rank((K, K, K, 5, 3)) == 1737 # Three Kings
@test NLH.rank((K, K, K, 5, 2)) == 1738 # Three Kings
@test NLH.rank((K, K, K, 4, 3)) == 1739 # Three Kings
@test NLH.rank((K, K, K, 4, 2)) == 1740 # Three Kings
@test NLH.rank((K, K, K, 3, 2)) == 1741 # Three Kings
@test NLH.rank((Q, Q, Q, A, K)) == 1742 # Three Queens
@test NLH.rank((Q, Q, Q, A, J)) == 1743 # Three Queens
@test NLH.rank((Q, Q, Q, A, T)) == 1744 # Three Queens
@test NLH.rank((Q, Q, Q, A, 9)) == 1745 # Three Queens
@test NLH.rank((Q, Q, Q, A, 8)) == 1746 # Three Queens
@test NLH.rank((Q, Q, Q, A, 7)) == 1747 # Three Queens
@test NLH.rank((Q, Q, Q, A, 6)) == 1748 # Three Queens
@test NLH.rank((Q, Q, Q, A, 5)) == 1749 # Three Queens
@test NLH.rank((Q, Q, Q, A, 4)) == 1750 # Three Queens
@test NLH.rank((Q, Q, Q, A, 3)) == 1751 # Three Queens
@test NLH.rank((Q, Q, Q, A, 2)) == 1752 # Three Queens
@test NLH.rank((Q, Q, Q, K, J)) == 1753 # Three Queens
@test NLH.rank((Q, Q, Q, K, T)) == 1754 # Three Queens
@test NLH.rank((Q, Q, Q, K, 9)) == 1755 # Three Queens
@test NLH.rank((Q, Q, Q, K, 8)) == 1756 # Three Queens
@test NLH.rank((Q, Q, Q, K, 7)) == 1757 # Three Queens
@test NLH.rank((Q, Q, Q, K, 6)) == 1758 # Three Queens
@test NLH.rank((Q, Q, Q, K, 5)) == 1759 # Three Queens
@test NLH.rank((Q, Q, Q, K, 4)) == 1760 # Three Queens
@test NLH.rank((Q, Q, Q, K, 3)) == 1761 # Three Queens
@test NLH.rank((Q, Q, Q, K, 2)) == 1762 # Three Queens
@test NLH.rank((Q, Q, Q, J, T)) == 1763 # Three Queens
@test NLH.rank((Q, Q, Q, J, 9)) == 1764 # Three Queens
@test NLH.rank((Q, Q, Q, J, 8)) == 1765 # Three Queens
@test NLH.rank((Q, Q, Q, J, 7)) == 1766 # Three Queens
@test NLH.rank((Q, Q, Q, J, 6)) == 1767 # Three Queens
@test NLH.rank((Q, Q, Q, J, 5)) == 1768 # Three Queens
@test NLH.rank((Q, Q, Q, J, 4)) == 1769 # Three Queens
@test NLH.rank((Q, Q, Q, J, 3)) == 1770 # Three Queens
@test NLH.rank((Q, Q, Q, J, 2)) == 1771 # Three Queens
@test NLH.rank((Q, Q, Q, T, 9)) == 1772 # Three Queens
@test NLH.rank((Q, Q, Q, T, 8)) == 1773 # Three Queens
@test NLH.rank((Q, Q, Q, T, 7)) == 1774 # Three Queens
@test NLH.rank((Q, Q, Q, T, 6)) == 1775 # Three Queens
@test NLH.rank((Q, Q, Q, T, 5)) == 1776 # Three Queens
@test NLH.rank((Q, Q, Q, T, 4)) == 1777 # Three Queens
@test NLH.rank((Q, Q, Q, T, 3)) == 1778 # Three Queens
@test NLH.rank((Q, Q, Q, T, 2)) == 1779 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 8)) == 1780 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 7)) == 1781 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 6)) == 1782 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 5)) == 1783 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 4)) == 1784 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 3)) == 1785 # Three Queens
@test NLH.rank((Q, Q, Q, 9, 2)) == 1786 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 7)) == 1787 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 6)) == 1788 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 5)) == 1789 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 4)) == 1790 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 3)) == 1791 # Three Queens
@test NLH.rank((Q, Q, Q, 8, 2)) == 1792 # Three Queens
@test NLH.rank((Q, Q, Q, 7, 6)) == 1793 # Three Queens
@test NLH.rank((Q, Q, Q, 7, 5)) == 1794 # Three Queens
@test NLH.rank((Q, Q, Q, 7, 4)) == 1795 # Three Queens
@test NLH.rank((Q, Q, Q, 7, 3)) == 1796 # Three Queens
@test NLH.rank((Q, Q, Q, 7, 2)) == 1797 # Three Queens
@test NLH.rank((Q, Q, Q, 6, 5)) == 1798 # Three Queens
@test NLH.rank((Q, Q, Q, 6, 4)) == 1799 # Three Queens
@test NLH.rank((Q, Q, Q, 6, 3)) == 1800 # Three Queens
@test NLH.rank((Q, Q, Q, 6, 2)) == 1801 # Three Queens
@test NLH.rank((Q, Q, Q, 5, 4)) == 1802 # Three Queens
@test NLH.rank((Q, Q, Q, 5, 3)) == 1803 # Three Queens
@test NLH.rank((Q, Q, Q, 5, 2)) == 1804 # Three Queens
@test NLH.rank((Q, Q, Q, 4, 3)) == 1805 # Three Queens
@test NLH.rank((Q, Q, Q, 4, 2)) == 1806 # Three Queens
@test NLH.rank((Q, Q, Q, 3, 2)) == 1807 # Three Queens
@test NLH.rank((J, J, J, A, K)) == 1808 # Three Jacks
@test NLH.rank((J, J, J, A, Q)) == 1809 # Three Jacks
@test NLH.rank((J, J, J, A, T)) == 1810 # Three Jacks
@test NLH.rank((J, J, J, A, 9)) == 1811 # Three Jacks
@test NLH.rank((J, J, J, A, 8)) == 1812 # Three Jacks
@test NLH.rank((J, J, J, A, 7)) == 1813 # Three Jacks
@test NLH.rank((J, J, J, A, 6)) == 1814 # Three Jacks
@test NLH.rank((J, J, J, A, 5)) == 1815 # Three Jacks
@test NLH.rank((J, J, J, A, 4)) == 1816 # Three Jacks
@test NLH.rank((J, J, J, A, 3)) == 1817 # Three Jacks
@test NLH.rank((J, J, J, A, 2)) == 1818 # Three Jacks
@test NLH.rank((J, J, J, K, Q)) == 1819 # Three Jacks
@test NLH.rank((J, J, J, K, T)) == 1820 # Three Jacks
@test NLH.rank((J, J, J, K, 9)) == 1821 # Three Jacks
@test NLH.rank((J, J, J, K, 8)) == 1822 # Three Jacks
@test NLH.rank((J, J, J, K, 7)) == 1823 # Three Jacks
@test NLH.rank((J, J, J, K, 6)) == 1824 # Three Jacks
@test NLH.rank((J, J, J, K, 5)) == 1825 # Three Jacks
@test NLH.rank((J, J, J, K, 4)) == 1826 # Three Jacks
@test NLH.rank((J, J, J, K, 3)) == 1827 # Three Jacks
@test NLH.rank((J, J, J, K, 2)) == 1828 # Three Jacks
@test NLH.rank((J, J, J, Q, T)) == 1829 # Three Jacks
@test NLH.rank((J, J, J, Q, 9)) == 1830 # Three Jacks
@test NLH.rank((J, J, J, Q, 8)) == 1831 # Three Jacks
@test NLH.rank((J, J, J, Q, 7)) == 1832 # Three Jacks
@test NLH.rank((J, J, J, Q, 6)) == 1833 # Three Jacks
@test NLH.rank((J, J, J, Q, 5)) == 1834 # Three Jacks
@test NLH.rank((J, J, J, Q, 4)) == 1835 # Three Jacks
@test NLH.rank((J, J, J, Q, 3)) == 1836 # Three Jacks
@test NLH.rank((J, J, J, Q, 2)) == 1837 # Three Jacks
@test NLH.rank((J, J, J, T, 9)) == 1838 # Three Jacks
@test NLH.rank((J, J, J, T, 8)) == 1839 # Three Jacks
@test NLH.rank((J, J, J, T, 7)) == 1840 # Three Jacks
@test NLH.rank((J, J, J, T, 6)) == 1841 # Three Jacks
@test NLH.rank((J, J, J, T, 5)) == 1842 # Three Jacks
@test NLH.rank((J, J, J, T, 4)) == 1843 # Three Jacks
@test NLH.rank((J, J, J, T, 3)) == 1844 # Three Jacks
@test NLH.rank((J, J, J, T, 2)) == 1845 # Three Jacks
@test NLH.rank((J, J, J, 9, 8)) == 1846 # Three Jacks
@test NLH.rank((J, J, J, 9, 7)) == 1847 # Three Jacks
@test NLH.rank((J, J, J, 9, 6)) == 1848 # Three Jacks
@test NLH.rank((J, J, J, 9, 5)) == 1849 # Three Jacks
@test NLH.rank((J, J, J, 9, 4)) == 1850 # Three Jacks
@test NLH.rank((J, J, J, 9, 3)) == 1851 # Three Jacks
@test NLH.rank((J, J, J, 9, 2)) == 1852 # Three Jacks
@test NLH.rank((J, J, J, 8, 7)) == 1853 # Three Jacks
@test NLH.rank((J, J, J, 8, 6)) == 1854 # Three Jacks
@test NLH.rank((J, J, J, 8, 5)) == 1855 # Three Jacks
@test NLH.rank((J, J, J, 8, 4)) == 1856 # Three Jacks
@test NLH.rank((J, J, J, 8, 3)) == 1857 # Three Jacks
@test NLH.rank((J, J, J, 8, 2)) == 1858 # Three Jacks
@test NLH.rank((J, J, J, 7, 6)) == 1859 # Three Jacks
@test NLH.rank((J, J, J, 7, 5)) == 1860 # Three Jacks
@test NLH.rank((J, J, J, 7, 4)) == 1861 # Three Jacks
@test NLH.rank((J, J, J, 7, 3)) == 1862 # Three Jacks
@test NLH.rank((J, J, J, 7, 2)) == 1863 # Three Jacks
@test NLH.rank((J, J, J, 6, 5)) == 1864 # Three Jacks
@test NLH.rank((J, J, J, 6, 4)) == 1865 # Three Jacks
@test NLH.rank((J, J, J, 6, 3)) == 1866 # Three Jacks
@test NLH.rank((J, J, J, 6, 2)) == 1867 # Three Jacks
@test NLH.rank((J, J, J, 5, 4)) == 1868 # Three Jacks
@test NLH.rank((J, J, J, 5, 3)) == 1869 # Three Jacks
@test NLH.rank((J, J, J, 5, 2)) == 1870 # Three Jacks
@test NLH.rank((J, J, J, 4, 3)) == 1871 # Three Jacks
@test NLH.rank((J, J, J, 4, 2)) == 1872 # Three Jacks
@test NLH.rank((J, J, J, 3, 2)) == 1873 # Three Jacks
@test NLH.rank((T, T, T, A, K)) == 1874 # Three Tens
@test NLH.rank((T, T, T, A, Q)) == 1875 # Three Tens
@test NLH.rank((T, T, T, A, J)) == 1876 # Three Tens
@test NLH.rank((T, T, T, A, 9)) == 1877 # Three Tens
@test NLH.rank((T, T, T, A, 8)) == 1878 # Three Tens
@test NLH.rank((T, T, T, A, 7)) == 1879 # Three Tens
@test NLH.rank((T, T, T, A, 6)) == 1880 # Three Tens
@test NLH.rank((T, T, T, A, 5)) == 1881 # Three Tens
@test NLH.rank((T, T, T, A, 4)) == 1882 # Three Tens
@test NLH.rank((T, T, T, A, 3)) == 1883 # Three Tens
@test NLH.rank((T, T, T, A, 2)) == 1884 # Three Tens
@test NLH.rank((T, T, T, K, Q)) == 1885 # Three Tens
@test NLH.rank((T, T, T, K, J)) == 1886 # Three Tens
@test NLH.rank((T, T, T, K, 9)) == 1887 # Three Tens
@test NLH.rank((T, T, T, K, 8)) == 1888 # Three Tens
@test NLH.rank((T, T, T, K, 7)) == 1889 # Three Tens
@test NLH.rank((T, T, T, K, 6)) == 1890 # Three Tens
@test NLH.rank((T, T, T, K, 5)) == 1891 # Three Tens
@test NLH.rank((T, T, T, K, 4)) == 1892 # Three Tens
@test NLH.rank((T, T, T, K, 3)) == 1893 # Three Tens
@test NLH.rank((T, T, T, K, 2)) == 1894 # Three Tens
@test NLH.rank((T, T, T, Q, J)) == 1895 # Three Tens
@test NLH.rank((T, T, T, Q, 9)) == 1896 # Three Tens
@test NLH.rank((T, T, T, Q, 8)) == 1897 # Three Tens
@test NLH.rank((T, T, T, Q, 7)) == 1898 # Three Tens
@test NLH.rank((T, T, T, Q, 6)) == 1899 # Three Tens
@test NLH.rank((T, T, T, Q, 5)) == 1900 # Three Tens
@test NLH.rank((T, T, T, Q, 4)) == 1901 # Three Tens
@test NLH.rank((T, T, T, Q, 3)) == 1902 # Three Tens
@test NLH.rank((T, T, T, Q, 2)) == 1903 # Three Tens
@test NLH.rank((T, T, T, J, 9)) == 1904 # Three Tens
@test NLH.rank((T, T, T, J, 8)) == 1905 # Three Tens
@test NLH.rank((T, T, T, J, 7)) == 1906 # Three Tens
@test NLH.rank((T, T, T, J, 6)) == 1907 # Three Tens
@test NLH.rank((T, T, T, J, 5)) == 1908 # Three Tens
@test NLH.rank((T, T, T, J, 4)) == 1909 # Three Tens
@test NLH.rank((T, T, T, J, 3)) == 1910 # Three Tens
@test NLH.rank((T, T, T, J, 2)) == 1911 # Three Tens
@test NLH.rank((T, T, T, 9, 8)) == 1912 # Three Tens
@test NLH.rank((T, T, T, 9, 7)) == 1913 # Three Tens
@test NLH.rank((T, T, T, 9, 6)) == 1914 # Three Tens
@test NLH.rank((T, T, T, 9, 5)) == 1915 # Three Tens
@test NLH.rank((T, T, T, 9, 4)) == 1916 # Three Tens
@test NLH.rank((T, T, T, 9, 3)) == 1917 # Three Tens
@test NLH.rank((T, T, T, 9, 2)) == 1918 # Three Tens
@test NLH.rank((T, T, T, 8, 7)) == 1919 # Three Tens
@test NLH.rank((T, T, T, 8, 6)) == 1920 # Three Tens
@test NLH.rank((T, T, T, 8, 5)) == 1921 # Three Tens
@test NLH.rank((T, T, T, 8, 4)) == 1922 # Three Tens
@test NLH.rank((T, T, T, 8, 3)) == 1923 # Three Tens
@test NLH.rank((T, T, T, 8, 2)) == 1924 # Three Tens
@test NLH.rank((T, T, T, 7, 6)) == 1925 # Three Tens
@test NLH.rank((T, T, T, 7, 5)) == 1926 # Three Tens
@test NLH.rank((T, T, T, 7, 4)) == 1927 # Three Tens
@test NLH.rank((T, T, T, 7, 3)) == 1928 # Three Tens
@test NLH.rank((T, T, T, 7, 2)) == 1929 # Three Tens
@test NLH.rank((T, T, T, 6, 5)) == 1930 # Three Tens
@test NLH.rank((T, T, T, 6, 4)) == 1931 # Three Tens
@test NLH.rank((T, T, T, 6, 3)) == 1932 # Three Tens
@test NLH.rank((T, T, T, 6, 2)) == 1933 # Three Tens
@test NLH.rank((T, T, T, 5, 4)) == 1934 # Three Tens
@test NLH.rank((T, T, T, 5, 3)) == 1935 # Three Tens
@test NLH.rank((T, T, T, 5, 2)) == 1936 # Three Tens
@test NLH.rank((T, T, T, 4, 3)) == 1937 # Three Tens
@test NLH.rank((T, T, T, 4, 2)) == 1938 # Three Tens
@test NLH.rank((T, T, T, 3, 2)) == 1939 # Three Tens
@test NLH.rank((9, 9, 9, A, K)) == 1940 # Three Nines
@test NLH.rank((9, 9, 9, A, Q)) == 1941 # Three Nines
@test NLH.rank((9, 9, 9, A, J)) == 1942 # Three Nines
@test NLH.rank((9, 9, 9, A, T)) == 1943 # Three Nines
@test NLH.rank((9, 9, 9, A, 8)) == 1944 # Three Nines
@test NLH.rank((9, 9, 9, A, 7)) == 1945 # Three Nines
@test NLH.rank((9, 9, 9, A, 6)) == 1946 # Three Nines
@test NLH.rank((9, 9, 9, A, 5)) == 1947 # Three Nines
@test NLH.rank((9, 9, 9, A, 4)) == 1948 # Three Nines
@test NLH.rank((9, 9, 9, A, 3)) == 1949 # Three Nines
@test NLH.rank((9, 9, 9, A, 2)) == 1950 # Three Nines
@test NLH.rank((9, 9, 9, K, Q)) == 1951 # Three Nines
@test NLH.rank((9, 9, 9, K, J)) == 1952 # Three Nines
@test NLH.rank((9, 9, 9, K, T)) == 1953 # Three Nines
@test NLH.rank((9, 9, 9, K, 8)) == 1954 # Three Nines
@test NLH.rank((9, 9, 9, K, 7)) == 1955 # Three Nines
@test NLH.rank((9, 9, 9, K, 6)) == 1956 # Three Nines
@test NLH.rank((9, 9, 9, K, 5)) == 1957 # Three Nines
@test NLH.rank((9, 9, 9, K, 4)) == 1958 # Three Nines
@test NLH.rank((9, 9, 9, K, 3)) == 1959 # Three Nines
@test NLH.rank((9, 9, 9, K, 2)) == 1960 # Three Nines
@test NLH.rank((9, 9, 9, Q, J)) == 1961 # Three Nines
@test NLH.rank((9, 9, 9, Q, T)) == 1962 # Three Nines
@test NLH.rank((9, 9, 9, Q, 8)) == 1963 # Three Nines
@test NLH.rank((9, 9, 9, Q, 7)) == 1964 # Three Nines
@test NLH.rank((9, 9, 9, Q, 6)) == 1965 # Three Nines
@test NLH.rank((9, 9, 9, Q, 5)) == 1966 # Three Nines
@test NLH.rank((9, 9, 9, Q, 4)) == 1967 # Three Nines
@test NLH.rank((9, 9, 9, Q, 3)) == 1968 # Three Nines
@test NLH.rank((9, 9, 9, Q, 2)) == 1969 # Three Nines
@test NLH.rank((9, 9, 9, J, T)) == 1970 # Three Nines
@test NLH.rank((9, 9, 9, J, 8)) == 1971 # Three Nines
@test NLH.rank((9, 9, 9, J, 7)) == 1972 # Three Nines
@test NLH.rank((9, 9, 9, J, 6)) == 1973 # Three Nines
@test NLH.rank((9, 9, 9, J, 5)) == 1974 # Three Nines
@test NLH.rank((9, 9, 9, J, 4)) == 1975 # Three Nines
@test NLH.rank((9, 9, 9, J, 3)) == 1976 # Three Nines
@test NLH.rank((9, 9, 9, J, 2)) == 1977 # Three Nines
@test NLH.rank((9, 9, 9, T, 8)) == 1978 # Three Nines
@test NLH.rank((9, 9, 9, T, 7)) == 1979 # Three Nines
@test NLH.rank((9, 9, 9, T, 6)) == 1980 # Three Nines
@test NLH.rank((9, 9, 9, T, 5)) == 1981 # Three Nines
@test NLH.rank((9, 9, 9, T, 4)) == 1982 # Three Nines
@test NLH.rank((9, 9, 9, T, 3)) == 1983 # Three Nines
@test NLH.rank((9, 9, 9, T, 2)) == 1984 # Three Nines
@test NLH.rank((9, 9, 9, 8, 7)) == 1985 # Three Nines
@test NLH.rank((9, 9, 9, 8, 6)) == 1986 # Three Nines
@test NLH.rank((9, 9, 9, 8, 5)) == 1987 # Three Nines
@test NLH.rank((9, 9, 9, 8, 4)) == 1988 # Three Nines
@test NLH.rank((9, 9, 9, 8, 3)) == 1989 # Three Nines
@test NLH.rank((9, 9, 9, 8, 2)) == 1990 # Three Nines
@test NLH.rank((9, 9, 9, 7, 6)) == 1991 # Three Nines
@test NLH.rank((9, 9, 9, 7, 5)) == 1992 # Three Nines
@test NLH.rank((9, 9, 9, 7, 4)) == 1993 # Three Nines
@test NLH.rank((9, 9, 9, 7, 3)) == 1994 # Three Nines
@test NLH.rank((9, 9, 9, 7, 2)) == 1995 # Three Nines
@test NLH.rank((9, 9, 9, 6, 5)) == 1996 # Three Nines
@test NLH.rank((9, 9, 9, 6, 4)) == 1997 # Three Nines
@test NLH.rank((9, 9, 9, 6, 3)) == 1998 # Three Nines
@test NLH.rank((9, 9, 9, 6, 2)) == 1999 # Three Nines
@test NLH.rank((9, 9, 9, 5, 4)) == 2000 # Three Nines
@test NLH.rank((9, 9, 9, 5, 3)) == 2001 # Three Nines
@test NLH.rank((9, 9, 9, 5, 2)) == 2002 # Three Nines
@test NLH.rank((9, 9, 9, 4, 3)) == 2003 # Three Nines
@test NLH.rank((9, 9, 9, 4, 2)) == 2004 # Three Nines
@test NLH.rank((9, 9, 9, 3, 2)) == 2005 # Three Nines
@test NLH.rank((8, 8, 8, A, K)) == 2006 # Three Eights
@test NLH.rank((8, 8, 8, A, Q)) == 2007 # Three Eights
@test NLH.rank((8, 8, 8, A, J)) == 2008 # Three Eights
@test NLH.rank((8, 8, 8, A, T)) == 2009 # Three Eights
@test NLH.rank((8, 8, 8, A, 9)) == 2010 # Three Eights
@test NLH.rank((8, 8, 8, A, 7)) == 2011 # Three Eights
@test NLH.rank((8, 8, 8, A, 6)) == 2012 # Three Eights
@test NLH.rank((8, 8, 8, A, 5)) == 2013 # Three Eights
@test NLH.rank((8, 8, 8, A, 4)) == 2014 # Three Eights
@test NLH.rank((8, 8, 8, A, 3)) == 2015 # Three Eights
@test NLH.rank((8, 8, 8, A, 2)) == 2016 # Three Eights
@test NLH.rank((8, 8, 8, K, Q)) == 2017 # Three Eights
@test NLH.rank((8, 8, 8, K, J)) == 2018 # Three Eights
@test NLH.rank((8, 8, 8, K, T)) == 2019 # Three Eights
@test NLH.rank((8, 8, 8, K, 9)) == 2020 # Three Eights
@test NLH.rank((8, 8, 8, K, 7)) == 2021 # Three Eights
@test NLH.rank((8, 8, 8, K, 6)) == 2022 # Three Eights
@test NLH.rank((8, 8, 8, K, 5)) == 2023 # Three Eights
@test NLH.rank((8, 8, 8, K, 4)) == 2024 # Three Eights
@test NLH.rank((8, 8, 8, K, 3)) == 2025 # Three Eights
@test NLH.rank((8, 8, 8, K, 2)) == 2026 # Three Eights
@test NLH.rank((8, 8, 8, Q, J)) == 2027 # Three Eights
@test NLH.rank((8, 8, 8, Q, T)) == 2028 # Three Eights
@test NLH.rank((8, 8, 8, Q, 9)) == 2029 # Three Eights
@test NLH.rank((8, 8, 8, Q, 7)) == 2030 # Three Eights
@test NLH.rank((8, 8, 8, Q, 6)) == 2031 # Three Eights
@test NLH.rank((8, 8, 8, Q, 5)) == 2032 # Three Eights
@test NLH.rank((8, 8, 8, Q, 4)) == 2033 # Three Eights
@test NLH.rank((8, 8, 8, Q, 3)) == 2034 # Three Eights
@test NLH.rank((8, 8, 8, Q, 2)) == 2035 # Three Eights
@test NLH.rank((8, 8, 8, J, T)) == 2036 # Three Eights
@test NLH.rank((8, 8, 8, J, 9)) == 2037 # Three Eights
@test NLH.rank((8, 8, 8, J, 7)) == 2038 # Three Eights
@test NLH.rank((8, 8, 8, J, 6)) == 2039 # Three Eights
@test NLH.rank((8, 8, 8, J, 5)) == 2040 # Three Eights
@test NLH.rank((8, 8, 8, J, 4)) == 2041 # Three Eights
@test NLH.rank((8, 8, 8, J, 3)) == 2042 # Three Eights
@test NLH.rank((8, 8, 8, J, 2)) == 2043 # Three Eights
@test NLH.rank((8, 8, 8, T, 9)) == 2044 # Three Eights
@test NLH.rank((8, 8, 8, T, 7)) == 2045 # Three Eights
@test NLH.rank((8, 8, 8, T, 6)) == 2046 # Three Eights
@test NLH.rank((8, 8, 8, T, 5)) == 2047 # Three Eights
@test NLH.rank((8, 8, 8, T, 4)) == 2048 # Three Eights
@test NLH.rank((8, 8, 8, T, 3)) == 2049 # Three Eights
@test NLH.rank((8, 8, 8, T, 2)) == 2050 # Three Eights
@test NLH.rank((8, 8, 8, 9, 7)) == 2051 # Three Eights
@test NLH.rank((8, 8, 8, 9, 6)) == 2052 # Three Eights
@test NLH.rank((8, 8, 8, 9, 5)) == 2053 # Three Eights
@test NLH.rank((8, 8, 8, 9, 4)) == 2054 # Three Eights
@test NLH.rank((8, 8, 8, 9, 3)) == 2055 # Three Eights
@test NLH.rank((8, 8, 8, 9, 2)) == 2056 # Three Eights
@test NLH.rank((8, 8, 8, 7, 6)) == 2057 # Three Eights
@test NLH.rank((8, 8, 8, 7, 5)) == 2058 # Three Eights
@test NLH.rank((8, 8, 8, 7, 4)) == 2059 # Three Eights
@test NLH.rank((8, 8, 8, 7, 3)) == 2060 # Three Eights
@test NLH.rank((8, 8, 8, 7, 2)) == 2061 # Three Eights
@test NLH.rank((8, 8, 8, 6, 5)) == 2062 # Three Eights
@test NLH.rank((8, 8, 8, 6, 4)) == 2063 # Three Eights
@test NLH.rank((8, 8, 8, 6, 3)) == 2064 # Three Eights
@test NLH.rank((8, 8, 8, 6, 2)) == 2065 # Three Eights
@test NLH.rank((8, 8, 8, 5, 4)) == 2066 # Three Eights
@test NLH.rank((8, 8, 8, 5, 3)) == 2067 # Three Eights
@test NLH.rank((8, 8, 8, 5, 2)) == 2068 # Three Eights
@test NLH.rank((8, 8, 8, 4, 3)) == 2069 # Three Eights
@test NLH.rank((8, 8, 8, 4, 2)) == 2070 # Three Eights
@test NLH.rank((8, 8, 8, 3, 2)) == 2071 # Three Eights
@test NLH.rank((7, 7, 7, A, K)) == 2072 # Three Sevens
@test NLH.rank((7, 7, 7, A, Q)) == 2073 # Three Sevens
@test NLH.rank((7, 7, 7, A, J)) == 2074 # Three Sevens
@test NLH.rank((7, 7, 7, A, T)) == 2075 # Three Sevens
@test NLH.rank((7, 7, 7, A, 9)) == 2076 # Three Sevens
@test NLH.rank((7, 7, 7, A, 8)) == 2077 # Three Sevens
@test NLH.rank((7, 7, 7, A, 6)) == 2078 # Three Sevens
@test NLH.rank((7, 7, 7, A, 5)) == 2079 # Three Sevens
@test NLH.rank((7, 7, 7, A, 4)) == 2080 # Three Sevens
@test NLH.rank((7, 7, 7, A, 3)) == 2081 # Three Sevens
@test NLH.rank((7, 7, 7, A, 2)) == 2082 # Three Sevens
@test NLH.rank((7, 7, 7, K, Q)) == 2083 # Three Sevens
@test NLH.rank((7, 7, 7, K, J)) == 2084 # Three Sevens
@test NLH.rank((7, 7, 7, K, T)) == 2085 # Three Sevens
@test NLH.rank((7, 7, 7, K, 9)) == 2086 # Three Sevens
@test NLH.rank((7, 7, 7, K, 8)) == 2087 # Three Sevens
@test NLH.rank((7, 7, 7, K, 6)) == 2088 # Three Sevens
@test NLH.rank((7, 7, 7, K, 5)) == 2089 # Three Sevens
@test NLH.rank((7, 7, 7, K, 4)) == 2090 # Three Sevens
@test NLH.rank((7, 7, 7, K, 3)) == 2091 # Three Sevens
@test NLH.rank((7, 7, 7, K, 2)) == 2092 # Three Sevens
@test NLH.rank((7, 7, 7, Q, J)) == 2093 # Three Sevens
@test NLH.rank((7, 7, 7, Q, T)) == 2094 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 9)) == 2095 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 8)) == 2096 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 6)) == 2097 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 5)) == 2098 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 4)) == 2099 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 3)) == 2100 # Three Sevens
@test NLH.rank((7, 7, 7, Q, 2)) == 2101 # Three Sevens
@test NLH.rank((7, 7, 7, J, T)) == 2102 # Three Sevens
@test NLH.rank((7, 7, 7, J, 9)) == 2103 # Three Sevens
@test NLH.rank((7, 7, 7, J, 8)) == 2104 # Three Sevens
@test NLH.rank((7, 7, 7, J, 6)) == 2105 # Three Sevens
@test NLH.rank((7, 7, 7, J, 5)) == 2106 # Three Sevens
@test NLH.rank((7, 7, 7, J, 4)) == 2107 # Three Sevens
@test NLH.rank((7, 7, 7, J, 3)) == 2108 # Three Sevens
@test NLH.rank((7, 7, 7, J, 2)) == 2109 # Three Sevens
@test NLH.rank((7, 7, 7, T, 9)) == 2110 # Three Sevens
@test NLH.rank((7, 7, 7, T, 8)) == 2111 # Three Sevens
@test NLH.rank((7, 7, 7, T, 6)) == 2112 # Three Sevens
@test NLH.rank((7, 7, 7, T, 5)) == 2113 # Three Sevens
@test NLH.rank((7, 7, 7, T, 4)) == 2114 # Three Sevens
@test NLH.rank((7, 7, 7, T, 3)) == 2115 # Three Sevens
@test NLH.rank((7, 7, 7, T, 2)) == 2116 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 8)) == 2117 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 6)) == 2118 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 5)) == 2119 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 4)) == 2120 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 3)) == 2121 # Three Sevens
@test NLH.rank((7, 7, 7, 9, 2)) == 2122 # Three Sevens
@test NLH.rank((7, 7, 7, 8, 6)) == 2123 # Three Sevens
@test NLH.rank((7, 7, 7, 8, 5)) == 2124 # Three Sevens
@test NLH.rank((7, 7, 7, 8, 4)) == 2125 # Three Sevens
@test NLH.rank((7, 7, 7, 8, 3)) == 2126 # Three Sevens
@test NLH.rank((7, 7, 7, 8, 2)) == 2127 # Three Sevens
@test NLH.rank((7, 7, 7, 6, 5)) == 2128 # Three Sevens
@test NLH.rank((7, 7, 7, 6, 4)) == 2129 # Three Sevens
@test NLH.rank((7, 7, 7, 6, 3)) == 2130 # Three Sevens
@test NLH.rank((7, 7, 7, 6, 2)) == 2131 # Three Sevens
@test NLH.rank((7, 7, 7, 5, 4)) == 2132 # Three Sevens
@test NLH.rank((7, 7, 7, 5, 3)) == 2133 # Three Sevens
@test NLH.rank((7, 7, 7, 5, 2)) == 2134 # Three Sevens
@test NLH.rank((7, 7, 7, 4, 3)) == 2135 # Three Sevens
@test NLH.rank((7, 7, 7, 4, 2)) == 2136 # Three Sevens
@test NLH.rank((7, 7, 7, 3, 2)) == 2137 # Three Sevens
@test NLH.rank((6, 6, 6, A, K)) == 2138 # Three Sixes
@test NLH.rank((6, 6, 6, A, Q)) == 2139 # Three Sixes
@test NLH.rank((6, 6, 6, A, J)) == 2140 # Three Sixes
@test NLH.rank((6, 6, 6, A, T)) == 2141 # Three Sixes
@test NLH.rank((6, 6, 6, A, 9)) == 2142 # Three Sixes
@test NLH.rank((6, 6, 6, A, 8)) == 2143 # Three Sixes
@test NLH.rank((6, 6, 6, A, 7)) == 2144 # Three Sixes
@test NLH.rank((6, 6, 6, A, 5)) == 2145 # Three Sixes
@test NLH.rank((6, 6, 6, A, 4)) == 2146 # Three Sixes
@test NLH.rank((6, 6, 6, A, 3)) == 2147 # Three Sixes
@test NLH.rank((6, 6, 6, A, 2)) == 2148 # Three Sixes
@test NLH.rank((6, 6, 6, K, Q)) == 2149 # Three Sixes
@test NLH.rank((6, 6, 6, K, J)) == 2150 # Three Sixes
@test NLH.rank((6, 6, 6, K, T)) == 2151 # Three Sixes
@test NLH.rank((6, 6, 6, K, 9)) == 2152 # Three Sixes
@test NLH.rank((6, 6, 6, K, 8)) == 2153 # Three Sixes
@test NLH.rank((6, 6, 6, K, 7)) == 2154 # Three Sixes
@test NLH.rank((6, 6, 6, K, 5)) == 2155 # Three Sixes
@test NLH.rank((6, 6, 6, K, 4)) == 2156 # Three Sixes
@test NLH.rank((6, 6, 6, K, 3)) == 2157 # Three Sixes
@test NLH.rank((6, 6, 6, K, 2)) == 2158 # Three Sixes
@test NLH.rank((6, 6, 6, Q, J)) == 2159 # Three Sixes
@test NLH.rank((6, 6, 6, Q, T)) == 2160 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 9)) == 2161 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 8)) == 2162 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 7)) == 2163 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 5)) == 2164 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 4)) == 2165 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 3)) == 2166 # Three Sixes
@test NLH.rank((6, 6, 6, Q, 2)) == 2167 # Three Sixes
@test NLH.rank((6, 6, 6, J, T)) == 2168 # Three Sixes
@test NLH.rank((6, 6, 6, J, 9)) == 2169 # Three Sixes
@test NLH.rank((6, 6, 6, J, 8)) == 2170 # Three Sixes
@test NLH.rank((6, 6, 6, J, 7)) == 2171 # Three Sixes
@test NLH.rank((6, 6, 6, J, 5)) == 2172 # Three Sixes
@test NLH.rank((6, 6, 6, J, 4)) == 2173 # Three Sixes
@test NLH.rank((6, 6, 6, J, 3)) == 2174 # Three Sixes
@test NLH.rank((6, 6, 6, J, 2)) == 2175 # Three Sixes
@test NLH.rank((6, 6, 6, T, 9)) == 2176 # Three Sixes
@test NLH.rank((6, 6, 6, T, 8)) == 2177 # Three Sixes
@test NLH.rank((6, 6, 6, T, 7)) == 2178 # Three Sixes
@test NLH.rank((6, 6, 6, T, 5)) == 2179 # Three Sixes
@test NLH.rank((6, 6, 6, T, 4)) == 2180 # Three Sixes
@test NLH.rank((6, 6, 6, T, 3)) == 2181 # Three Sixes
@test NLH.rank((6, 6, 6, T, 2)) == 2182 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 8)) == 2183 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 7)) == 2184 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 5)) == 2185 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 4)) == 2186 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 3)) == 2187 # Three Sixes
@test NLH.rank((6, 6, 6, 9, 2)) == 2188 # Three Sixes
@test NLH.rank((6, 6, 6, 8, 7)) == 2189 # Three Sixes
@test NLH.rank((6, 6, 6, 8, 5)) == 2190 # Three Sixes
@test NLH.rank((6, 6, 6, 8, 4)) == 2191 # Three Sixes
@test NLH.rank((6, 6, 6, 8, 3)) == 2192 # Three Sixes
@test NLH.rank((6, 6, 6, 8, 2)) == 2193 # Three Sixes
@test NLH.rank((6, 6, 6, 7, 5)) == 2194 # Three Sixes
@test NLH.rank((6, 6, 6, 7, 4)) == 2195 # Three Sixes
@test NLH.rank((6, 6, 6, 7, 3)) == 2196 # Three Sixes
@test NLH.rank((6, 6, 6, 7, 2)) == 2197 # Three Sixes
@test NLH.rank((6, 6, 6, 5, 4)) == 2198 # Three Sixes
@test NLH.rank((6, 6, 6, 5, 3)) == 2199 # Three Sixes
@test NLH.rank((6, 6, 6, 5, 2)) == 2200 # Three Sixes
@test NLH.rank((6, 6, 6, 4, 3)) == 2201 # Three Sixes
@test NLH.rank((6, 6, 6, 4, 2)) == 2202 # Three Sixes
@test NLH.rank((6, 6, 6, 3, 2)) == 2203 # Three Sixes
@test NLH.rank((5, 5, 5, A, K)) == 2204 # Three Fives
@test NLH.rank((5, 5, 5, A, Q)) == 2205 # Three Fives
@test NLH.rank((5, 5, 5, A, J)) == 2206 # Three Fives
@test NLH.rank((5, 5, 5, A, T)) == 2207 # Three Fives
@test NLH.rank((5, 5, 5, A, 9)) == 2208 # Three Fives
@test NLH.rank((5, 5, 5, A, 8)) == 2209 # Three Fives
@test NLH.rank((5, 5, 5, A, 7)) == 2210 # Three Fives
@test NLH.rank((5, 5, 5, A, 6)) == 2211 # Three Fives
@test NLH.rank((5, 5, 5, A, 4)) == 2212 # Three Fives
@test NLH.rank((5, 5, 5, A, 3)) == 2213 # Three Fives
@test NLH.rank((5, 5, 5, A, 2)) == 2214 # Three Fives
@test NLH.rank((5, 5, 5, K, Q)) == 2215 # Three Fives
@test NLH.rank((5, 5, 5, K, J)) == 2216 # Three Fives
@test NLH.rank((5, 5, 5, K, T)) == 2217 # Three Fives
@test NLH.rank((5, 5, 5, K, 9)) == 2218 # Three Fives
@test NLH.rank((5, 5, 5, K, 8)) == 2219 # Three Fives
@test NLH.rank((5, 5, 5, K, 7)) == 2220 # Three Fives
@test NLH.rank((5, 5, 5, K, 6)) == 2221 # Three Fives
@test NLH.rank((5, 5, 5, K, 4)) == 2222 # Three Fives
@test NLH.rank((5, 5, 5, K, 3)) == 2223 # Three Fives
@test NLH.rank((5, 5, 5, K, 2)) == 2224 # Three Fives
@test NLH.rank((5, 5, 5, Q, J)) == 2225 # Three Fives
@test NLH.rank((5, 5, 5, Q, T)) == 2226 # Three Fives
@test NLH.rank((5, 5, 5, Q, 9)) == 2227 # Three Fives
@test NLH.rank((5, 5, 5, Q, 8)) == 2228 # Three Fives
@test NLH.rank((5, 5, 5, Q, 7)) == 2229 # Three Fives
@test NLH.rank((5, 5, 5, Q, 6)) == 2230 # Three Fives
@test NLH.rank((5, 5, 5, Q, 4)) == 2231 # Three Fives
@test NLH.rank((5, 5, 5, Q, 3)) == 2232 # Three Fives
@test NLH.rank((5, 5, 5, Q, 2)) == 2233 # Three Fives
@test NLH.rank((5, 5, 5, J, T)) == 2234 # Three Fives
@test NLH.rank((5, 5, 5, J, 9)) == 2235 # Three Fives
@test NLH.rank((5, 5, 5, J, 8)) == 2236 # Three Fives
@test NLH.rank((5, 5, 5, J, 7)) == 2237 # Three Fives
@test NLH.rank((5, 5, 5, J, 6)) == 2238 # Three Fives
@test NLH.rank((5, 5, 5, J, 4)) == 2239 # Three Fives
@test NLH.rank((5, 5, 5, J, 3)) == 2240 # Three Fives
@test NLH.rank((5, 5, 5, J, 2)) == 2241 # Three Fives
@test NLH.rank((5, 5, 5, T, 9)) == 2242 # Three Fives
@test NLH.rank((5, 5, 5, T, 8)) == 2243 # Three Fives
@test NLH.rank((5, 5, 5, T, 7)) == 2244 # Three Fives
@test NLH.rank((5, 5, 5, T, 6)) == 2245 # Three Fives
@test NLH.rank((5, 5, 5, T, 4)) == 2246 # Three Fives
@test NLH.rank((5, 5, 5, T, 3)) == 2247 # Three Fives
@test NLH.rank((5, 5, 5, T, 2)) == 2248 # Three Fives
@test NLH.rank((5, 5, 5, 9, 8)) == 2249 # Three Fives
@test NLH.rank((5, 5, 5, 9, 7)) == 2250 # Three Fives
@test NLH.rank((5, 5, 5, 9, 6)) == 2251 # Three Fives
@test NLH.rank((5, 5, 5, 9, 4)) == 2252 # Three Fives
@test NLH.rank((5, 5, 5, 9, 3)) == 2253 # Three Fives
@test NLH.rank((5, 5, 5, 9, 2)) == 2254 # Three Fives
@test NLH.rank((5, 5, 5, 8, 7)) == 2255 # Three Fives
@test NLH.rank((5, 5, 5, 8, 6)) == 2256 # Three Fives
@test NLH.rank((5, 5, 5, 8, 4)) == 2257 # Three Fives
@test NLH.rank((5, 5, 5, 8, 3)) == 2258 # Three Fives
@test NLH.rank((5, 5, 5, 8, 2)) == 2259 # Three Fives
@test NLH.rank((5, 5, 5, 7, 6)) == 2260 # Three Fives
@test NLH.rank((5, 5, 5, 7, 4)) == 2261 # Three Fives
@test NLH.rank((5, 5, 5, 7, 3)) == 2262 # Three Fives
@test NLH.rank((5, 5, 5, 7, 2)) == 2263 # Three Fives
@test NLH.rank((5, 5, 5, 6, 4)) == 2264 # Three Fives
@test NLH.rank((5, 5, 5, 6, 3)) == 2265 # Three Fives
@test NLH.rank((5, 5, 5, 6, 2)) == 2266 # Three Fives
@test NLH.rank((5, 5, 5, 4, 3)) == 2267 # Three Fives
@test NLH.rank((5, 5, 5, 4, 2)) == 2268 # Three Fives
@test NLH.rank((5, 5, 5, 3, 2)) == 2269 # Three Fives
@test NLH.rank((4, 4, 4, A, K)) == 2270 # Three Fours
@test NLH.rank((4, 4, 4, A, Q)) == 2271 # Three Fours
@test NLH.rank((4, 4, 4, A, J)) == 2272 # Three Fours
@test NLH.rank((4, 4, 4, A, T)) == 2273 # Three Fours
@test NLH.rank((4, 4, 4, A, 9)) == 2274 # Three Fours
@test NLH.rank((4, 4, 4, A, 8)) == 2275 # Three Fours
@test NLH.rank((4, 4, 4, A, 7)) == 2276 # Three Fours
@test NLH.rank((4, 4, 4, A, 6)) == 2277 # Three Fours
@test NLH.rank((4, 4, 4, A, 5)) == 2278 # Three Fours
@test NLH.rank((4, 4, 4, A, 3)) == 2279 # Three Fours
@test NLH.rank((4, 4, 4, A, 2)) == 2280 # Three Fours
@test NLH.rank((4, 4, 4, K, Q)) == 2281 # Three Fours
@test NLH.rank((4, 4, 4, K, J)) == 2282 # Three Fours
@test NLH.rank((4, 4, 4, K, T)) == 2283 # Three Fours
@test NLH.rank((4, 4, 4, K, 9)) == 2284 # Three Fours
@test NLH.rank((4, 4, 4, K, 8)) == 2285 # Three Fours
@test NLH.rank((4, 4, 4, K, 7)) == 2286 # Three Fours
@test NLH.rank((4, 4, 4, K, 6)) == 2287 # Three Fours
@test NLH.rank((4, 4, 4, K, 5)) == 2288 # Three Fours
@test NLH.rank((4, 4, 4, K, 3)) == 2289 # Three Fours
@test NLH.rank((4, 4, 4, K, 2)) == 2290 # Three Fours
@test NLH.rank((4, 4, 4, Q, J)) == 2291 # Three Fours
@test NLH.rank((4, 4, 4, Q, T)) == 2292 # Three Fours
@test NLH.rank((4, 4, 4, Q, 9)) == 2293 # Three Fours
@test NLH.rank((4, 4, 4, Q, 8)) == 2294 # Three Fours
@test NLH.rank((4, 4, 4, Q, 7)) == 2295 # Three Fours
@test NLH.rank((4, 4, 4, Q, 6)) == 2296 # Three Fours
@test NLH.rank((4, 4, 4, Q, 5)) == 2297 # Three Fours
@test NLH.rank((4, 4, 4, Q, 3)) == 2298 # Three Fours
@test NLH.rank((4, 4, 4, Q, 2)) == 2299 # Three Fours
@test NLH.rank((4, 4, 4, J, T)) == 2300 # Three Fours
@test NLH.rank((4, 4, 4, J, 9)) == 2301 # Three Fours
@test NLH.rank((4, 4, 4, J, 8)) == 2302 # Three Fours
@test NLH.rank((4, 4, 4, J, 7)) == 2303 # Three Fours
@test NLH.rank((4, 4, 4, J, 6)) == 2304 # Three Fours
@test NLH.rank((4, 4, 4, J, 5)) == 2305 # Three Fours
@test NLH.rank((4, 4, 4, J, 3)) == 2306 # Three Fours
@test NLH.rank((4, 4, 4, J, 2)) == 2307 # Three Fours
@test NLH.rank((4, 4, 4, T, 9)) == 2308 # Three Fours
@test NLH.rank((4, 4, 4, T, 8)) == 2309 # Three Fours
@test NLH.rank((4, 4, 4, T, 7)) == 2310 # Three Fours
@test NLH.rank((4, 4, 4, T, 6)) == 2311 # Three Fours
@test NLH.rank((4, 4, 4, T, 5)) == 2312 # Three Fours
@test NLH.rank((4, 4, 4, T, 3)) == 2313 # Three Fours
@test NLH.rank((4, 4, 4, T, 2)) == 2314 # Three Fours
@test NLH.rank((4, 4, 4, 9, 8)) == 2315 # Three Fours
@test NLH.rank((4, 4, 4, 9, 7)) == 2316 # Three Fours
@test NLH.rank((4, 4, 4, 9, 6)) == 2317 # Three Fours
@test NLH.rank((4, 4, 4, 9, 5)) == 2318 # Three Fours
@test NLH.rank((4, 4, 4, 9, 3)) == 2319 # Three Fours
@test NLH.rank((4, 4, 4, 9, 2)) == 2320 # Three Fours
@test NLH.rank((4, 4, 4, 8, 7)) == 2321 # Three Fours
@test NLH.rank((4, 4, 4, 8, 6)) == 2322 # Three Fours
@test NLH.rank((4, 4, 4, 8, 5)) == 2323 # Three Fours
@test NLH.rank((4, 4, 4, 8, 3)) == 2324 # Three Fours
@test NLH.rank((4, 4, 4, 8, 2)) == 2325 # Three Fours
@test NLH.rank((4, 4, 4, 7, 6)) == 2326 # Three Fours
@test NLH.rank((4, 4, 4, 7, 5)) == 2327 # Three Fours
@test NLH.rank((4, 4, 4, 7, 3)) == 2328 # Three Fours
@test NLH.rank((4, 4, 4, 7, 2)) == 2329 # Three Fours
@test NLH.rank((4, 4, 4, 6, 5)) == 2330 # Three Fours
@test NLH.rank((4, 4, 4, 6, 3)) == 2331 # Three Fours
@test NLH.rank((4, 4, 4, 6, 2)) == 2332 # Three Fours
@test NLH.rank((4, 4, 4, 5, 3)) == 2333 # Three Fours
@test NLH.rank((4, 4, 4, 5, 2)) == 2334 # Three Fours
@test NLH.rank((4, 4, 4, 3, 2)) == 2335 # Three Fours
@test NLH.rank((3, 3, 3, A, K)) == 2336 # Three Treys
@test NLH.rank((3, 3, 3, A, Q)) == 2337 # Three Treys
@test NLH.rank((3, 3, 3, A, J)) == 2338 # Three Treys
@test NLH.rank((3, 3, 3, A, T)) == 2339 # Three Treys
@test NLH.rank((3, 3, 3, A, 9)) == 2340 # Three Treys
@test NLH.rank((3, 3, 3, A, 8)) == 2341 # Three Treys
@test NLH.rank((3, 3, 3, A, 7)) == 2342 # Three Treys
@test NLH.rank((3, 3, 3, A, 6)) == 2343 # Three Treys
@test NLH.rank((3, 3, 3, A, 5)) == 2344 # Three Treys
@test NLH.rank((3, 3, 3, A, 4)) == 2345 # Three Treys
@test NLH.rank((3, 3, 3, A, 2)) == 2346 # Three Treys
@test NLH.rank((3, 3, 3, K, Q)) == 2347 # Three Treys
@test NLH.rank((3, 3, 3, K, J)) == 2348 # Three Treys
@test NLH.rank((3, 3, 3, K, T)) == 2349 # Three Treys
@test NLH.rank((3, 3, 3, K, 9)) == 2350 # Three Treys
@test NLH.rank((3, 3, 3, K, 8)) == 2351 # Three Treys
@test NLH.rank((3, 3, 3, K, 7)) == 2352 # Three Treys
@test NLH.rank((3, 3, 3, K, 6)) == 2353 # Three Treys
@test NLH.rank((3, 3, 3, K, 5)) == 2354 # Three Treys
@test NLH.rank((3, 3, 3, K, 4)) == 2355 # Three Treys
@test NLH.rank((3, 3, 3, K, 2)) == 2356 # Three Treys
@test NLH.rank((3, 3, 3, Q, J)) == 2357 # Three Treys
@test NLH.rank((3, 3, 3, Q, T)) == 2358 # Three Treys
@test NLH.rank((3, 3, 3, Q, 9)) == 2359 # Three Treys
@test NLH.rank((3, 3, 3, Q, 8)) == 2360 # Three Treys
@test NLH.rank((3, 3, 3, Q, 7)) == 2361 # Three Treys
@test NLH.rank((3, 3, 3, Q, 6)) == 2362 # Three Treys
@test NLH.rank((3, 3, 3, Q, 5)) == 2363 # Three Treys
@test NLH.rank((3, 3, 3, Q, 4)) == 2364 # Three Treys
@test NLH.rank((3, 3, 3, Q, 2)) == 2365 # Three Treys
@test NLH.rank((3, 3, 3, J, T)) == 2366 # Three Treys
@test NLH.rank((3, 3, 3, J, 9)) == 2367 # Three Treys
@test NLH.rank((3, 3, 3, J, 8)) == 2368 # Three Treys
@test NLH.rank((3, 3, 3, J, 7)) == 2369 # Three Treys
@test NLH.rank((3, 3, 3, J, 6)) == 2370 # Three Treys
@test NLH.rank((3, 3, 3, J, 5)) == 2371 # Three Treys
@test NLH.rank((3, 3, 3, J, 4)) == 2372 # Three Treys
@test NLH.rank((3, 3, 3, J, 2)) == 2373 # Three Treys
@test NLH.rank((3, 3, 3, T, 9)) == 2374 # Three Treys
@test NLH.rank((3, 3, 3, T, 8)) == 2375 # Three Treys
@test NLH.rank((3, 3, 3, T, 7)) == 2376 # Three Treys
@test NLH.rank((3, 3, 3, T, 6)) == 2377 # Three Treys
@test NLH.rank((3, 3, 3, T, 5)) == 2378 # Three Treys
@test NLH.rank((3, 3, 3, T, 4)) == 2379 # Three Treys
@test NLH.rank((3, 3, 3, T, 2)) == 2380 # Three Treys
@test NLH.rank((3, 3, 3, 9, 8)) == 2381 # Three Treys
@test NLH.rank((3, 3, 3, 9, 7)) == 2382 # Three Treys
@test NLH.rank((3, 3, 3, 9, 6)) == 2383 # Three Treys
@test NLH.rank((3, 3, 3, 9, 5)) == 2384 # Three Treys
@test NLH.rank((3, 3, 3, 9, 4)) == 2385 # Three Treys
@test NLH.rank((3, 3, 3, 9, 2)) == 2386 # Three Treys
@test NLH.rank((3, 3, 3, 8, 7)) == 2387 # Three Treys
@test NLH.rank((3, 3, 3, 8, 6)) == 2388 # Three Treys
@test NLH.rank((3, 3, 3, 8, 5)) == 2389 # Three Treys
@test NLH.rank((3, 3, 3, 8, 4)) == 2390 # Three Treys
@test NLH.rank((3, 3, 3, 8, 2)) == 2391 # Three Treys
@test NLH.rank((3, 3, 3, 7, 6)) == 2392 # Three Treys
@test NLH.rank((3, 3, 3, 7, 5)) == 2393 # Three Treys
@test NLH.rank((3, 3, 3, 7, 4)) == 2394 # Three Treys
@test NLH.rank((3, 3, 3, 7, 2)) == 2395 # Three Treys
@test NLH.rank((3, 3, 3, 6, 5)) == 2396 # Three Treys
@test NLH.rank((3, 3, 3, 6, 4)) == 2397 # Three Treys
@test NLH.rank((3, 3, 3, 6, 2)) == 2398 # Three Treys
@test NLH.rank((3, 3, 3, 5, 4)) == 2399 # Three Treys
@test NLH.rank((3, 3, 3, 5, 2)) == 2400 # Three Treys
@test NLH.rank((3, 3, 3, 4, 2)) == 2401 # Three Treys
@test NLH.rank((2, 2, 2, A, K)) == 2402 # Three Deuces
@test NLH.rank((2, 2, 2, A, Q)) == 2403 # Three Deuces
@test NLH.rank((2, 2, 2, A, J)) == 2404 # Three Deuces
@test NLH.rank((2, 2, 2, A, T)) == 2405 # Three Deuces
@test NLH.rank((2, 2, 2, A, 9)) == 2406 # Three Deuces
@test NLH.rank((2, 2, 2, A, 8)) == 2407 # Three Deuces
@test NLH.rank((2, 2, 2, A, 7)) == 2408 # Three Deuces
@test NLH.rank((2, 2, 2, A, 6)) == 2409 # Three Deuces
@test NLH.rank((2, 2, 2, A, 5)) == 2410 # Three Deuces
@test NLH.rank((2, 2, 2, A, 4)) == 2411 # Three Deuces
@test NLH.rank((2, 2, 2, A, 3)) == 2412 # Three Deuces
@test NLH.rank((2, 2, 2, K, Q)) == 2413 # Three Deuces
@test NLH.rank((2, 2, 2, K, J)) == 2414 # Three Deuces
@test NLH.rank((2, 2, 2, K, T)) == 2415 # Three Deuces
@test NLH.rank((2, 2, 2, K, 9)) == 2416 # Three Deuces
@test NLH.rank((2, 2, 2, K, 8)) == 2417 # Three Deuces
@test NLH.rank((2, 2, 2, K, 7)) == 2418 # Three Deuces
@test NLH.rank((2, 2, 2, K, 6)) == 2419 # Three Deuces
@test NLH.rank((2, 2, 2, K, 5)) == 2420 # Three Deuces
@test NLH.rank((2, 2, 2, K, 4)) == 2421 # Three Deuces
@test NLH.rank((2, 2, 2, K, 3)) == 2422 # Three Deuces
@test NLH.rank((2, 2, 2, Q, J)) == 2423 # Three Deuces
@test NLH.rank((2, 2, 2, Q, T)) == 2424 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 9)) == 2425 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 8)) == 2426 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 7)) == 2427 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 6)) == 2428 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 5)) == 2429 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 4)) == 2430 # Three Deuces
@test NLH.rank((2, 2, 2, Q, 3)) == 2431 # Three Deuces
@test NLH.rank((2, 2, 2, J, T)) == 2432 # Three Deuces
@test NLH.rank((2, 2, 2, J, 9)) == 2433 # Three Deuces
@test NLH.rank((2, 2, 2, J, 8)) == 2434 # Three Deuces
@test NLH.rank((2, 2, 2, J, 7)) == 2435 # Three Deuces
@test NLH.rank((2, 2, 2, J, 6)) == 2436 # Three Deuces
@test NLH.rank((2, 2, 2, J, 5)) == 2437 # Three Deuces
@test NLH.rank((2, 2, 2, J, 4)) == 2438 # Three Deuces
@test NLH.rank((2, 2, 2, J, 3)) == 2439 # Three Deuces
@test NLH.rank((2, 2, 2, T, 9)) == 2440 # Three Deuces
@test NLH.rank((2, 2, 2, T, 8)) == 2441 # Three Deuces
@test NLH.rank((2, 2, 2, T, 7)) == 2442 # Three Deuces
@test NLH.rank((2, 2, 2, T, 6)) == 2443 # Three Deuces
@test NLH.rank((2, 2, 2, T, 5)) == 2444 # Three Deuces
@test NLH.rank((2, 2, 2, T, 4)) == 2445 # Three Deuces
@test NLH.rank((2, 2, 2, T, 3)) == 2446 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 8)) == 2447 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 7)) == 2448 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 6)) == 2449 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 5)) == 2450 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 4)) == 2451 # Three Deuces
@test NLH.rank((2, 2, 2, 9, 3)) == 2452 # Three Deuces
@test NLH.rank((2, 2, 2, 8, 7)) == 2453 # Three Deuces
@test NLH.rank((2, 2, 2, 8, 6)) == 2454 # Three Deuces
@test NLH.rank((2, 2, 2, 8, 5)) == 2455 # Three Deuces
@test NLH.rank((2, 2, 2, 8, 4)) == 2456 # Three Deuces
@test NLH.rank((2, 2, 2, 8, 3)) == 2457 # Three Deuces
@test NLH.rank((2, 2, 2, 7, 6)) == 2458 # Three Deuces
@test NLH.rank((2, 2, 2, 7, 5)) == 2459 # Three Deuces
@test NLH.rank((2, 2, 2, 7, 4)) == 2460 # Three Deuces
@test NLH.rank((2, 2, 2, 7, 3)) == 2461 # Three Deuces
@test NLH.rank((2, 2, 2, 6, 5)) == 2462 # Three Deuces
@test NLH.rank((2, 2, 2, 6, 4)) == 2463 # Three Deuces
@test NLH.rank((2, 2, 2, 6, 3)) == 2464 # Three Deuces
@test NLH.rank((2, 2, 2, 5, 4)) == 2465 # Three Deuces
@test NLH.rank((2, 2, 2, 5, 3)) == 2466 # Three Deuces
@test NLH.rank((2, 2, 2, 4, 3)) == 2467 # Three Deuces
@test NLH.rank((A, A, K, K, Q)) == 2468 # Aces and Kings
@test NLH.rank((A, A, K, K, J)) == 2469 # Aces and Kings
@test NLH.rank((A, A, K, K, T)) == 2470 # Aces and Kings
@test NLH.rank((A, A, K, K, 9)) == 2471 # Aces and Kings
@test NLH.rank((A, A, K, K, 8)) == 2472 # Aces and Kings
@test NLH.rank((A, A, K, K, 7)) == 2473 # Aces and Kings
@test NLH.rank((A, A, K, K, 6)) == 2474 # Aces and Kings
@test NLH.rank((A, A, K, K, 5)) == 2475 # Aces and Kings
@test NLH.rank((A, A, K, K, 4)) == 2476 # Aces and Kings
@test NLH.rank((A, A, K, K, 3)) == 2477 # Aces and Kings
@test NLH.rank((A, A, K, K, 2)) == 2478 # Aces and Kings
@test NLH.rank((A, A, Q, Q, K)) == 2479 # Aces and Queens
@test NLH.rank((A, A, Q, Q, J)) == 2480 # Aces and Queens
@test NLH.rank((A, A, Q, Q, T)) == 2481 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 9)) == 2482 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 8)) == 2483 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 7)) == 2484 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 6)) == 2485 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 5)) == 2486 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 4)) == 2487 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 3)) == 2488 # Aces and Queens
@test NLH.rank((A, A, Q, Q, 2)) == 2489 # Aces and Queens
@test NLH.rank((A, A, J, J, K)) == 2490 # Aces and Jacks
@test NLH.rank((A, A, J, J, Q)) == 2491 # Aces and Jacks
@test NLH.rank((A, A, J, J, T)) == 2492 # Aces and Jacks
@test NLH.rank((A, A, J, J, 9)) == 2493 # Aces and Jacks
@test NLH.rank((A, A, J, J, 8)) == 2494 # Aces and Jacks
@test NLH.rank((A, A, J, J, 7)) == 2495 # Aces and Jacks
@test NLH.rank((A, A, J, J, 6)) == 2496 # Aces and Jacks
@test NLH.rank((A, A, J, J, 5)) == 2497 # Aces and Jacks
@test NLH.rank((A, A, J, J, 4)) == 2498 # Aces and Jacks
@test NLH.rank((A, A, J, J, 3)) == 2499 # Aces and Jacks
@test NLH.rank((A, A, J, J, 2)) == 2500 # Aces and Jacks
@test NLH.rank((A, A, T, T, K)) == 2501 # Aces and Tens
@test NLH.rank((A, A, T, T, Q)) == 2502 # Aces and Tens
@test NLH.rank((A, A, T, T, J)) == 2503 # Aces and Tens
@test NLH.rank((A, A, T, T, 9)) == 2504 # Aces and Tens
@test NLH.rank((A, A, T, T, 8)) == 2505 # Aces and Tens
@test NLH.rank((A, A, T, T, 7)) == 2506 # Aces and Tens
@test NLH.rank((A, A, T, T, 6)) == 2507 # Aces and Tens
@test NLH.rank((A, A, T, T, 5)) == 2508 # Aces and Tens
@test NLH.rank((A, A, T, T, 4)) == 2509 # Aces and Tens
@test NLH.rank((A, A, T, T, 3)) == 2510 # Aces and Tens
@test NLH.rank((A, A, T, T, 2)) == 2511 # Aces and Tens
@test NLH.rank((A, A, 9, 9, K)) == 2512 # Aces and Nines
@test NLH.rank((A, A, 9, 9, Q)) == 2513 # Aces and Nines
@test NLH.rank((A, A, 9, 9, J)) == 2514 # Aces and Nines
@test NLH.rank((A, A, 9, 9, T)) == 2515 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 8)) == 2516 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 7)) == 2517 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 6)) == 2518 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 5)) == 2519 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 4)) == 2520 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 3)) == 2521 # Aces and Nines
@test NLH.rank((A, A, 9, 9, 2)) == 2522 # Aces and Nines
@test NLH.rank((A, A, 8, 8, K)) == 2523 # Aces and Eights
@test NLH.rank((A, A, 8, 8, Q)) == 2524 # Aces and Eights
@test NLH.rank((A, A, 8, 8, J)) == 2525 # Aces and Eights
@test NLH.rank((A, A, 8, 8, T)) == 2526 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 9)) == 2527 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 7)) == 2528 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 6)) == 2529 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 5)) == 2530 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 4)) == 2531 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 3)) == 2532 # Aces and Eights
@test NLH.rank((A, A, 8, 8, 2)) == 2533 # Aces and Eights
@test NLH.rank((A, A, 7, 7, K)) == 2534 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, Q)) == 2535 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, J)) == 2536 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, T)) == 2537 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 9)) == 2538 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 8)) == 2539 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 6)) == 2540 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 5)) == 2541 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 4)) == 2542 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 3)) == 2543 # Aces and Sevens
@test NLH.rank((A, A, 7, 7, 2)) == 2544 # Aces and Sevens
@test NLH.rank((A, A, 6, 6, K)) == 2545 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, Q)) == 2546 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, J)) == 2547 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, T)) == 2548 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 9)) == 2549 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 8)) == 2550 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 7)) == 2551 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 5)) == 2552 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 4)) == 2553 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 3)) == 2554 # Aces and Sixes
@test NLH.rank((A, A, 6, 6, 2)) == 2555 # Aces and Sixes
@test NLH.rank((A, A, 5, 5, K)) == 2556 # Aces and Fives
@test NLH.rank((A, A, 5, 5, Q)) == 2557 # Aces and Fives
@test NLH.rank((A, A, 5, 5, J)) == 2558 # Aces and Fives
@test NLH.rank((A, A, 5, 5, T)) == 2559 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 9)) == 2560 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 8)) == 2561 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 7)) == 2562 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 6)) == 2563 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 4)) == 2564 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 3)) == 2565 # Aces and Fives
@test NLH.rank((A, A, 5, 5, 2)) == 2566 # Aces and Fives
@test NLH.rank((A, A, 4, 4, K)) == 2567 # Aces and Fours
@test NLH.rank((A, A, 4, 4, Q)) == 2568 # Aces and Fours
@test NLH.rank((A, A, 4, 4, J)) == 2569 # Aces and Fours
@test NLH.rank((A, A, 4, 4, T)) == 2570 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 9)) == 2571 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 8)) == 2572 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 7)) == 2573 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 6)) == 2574 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 5)) == 2575 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 3)) == 2576 # Aces and Fours
@test NLH.rank((A, A, 4, 4, 2)) == 2577 # Aces and Fours
@test NLH.rank((A, A, 3, 3, K)) == 2578 # Aces and Treys
@test NLH.rank((A, A, 3, 3, Q)) == 2579 # Aces and Treys
@test NLH.rank((A, A, 3, 3, J)) == 2580 # Aces and Treys
@test NLH.rank((A, A, 3, 3, T)) == 2581 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 9)) == 2582 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 8)) == 2583 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 7)) == 2584 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 6)) == 2585 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 5)) == 2586 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 4)) == 2587 # Aces and Treys
@test NLH.rank((A, A, 3, 3, 2)) == 2588 # Aces and Treys
@test NLH.rank((A, A, 2, 2, K)) == 2589 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, Q)) == 2590 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, J)) == 2591 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, T)) == 2592 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 9)) == 2593 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 8)) == 2594 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 7)) == 2595 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 6)) == 2596 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 5)) == 2597 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 4)) == 2598 # Aces and Deuces
@test NLH.rank((A, A, 2, 2, 3)) == 2599 # Aces and Deuces
@test NLH.rank((K, K, Q, Q, A)) == 2600 # Kings and Queens
@test NLH.rank((K, K, Q, Q, J)) == 2601 # Kings and Queens
@test NLH.rank((K, K, Q, Q, T)) == 2602 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 9)) == 2603 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 8)) == 2604 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 7)) == 2605 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 6)) == 2606 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 5)) == 2607 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 4)) == 2608 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 3)) == 2609 # Kings and Queens
@test NLH.rank((K, K, Q, Q, 2)) == 2610 # Kings and Queens
@test NLH.rank((K, K, J, J, A)) == 2611 # Kings and Jacks
@test NLH.rank((K, K, J, J, Q)) == 2612 # Kings and Jacks
@test NLH.rank((K, K, J, J, T)) == 2613 # Kings and Jacks
@test NLH.rank((K, K, J, J, 9)) == 2614 # Kings and Jacks
@test NLH.rank((K, K, J, J, 8)) == 2615 # Kings and Jacks
@test NLH.rank((K, K, J, J, 7)) == 2616 # Kings and Jacks
@test NLH.rank((K, K, J, J, 6)) == 2617 # Kings and Jacks
@test NLH.rank((K, K, J, J, 5)) == 2618 # Kings and Jacks
@test NLH.rank((K, K, J, J, 4)) == 2619 # Kings and Jacks
@test NLH.rank((K, K, J, J, 3)) == 2620 # Kings and Jacks
@test NLH.rank((K, K, J, J, 2)) == 2621 # Kings and Jacks
@test NLH.rank((K, K, T, T, A)) == 2622 # Kings and Tens
@test NLH.rank((K, K, T, T, Q)) == 2623 # Kings and Tens
@test NLH.rank((K, K, T, T, J)) == 2624 # Kings and Tens
@test NLH.rank((K, K, T, T, 9)) == 2625 # Kings and Tens
@test NLH.rank((K, K, T, T, 8)) == 2626 # Kings and Tens
@test NLH.rank((K, K, T, T, 7)) == 2627 # Kings and Tens
@test NLH.rank((K, K, T, T, 6)) == 2628 # Kings and Tens
@test NLH.rank((K, K, T, T, 5)) == 2629 # Kings and Tens
@test NLH.rank((K, K, T, T, 4)) == 2630 # Kings and Tens
@test NLH.rank((K, K, T, T, 3)) == 2631 # Kings and Tens
@test NLH.rank((K, K, T, T, 2)) == 2632 # Kings and Tens
@test NLH.rank((K, K, 9, 9, A)) == 2633 # Kings and Nines
@test NLH.rank((K, K, 9, 9, Q)) == 2634 # Kings and Nines
@test NLH.rank((K, K, 9, 9, J)) == 2635 # Kings and Nines
@test NLH.rank((K, K, 9, 9, T)) == 2636 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 8)) == 2637 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 7)) == 2638 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 6)) == 2639 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 5)) == 2640 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 4)) == 2641 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 3)) == 2642 # Kings and Nines
@test NLH.rank((K, K, 9, 9, 2)) == 2643 # Kings and Nines
@test NLH.rank((K, K, 8, 8, A)) == 2644 # Kings and Eights
@test NLH.rank((K, K, 8, 8, Q)) == 2645 # Kings and Eights
@test NLH.rank((K, K, 8, 8, J)) == 2646 # Kings and Eights
@test NLH.rank((K, K, 8, 8, T)) == 2647 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 9)) == 2648 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 7)) == 2649 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 6)) == 2650 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 5)) == 2651 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 4)) == 2652 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 3)) == 2653 # Kings and Eights
@test NLH.rank((K, K, 8, 8, 2)) == 2654 # Kings and Eights
@test NLH.rank((K, K, 7, 7, A)) == 2655 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, Q)) == 2656 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, J)) == 2657 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, T)) == 2658 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 9)) == 2659 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 8)) == 2660 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 6)) == 2661 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 5)) == 2662 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 4)) == 2663 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 3)) == 2664 # Kings and Sevens
@test NLH.rank((K, K, 7, 7, 2)) == 2665 # Kings and Sevens
@test NLH.rank((K, K, 6, 6, A)) == 2666 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, Q)) == 2667 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, J)) == 2668 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, T)) == 2669 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 9)) == 2670 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 8)) == 2671 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 7)) == 2672 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 5)) == 2673 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 4)) == 2674 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 3)) == 2675 # Kings and Sixes
@test NLH.rank((K, K, 6, 6, 2)) == 2676 # Kings and Sixes
@test NLH.rank((K, K, 5, 5, A)) == 2677 # Kings and Fives
@test NLH.rank((K, K, 5, 5, Q)) == 2678 # Kings and Fives
@test NLH.rank((K, K, 5, 5, J)) == 2679 # Kings and Fives
@test NLH.rank((K, K, 5, 5, T)) == 2680 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 9)) == 2681 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 8)) == 2682 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 7)) == 2683 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 6)) == 2684 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 4)) == 2685 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 3)) == 2686 # Kings and Fives
@test NLH.rank((K, K, 5, 5, 2)) == 2687 # Kings and Fives
@test NLH.rank((K, K, 4, 4, A)) == 2688 # Kings and Fours
@test NLH.rank((K, K, 4, 4, Q)) == 2689 # Kings and Fours
@test NLH.rank((K, K, 4, 4, J)) == 2690 # Kings and Fours
@test NLH.rank((K, K, 4, 4, T)) == 2691 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 9)) == 2692 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 8)) == 2693 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 7)) == 2694 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 6)) == 2695 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 5)) == 2696 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 3)) == 2697 # Kings and Fours
@test NLH.rank((K, K, 4, 4, 2)) == 2698 # Kings and Fours
@test NLH.rank((K, K, 3, 3, A)) == 2699 # Kings and Treys
@test NLH.rank((K, K, 3, 3, Q)) == 2700 # Kings and Treys
@test NLH.rank((K, K, 3, 3, J)) == 2701 # Kings and Treys
@test NLH.rank((K, K, 3, 3, T)) == 2702 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 9)) == 2703 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 8)) == 2704 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 7)) == 2705 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 6)) == 2706 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 5)) == 2707 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 4)) == 2708 # Kings and Treys
@test NLH.rank((K, K, 3, 3, 2)) == 2709 # Kings and Treys
@test NLH.rank((K, K, 2, 2, A)) == 2710 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, Q)) == 2711 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, J)) == 2712 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, T)) == 2713 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 9)) == 2714 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 8)) == 2715 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 7)) == 2716 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 6)) == 2717 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 5)) == 2718 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 4)) == 2719 # Kings and Deuces
@test NLH.rank((K, K, 2, 2, 3)) == 2720 # Kings and Deuces
@test NLH.rank((Q, Q, J, J, A)) == 2721 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, K)) == 2722 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, T)) == 2723 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 9)) == 2724 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 8)) == 2725 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 7)) == 2726 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 6)) == 2727 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 5)) == 2728 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 4)) == 2729 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 3)) == 2730 # Queens and Jacks
@test NLH.rank((Q, Q, J, J, 2)) == 2731 # Queens and Jacks
@test NLH.rank((Q, Q, T, T, A)) == 2732 # Queens and Tens
@test NLH.rank((Q, Q, T, T, K)) == 2733 # Queens and Tens
@test NLH.rank((Q, Q, T, T, J)) == 2734 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 9)) == 2735 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 8)) == 2736 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 7)) == 2737 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 6)) == 2738 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 5)) == 2739 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 4)) == 2740 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 3)) == 2741 # Queens and Tens
@test NLH.rank((Q, Q, T, T, 2)) == 2742 # Queens and Tens
@test NLH.rank((Q, Q, 9, 9, A)) == 2743 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, K)) == 2744 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, J)) == 2745 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, T)) == 2746 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 8)) == 2747 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 7)) == 2748 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 6)) == 2749 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 5)) == 2750 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 4)) == 2751 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 3)) == 2752 # Queens and Nines
@test NLH.rank((Q, Q, 9, 9, 2)) == 2753 # Queens and Nines
@test NLH.rank((Q, Q, 8, 8, A)) == 2754 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, K)) == 2755 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, J)) == 2756 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, T)) == 2757 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 9)) == 2758 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 7)) == 2759 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 6)) == 2760 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 5)) == 2761 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 4)) == 2762 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 3)) == 2763 # Queens and Eights
@test NLH.rank((Q, Q, 8, 8, 2)) == 2764 # Queens and Eights
@test NLH.rank((Q, Q, 7, 7, A)) == 2765 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, K)) == 2766 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, J)) == 2767 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, T)) == 2768 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 9)) == 2769 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 8)) == 2770 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 6)) == 2771 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 5)) == 2772 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 4)) == 2773 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 3)) == 2774 # Queens and Sevens
@test NLH.rank((Q, Q, 7, 7, 2)) == 2775 # Queens and Sevens
@test NLH.rank((Q, Q, 6, 6, A)) == 2776 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, K)) == 2777 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, J)) == 2778 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, T)) == 2779 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 9)) == 2780 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 8)) == 2781 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 7)) == 2782 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 5)) == 2783 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 4)) == 2784 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 3)) == 2785 # Queens and Sixes
@test NLH.rank((Q, Q, 6, 6, 2)) == 2786 # Queens and Sixes
@test NLH.rank((Q, Q, 5, 5, A)) == 2787 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, K)) == 2788 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, J)) == 2789 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, T)) == 2790 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 9)) == 2791 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 8)) == 2792 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 7)) == 2793 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 6)) == 2794 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 4)) == 2795 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 3)) == 2796 # Queens and Fives
@test NLH.rank((Q, Q, 5, 5, 2)) == 2797 # Queens and Fives
@test NLH.rank((Q, Q, 4, 4, A)) == 2798 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, K)) == 2799 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, J)) == 2800 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, T)) == 2801 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 9)) == 2802 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 8)) == 2803 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 7)) == 2804 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 6)) == 2805 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 5)) == 2806 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 3)) == 2807 # Queens and Fours
@test NLH.rank((Q, Q, 4, 4, 2)) == 2808 # Queens and Fours
@test NLH.rank((Q, Q, 3, 3, A)) == 2809 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, K)) == 2810 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, J)) == 2811 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, T)) == 2812 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 9)) == 2813 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 8)) == 2814 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 7)) == 2815 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 6)) == 2816 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 5)) == 2817 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 4)) == 2818 # Queens and Treys
@test NLH.rank((Q, Q, 3, 3, 2)) == 2819 # Queens and Treys
@test NLH.rank((Q, Q, 2, 2, A)) == 2820 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, K)) == 2821 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, J)) == 2822 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, T)) == 2823 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 9)) == 2824 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 8)) == 2825 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 7)) == 2826 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 6)) == 2827 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 5)) == 2828 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 4)) == 2829 # Queens and Deuces
@test NLH.rank((Q, Q, 2, 2, 3)) == 2830 # Queens and Deuces
@test NLH.rank((J, J, T, T, A)) == 2831 # Jacks and Tens
@test NLH.rank((J, J, T, T, K)) == 2832 # Jacks and Tens
@test NLH.rank((J, J, T, T, Q)) == 2833 # Jacks and Tens
@test NLH.rank((J, J, T, T, 9)) == 2834 # Jacks and Tens
@test NLH.rank((J, J, T, T, 8)) == 2835 # Jacks and Tens
@test NLH.rank((J, J, T, T, 7)) == 2836 # Jacks and Tens
@test NLH.rank((J, J, T, T, 6)) == 2837 # Jacks and Tens
@test NLH.rank((J, J, T, T, 5)) == 2838 # Jacks and Tens
@test NLH.rank((J, J, T, T, 4)) == 2839 # Jacks and Tens
@test NLH.rank((J, J, T, T, 3)) == 2840 # Jacks and Tens
@test NLH.rank((J, J, T, T, 2)) == 2841 # Jacks and Tens
@test NLH.rank((J, J, 9, 9, A)) == 2842 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, K)) == 2843 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, Q)) == 2844 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, T)) == 2845 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 8)) == 2846 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 7)) == 2847 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 6)) == 2848 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 5)) == 2849 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 4)) == 2850 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 3)) == 2851 # Jacks and Nines
@test NLH.rank((J, J, 9, 9, 2)) == 2852 # Jacks and Nines
@test NLH.rank((J, J, 8, 8, A)) == 2853 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, K)) == 2854 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, Q)) == 2855 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, T)) == 2856 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 9)) == 2857 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 7)) == 2858 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 6)) == 2859 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 5)) == 2860 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 4)) == 2861 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 3)) == 2862 # Jacks and Eights
@test NLH.rank((J, J, 8, 8, 2)) == 2863 # Jacks and Eights
@test NLH.rank((J, J, 7, 7, A)) == 2864 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, K)) == 2865 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, Q)) == 2866 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, T)) == 2867 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 9)) == 2868 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 8)) == 2869 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 6)) == 2870 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 5)) == 2871 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 4)) == 2872 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 3)) == 2873 # Jacks and Sevens
@test NLH.rank((J, J, 7, 7, 2)) == 2874 # Jacks and Sevens
@test NLH.rank((J, J, 6, 6, A)) == 2875 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, K)) == 2876 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, Q)) == 2877 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, T)) == 2878 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 9)) == 2879 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 8)) == 2880 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 7)) == 2881 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 5)) == 2882 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 4)) == 2883 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 3)) == 2884 # Jacks and Sixes
@test NLH.rank((J, J, 6, 6, 2)) == 2885 # Jacks and Sixes
@test NLH.rank((J, J, 5, 5, A)) == 2886 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, K)) == 2887 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, Q)) == 2888 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, T)) == 2889 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 9)) == 2890 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 8)) == 2891 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 7)) == 2892 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 6)) == 2893 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 4)) == 2894 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 3)) == 2895 # Jacks and Fives
@test NLH.rank((J, J, 5, 5, 2)) == 2896 # Jacks and Fives
@test NLH.rank((J, J, 4, 4, A)) == 2897 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, K)) == 2898 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, Q)) == 2899 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, T)) == 2900 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 9)) == 2901 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 8)) == 2902 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 7)) == 2903 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 6)) == 2904 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 5)) == 2905 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 3)) == 2906 # Jacks and Fours
@test NLH.rank((J, J, 4, 4, 2)) == 2907 # Jacks and Fours
@test NLH.rank((J, J, 3, 3, A)) == 2908 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, K)) == 2909 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, Q)) == 2910 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, T)) == 2911 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 9)) == 2912 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 8)) == 2913 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 7)) == 2914 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 6)) == 2915 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 5)) == 2916 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 4)) == 2917 # Jacks and Treys
@test NLH.rank((J, J, 3, 3, 2)) == 2918 # Jacks and Treys
@test NLH.rank((J, J, 2, 2, A)) == 2919 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, K)) == 2920 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, Q)) == 2921 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, T)) == 2922 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 9)) == 2923 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 8)) == 2924 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 7)) == 2925 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 6)) == 2926 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 5)) == 2927 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 4)) == 2928 # Jacks and Deuces
@test NLH.rank((J, J, 2, 2, 3)) == 2929 # Jacks and Deuces
@test NLH.rank((T, T, 9, 9, A)) == 2930 # Tens and Nines
@test NLH.rank((T, T, 9, 9, K)) == 2931 # Tens and Nines
@test NLH.rank((T, T, 9, 9, Q)) == 2932 # Tens and Nines
@test NLH.rank((T, T, 9, 9, J)) == 2933 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 8)) == 2934 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 7)) == 2935 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 6)) == 2936 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 5)) == 2937 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 4)) == 2938 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 3)) == 2939 # Tens and Nines
@test NLH.rank((T, T, 9, 9, 2)) == 2940 # Tens and Nines
@test NLH.rank((T, T, 8, 8, A)) == 2941 # Tens and Eights
@test NLH.rank((T, T, 8, 8, K)) == 2942 # Tens and Eights
@test NLH.rank((T, T, 8, 8, Q)) == 2943 # Tens and Eights
@test NLH.rank((T, T, 8, 8, J)) == 2944 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 9)) == 2945 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 7)) == 2946 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 6)) == 2947 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 5)) == 2948 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 4)) == 2949 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 3)) == 2950 # Tens and Eights
@test NLH.rank((T, T, 8, 8, 2)) == 2951 # Tens and Eights
@test NLH.rank((T, T, 7, 7, A)) == 2952 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, K)) == 2953 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, Q)) == 2954 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, J)) == 2955 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 9)) == 2956 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 8)) == 2957 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 6)) == 2958 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 5)) == 2959 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 4)) == 2960 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 3)) == 2961 # Tens and Sevens
@test NLH.rank((T, T, 7, 7, 2)) == 2962 # Tens and Sevens
@test NLH.rank((T, T, 6, 6, A)) == 2963 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, K)) == 2964 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, Q)) == 2965 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, J)) == 2966 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 9)) == 2967 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 8)) == 2968 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 7)) == 2969 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 5)) == 2970 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 4)) == 2971 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 3)) == 2972 # Tens and Sixes
@test NLH.rank((T, T, 6, 6, 2)) == 2973 # Tens and Sixes
@test NLH.rank((T, T, 5, 5, A)) == 2974 # Tens and Fives
@test NLH.rank((T, T, 5, 5, K)) == 2975 # Tens and Fives
@test NLH.rank((T, T, 5, 5, Q)) == 2976 # Tens and Fives
@test NLH.rank((T, T, 5, 5, J)) == 2977 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 9)) == 2978 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 8)) == 2979 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 7)) == 2980 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 6)) == 2981 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 4)) == 2982 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 3)) == 2983 # Tens and Fives
@test NLH.rank((T, T, 5, 5, 2)) == 2984 # Tens and Fives
@test NLH.rank((T, T, 4, 4, A)) == 2985 # Tens and Fours
@test NLH.rank((T, T, 4, 4, K)) == 2986 # Tens and Fours
@test NLH.rank((T, T, 4, 4, Q)) == 2987 # Tens and Fours
@test NLH.rank((T, T, 4, 4, J)) == 2988 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 9)) == 2989 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 8)) == 2990 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 7)) == 2991 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 6)) == 2992 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 5)) == 2993 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 3)) == 2994 # Tens and Fours
@test NLH.rank((T, T, 4, 4, 2)) == 2995 # Tens and Fours
@test NLH.rank((T, T, 3, 3, A)) == 2996 # Tens and Treys
@test NLH.rank((T, T, 3, 3, K)) == 2997 # Tens and Treys
@test NLH.rank((T, T, 3, 3, Q)) == 2998 # Tens and Treys
@test NLH.rank((T, T, 3, 3, J)) == 2999 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 9)) == 3000 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 8)) == 3001 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 7)) == 3002 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 6)) == 3003 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 5)) == 3004 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 4)) == 3005 # Tens and Treys
@test NLH.rank((T, T, 3, 3, 2)) == 3006 # Tens and Treys
@test NLH.rank((T, T, 2, 2, A)) == 3007 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, K)) == 3008 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, Q)) == 3009 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, J)) == 3010 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 9)) == 3011 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 8)) == 3012 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 7)) == 3013 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 6)) == 3014 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 5)) == 3015 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 4)) == 3016 # Tens and Deuces
@test NLH.rank((T, T, 2, 2, 3)) == 3017 # Tens and Deuces
@test NLH.rank((9, 9, 8, 8, A)) == 3018 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, K)) == 3019 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, Q)) == 3020 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, J)) == 3021 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, T)) == 3022 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 7)) == 3023 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 6)) == 3024 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 5)) == 3025 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 4)) == 3026 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 3)) == 3027 # Nines and Eights
@test NLH.rank((9, 9, 8, 8, 2)) == 3028 # Nines and Eights
@test NLH.rank((9, 9, 7, 7, A)) == 3029 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, K)) == 3030 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, Q)) == 3031 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, J)) == 3032 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, T)) == 3033 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 8)) == 3034 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 6)) == 3035 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 5)) == 3036 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 4)) == 3037 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 3)) == 3038 # Nines and Sevens
@test NLH.rank((9, 9, 7, 7, 2)) == 3039 # Nines and Sevens
@test NLH.rank((9, 9, 6, 6, A)) == 3040 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, K)) == 3041 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, Q)) == 3042 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, J)) == 3043 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, T)) == 3044 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 8)) == 3045 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 7)) == 3046 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 5)) == 3047 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 4)) == 3048 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 3)) == 3049 # Nines and Sixes
@test NLH.rank((9, 9, 6, 6, 2)) == 3050 # Nines and Sixes
@test NLH.rank((9, 9, 5, 5, A)) == 3051 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, K)) == 3052 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, Q)) == 3053 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, J)) == 3054 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, T)) == 3055 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 8)) == 3056 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 7)) == 3057 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 6)) == 3058 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 4)) == 3059 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 3)) == 3060 # Nines and Fives
@test NLH.rank((9, 9, 5, 5, 2)) == 3061 # Nines and Fives
@test NLH.rank((9, 9, 4, 4, A)) == 3062 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, K)) == 3063 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, Q)) == 3064 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, J)) == 3065 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, T)) == 3066 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 8)) == 3067 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 7)) == 3068 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 6)) == 3069 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 5)) == 3070 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 3)) == 3071 # Nines and Fours
@test NLH.rank((9, 9, 4, 4, 2)) == 3072 # Nines and Fours
@test NLH.rank((9, 9, 3, 3, A)) == 3073 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, K)) == 3074 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, Q)) == 3075 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, J)) == 3076 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, T)) == 3077 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 8)) == 3078 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 7)) == 3079 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 6)) == 3080 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 5)) == 3081 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 4)) == 3082 # Nines and Treys
@test NLH.rank((9, 9, 3, 3, 2)) == 3083 # Nines and Treys
@test NLH.rank((9, 9, 2, 2, A)) == 3084 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, K)) == 3085 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, Q)) == 3086 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, J)) == 3087 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, T)) == 3088 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 8)) == 3089 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 7)) == 3090 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 6)) == 3091 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 5)) == 3092 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 4)) == 3093 # Nines and Deuces
@test NLH.rank((9, 9, 2, 2, 3)) == 3094 # Nines and Deuces
@test NLH.rank((8, 8, 7, 7, A)) == 3095 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, K)) == 3096 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, Q)) == 3097 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, J)) == 3098 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, T)) == 3099 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 9)) == 3100 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 6)) == 3101 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 5)) == 3102 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 4)) == 3103 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 3)) == 3104 # Eights and Sevens
@test NLH.rank((8, 8, 7, 7, 2)) == 3105 # Eights and Sevens
@test NLH.rank((8, 8, 6, 6, A)) == 3106 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, K)) == 3107 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, Q)) == 3108 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, J)) == 3109 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, T)) == 3110 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 9)) == 3111 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 7)) == 3112 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 5)) == 3113 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 4)) == 3114 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 3)) == 3115 # Eights and Sixes
@test NLH.rank((8, 8, 6, 6, 2)) == 3116 # Eights and Sixes
@test NLH.rank((8, 8, 5, 5, A)) == 3117 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, K)) == 3118 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, Q)) == 3119 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, J)) == 3120 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, T)) == 3121 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 9)) == 3122 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 7)) == 3123 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 6)) == 3124 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 4)) == 3125 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 3)) == 3126 # Eights and Fives
@test NLH.rank((8, 8, 5, 5, 2)) == 3127 # Eights and Fives
@test NLH.rank((8, 8, 4, 4, A)) == 3128 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, K)) == 3129 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, Q)) == 3130 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, J)) == 3131 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, T)) == 3132 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 9)) == 3133 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 7)) == 3134 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 6)) == 3135 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 5)) == 3136 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 3)) == 3137 # Eights and Fours
@test NLH.rank((8, 8, 4, 4, 2)) == 3138 # Eights and Fours
@test NLH.rank((8, 8, 3, 3, A)) == 3139 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, K)) == 3140 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, Q)) == 3141 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, J)) == 3142 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, T)) == 3143 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 9)) == 3144 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 7)) == 3145 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 6)) == 3146 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 5)) == 3147 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 4)) == 3148 # Eights and Treys
@test NLH.rank((8, 8, 3, 3, 2)) == 3149 # Eights and Treys
@test NLH.rank((8, 8, 2, 2, A)) == 3150 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, K)) == 3151 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, Q)) == 3152 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, J)) == 3153 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, T)) == 3154 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 9)) == 3155 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 7)) == 3156 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 6)) == 3157 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 5)) == 3158 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 4)) == 3159 # Eights and Deuces
@test NLH.rank((8, 8, 2, 2, 3)) == 3160 # Eights and Deuces
@test NLH.rank((7, 7, 6, 6, A)) == 3161 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, K)) == 3162 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, Q)) == 3163 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, J)) == 3164 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, T)) == 3165 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 9)) == 3166 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 8)) == 3167 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 5)) == 3168 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 4)) == 3169 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 3)) == 3170 # Sevens and Sixes
@test NLH.rank((7, 7, 6, 6, 2)) == 3171 # Sevens and Sixes
@test NLH.rank((7, 7, 5, 5, A)) == 3172 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, K)) == 3173 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, Q)) == 3174 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, J)) == 3175 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, T)) == 3176 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 9)) == 3177 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 8)) == 3178 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 6)) == 3179 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 4)) == 3180 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 3)) == 3181 # Sevens and Fives
@test NLH.rank((7, 7, 5, 5, 2)) == 3182 # Sevens and Fives
@test NLH.rank((7, 7, 4, 4, A)) == 3183 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, K)) == 3184 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, Q)) == 3185 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, J)) == 3186 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, T)) == 3187 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 9)) == 3188 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 8)) == 3189 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 6)) == 3190 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 5)) == 3191 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 3)) == 3192 # Sevens and Fours
@test NLH.rank((7, 7, 4, 4, 2)) == 3193 # Sevens and Fours
@test NLH.rank((7, 7, 3, 3, A)) == 3194 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, K)) == 3195 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, Q)) == 3196 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, J)) == 3197 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, T)) == 3198 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 9)) == 3199 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 8)) == 3200 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 6)) == 3201 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 5)) == 3202 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 4)) == 3203 # Sevens and Treys
@test NLH.rank((7, 7, 3, 3, 2)) == 3204 # Sevens and Treys
@test NLH.rank((7, 7, 2, 2, A)) == 3205 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, K)) == 3206 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, Q)) == 3207 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, J)) == 3208 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, T)) == 3209 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 9)) == 3210 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 8)) == 3211 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 6)) == 3212 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 5)) == 3213 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 4)) == 3214 # Sevens and Deuces
@test NLH.rank((7, 7, 2, 2, 3)) == 3215 # Sevens and Deuces
@test NLH.rank((6, 6, 5, 5, A)) == 3216 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, K)) == 3217 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, Q)) == 3218 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, J)) == 3219 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, T)) == 3220 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 9)) == 3221 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 8)) == 3222 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 7)) == 3223 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 4)) == 3224 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 3)) == 3225 # Sixes and Fives
@test NLH.rank((6, 6, 5, 5, 2)) == 3226 # Sixes and Fives
@test NLH.rank((6, 6, 4, 4, A)) == 3227 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, K)) == 3228 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, Q)) == 3229 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, J)) == 3230 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, T)) == 3231 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 9)) == 3232 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 8)) == 3233 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 7)) == 3234 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 5)) == 3235 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 3)) == 3236 # Sixes and Fours
@test NLH.rank((6, 6, 4, 4, 2)) == 3237 # Sixes and Fours
@test NLH.rank((6, 6, 3, 3, A)) == 3238 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, K)) == 3239 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, Q)) == 3240 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, J)) == 3241 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, T)) == 3242 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 9)) == 3243 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 8)) == 3244 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 7)) == 3245 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 5)) == 3246 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 4)) == 3247 # Sixes and Treys
@test NLH.rank((6, 6, 3, 3, 2)) == 3248 # Sixes and Treys
@test NLH.rank((6, 6, 2, 2, A)) == 3249 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, K)) == 3250 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, Q)) == 3251 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, J)) == 3252 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, T)) == 3253 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 9)) == 3254 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 8)) == 3255 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 7)) == 3256 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 5)) == 3257 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 4)) == 3258 # Sixes and Deuces
@test NLH.rank((6, 6, 2, 2, 3)) == 3259 # Sixes and Deuces
@test NLH.rank((5, 5, 4, 4, A)) == 3260 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, K)) == 3261 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, Q)) == 3262 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, J)) == 3263 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, T)) == 3264 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 9)) == 3265 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 8)) == 3266 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 7)) == 3267 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 6)) == 3268 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 3)) == 3269 # Fives and Fours
@test NLH.rank((5, 5, 4, 4, 2)) == 3270 # Fives and Fours
@test NLH.rank((5, 5, 3, 3, A)) == 3271 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, K)) == 3272 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, Q)) == 3273 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, J)) == 3274 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, T)) == 3275 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 9)) == 3276 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 8)) == 3277 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 7)) == 3278 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 6)) == 3279 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 4)) == 3280 # Fives and Treys
@test NLH.rank((5, 5, 3, 3, 2)) == 3281 # Fives and Treys
@test NLH.rank((5, 5, 2, 2, A)) == 3282 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, K)) == 3283 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, Q)) == 3284 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, J)) == 3285 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, T)) == 3286 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 9)) == 3287 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 8)) == 3288 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 7)) == 3289 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 6)) == 3290 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 4)) == 3291 # Fives and Deuces
@test NLH.rank((5, 5, 2, 2, 3)) == 3292 # Fives and Deuces
@test NLH.rank((4, 4, 3, 3, A)) == 3293 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, K)) == 3294 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, Q)) == 3295 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, J)) == 3296 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, T)) == 3297 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 9)) == 3298 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 8)) == 3299 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 7)) == 3300 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 6)) == 3301 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 5)) == 3302 # Fours and Treys
@test NLH.rank((4, 4, 3, 3, 2)) == 3303 # Fours and Treys
@test NLH.rank((4, 4, 2, 2, A)) == 3304 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, K)) == 3305 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, Q)) == 3306 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, J)) == 3307 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, T)) == 3308 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 9)) == 3309 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 8)) == 3310 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 7)) == 3311 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 6)) == 3312 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 5)) == 3313 # Fours and Deuces
@test NLH.rank((4, 4, 2, 2, 3)) == 3314 # Fours and Deuces
@test NLH.rank((3, 3, 2, 2, A)) == 3315 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, K)) == 3316 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, Q)) == 3317 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, J)) == 3318 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, T)) == 3319 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 9)) == 3320 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 8)) == 3321 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 7)) == 3322 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 6)) == 3323 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 5)) == 3324 # Treys and Deuces
@test NLH.rank((3, 3, 2, 2, 4)) == 3325 # Treys and Deuces
@test NLH.rank((A, A, K, Q, J)) == 3326 # Pair of Aces
@test NLH.rank((A, A, K, Q, T)) == 3327 # Pair of Aces
@test NLH.rank((A, A, K, Q, 9)) == 3328 # Pair of Aces
@test NLH.rank((A, A, K, Q, 8)) == 3329 # Pair of Aces
@test NLH.rank((A, A, K, Q, 7)) == 3330 # Pair of Aces
@test NLH.rank((A, A, K, Q, 6)) == 3331 # Pair of Aces
@test NLH.rank((A, A, K, Q, 5)) == 3332 # Pair of Aces
@test NLH.rank((A, A, K, Q, 4)) == 3333 # Pair of Aces
@test NLH.rank((A, A, K, Q, 3)) == 3334 # Pair of Aces
@test NLH.rank((A, A, K, Q, 2)) == 3335 # Pair of Aces
@test NLH.rank((A, A, K, J, T)) == 3336 # Pair of Aces
@test NLH.rank((A, A, K, J, 9)) == 3337 # Pair of Aces
@test NLH.rank((A, A, K, J, 8)) == 3338 # Pair of Aces
@test NLH.rank((A, A, K, J, 7)) == 3339 # Pair of Aces
@test NLH.rank((A, A, K, J, 6)) == 3340 # Pair of Aces
@test NLH.rank((A, A, K, J, 5)) == 3341 # Pair of Aces
@test NLH.rank((A, A, K, J, 4)) == 3342 # Pair of Aces
@test NLH.rank((A, A, K, J, 3)) == 3343 # Pair of Aces
@test NLH.rank((A, A, K, J, 2)) == 3344 # Pair of Aces
@test NLH.rank((A, A, K, T, 9)) == 3345 # Pair of Aces
@test NLH.rank((A, A, K, T, 8)) == 3346 # Pair of Aces
@test NLH.rank((A, A, K, T, 7)) == 3347 # Pair of Aces
@test NLH.rank((A, A, K, T, 6)) == 3348 # Pair of Aces
@test NLH.rank((A, A, K, T, 5)) == 3349 # Pair of Aces
@test NLH.rank((A, A, K, T, 4)) == 3350 # Pair of Aces
@test NLH.rank((A, A, K, T, 3)) == 3351 # Pair of Aces
@test NLH.rank((A, A, K, T, 2)) == 3352 # Pair of Aces
@test NLH.rank((A, A, K, 9, 8)) == 3353 # Pair of Aces
@test NLH.rank((A, A, K, 9, 7)) == 3354 # Pair of Aces
@test NLH.rank((A, A, K, 9, 6)) == 3355 # Pair of Aces
@test NLH.rank((A, A, K, 9, 5)) == 3356 # Pair of Aces
@test NLH.rank((A, A, K, 9, 4)) == 3357 # Pair of Aces
@test NLH.rank((A, A, K, 9, 3)) == 3358 # Pair of Aces
@test NLH.rank((A, A, K, 9, 2)) == 3359 # Pair of Aces
@test NLH.rank((A, A, K, 8, 7)) == 3360 # Pair of Aces
@test NLH.rank((A, A, K, 8, 6)) == 3361 # Pair of Aces
@test NLH.rank((A, A, K, 8, 5)) == 3362 # Pair of Aces
@test NLH.rank((A, A, K, 8, 4)) == 3363 # Pair of Aces
@test NLH.rank((A, A, K, 8, 3)) == 3364 # Pair of Aces
@test NLH.rank((A, A, K, 8, 2)) == 3365 # Pair of Aces
@test NLH.rank((A, A, K, 7, 6)) == 3366 # Pair of Aces
@test NLH.rank((A, A, K, 7, 5)) == 3367 # Pair of Aces
@test NLH.rank((A, A, K, 7, 4)) == 3368 # Pair of Aces
@test NLH.rank((A, A, K, 7, 3)) == 3369 # Pair of Aces
@test NLH.rank((A, A, K, 7, 2)) == 3370 # Pair of Aces
@test NLH.rank((A, A, K, 6, 5)) == 3371 # Pair of Aces
@test NLH.rank((A, A, K, 6, 4)) == 3372 # Pair of Aces
@test NLH.rank((A, A, K, 6, 3)) == 3373 # Pair of Aces
@test NLH.rank((A, A, K, 6, 2)) == 3374 # Pair of Aces
@test NLH.rank((A, A, K, 5, 4)) == 3375 # Pair of Aces
@test NLH.rank((A, A, K, 5, 3)) == 3376 # Pair of Aces
@test NLH.rank((A, A, K, 5, 2)) == 3377 # Pair of Aces
@test NLH.rank((A, A, K, 4, 3)) == 3378 # Pair of Aces
@test NLH.rank((A, A, K, 4, 2)) == 3379 # Pair of Aces
@test NLH.rank((A, A, K, 3, 2)) == 3380 # Pair of Aces
@test NLH.rank((A, A, Q, J, T)) == 3381 # Pair of Aces
@test NLH.rank((A, A, Q, J, 9)) == 3382 # Pair of Aces
@test NLH.rank((A, A, Q, J, 8)) == 3383 # Pair of Aces
@test NLH.rank((A, A, Q, J, 7)) == 3384 # Pair of Aces
@test NLH.rank((A, A, Q, J, 6)) == 3385 # Pair of Aces
@test NLH.rank((A, A, Q, J, 5)) == 3386 # Pair of Aces
@test NLH.rank((A, A, Q, J, 4)) == 3387 # Pair of Aces
@test NLH.rank((A, A, Q, J, 3)) == 3388 # Pair of Aces
@test NLH.rank((A, A, Q, J, 2)) == 3389 # Pair of Aces
@test NLH.rank((A, A, Q, T, 9)) == 3390 # Pair of Aces
@test NLH.rank((A, A, Q, T, 8)) == 3391 # Pair of Aces
@test NLH.rank((A, A, Q, T, 7)) == 3392 # Pair of Aces
@test NLH.rank((A, A, Q, T, 6)) == 3393 # Pair of Aces
@test NLH.rank((A, A, Q, T, 5)) == 3394 # Pair of Aces
@test NLH.rank((A, A, Q, T, 4)) == 3395 # Pair of Aces
@test NLH.rank((A, A, Q, T, 3)) == 3396 # Pair of Aces
@test NLH.rank((A, A, Q, T, 2)) == 3397 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 8)) == 3398 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 7)) == 3399 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 6)) == 3400 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 5)) == 3401 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 4)) == 3402 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 3)) == 3403 # Pair of Aces
@test NLH.rank((A, A, Q, 9, 2)) == 3404 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 7)) == 3405 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 6)) == 3406 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 5)) == 3407 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 4)) == 3408 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 3)) == 3409 # Pair of Aces
@test NLH.rank((A, A, Q, 8, 2)) == 3410 # Pair of Aces
@test NLH.rank((A, A, Q, 7, 6)) == 3411 # Pair of Aces
@test NLH.rank((A, A, Q, 7, 5)) == 3412 # Pair of Aces
@test NLH.rank((A, A, Q, 7, 4)) == 3413 # Pair of Aces
@test NLH.rank((A, A, Q, 7, 3)) == 3414 # Pair of Aces
@test NLH.rank((A, A, Q, 7, 2)) == 3415 # Pair of Aces
@test NLH.rank((A, A, Q, 6, 5)) == 3416 # Pair of Aces
@test NLH.rank((A, A, Q, 6, 4)) == 3417 # Pair of Aces
@test NLH.rank((A, A, Q, 6, 3)) == 3418 # Pair of Aces
@test NLH.rank((A, A, Q, 6, 2)) == 3419 # Pair of Aces
@test NLH.rank((A, A, Q, 5, 4)) == 3420 # Pair of Aces
@test NLH.rank((A, A, Q, 5, 3)) == 3421 # Pair of Aces
@test NLH.rank((A, A, Q, 5, 2)) == 3422 # Pair of Aces
@test NLH.rank((A, A, Q, 4, 3)) == 3423 # Pair of Aces
@test NLH.rank((A, A, Q, 4, 2)) == 3424 # Pair of Aces
@test NLH.rank((A, A, Q, 3, 2)) == 3425 # Pair of Aces
@test NLH.rank((A, A, J, T, 9)) == 3426 # Pair of Aces
@test NLH.rank((A, A, J, T, 8)) == 3427 # Pair of Aces
@test NLH.rank((A, A, J, T, 7)) == 3428 # Pair of Aces
@test NLH.rank((A, A, J, T, 6)) == 3429 # Pair of Aces
@test NLH.rank((A, A, J, T, 5)) == 3430 # Pair of Aces
@test NLH.rank((A, A, J, T, 4)) == 3431 # Pair of Aces
@test NLH.rank((A, A, J, T, 3)) == 3432 # Pair of Aces
@test NLH.rank((A, A, J, T, 2)) == 3433 # Pair of Aces
@test NLH.rank((A, A, J, 9, 8)) == 3434 # Pair of Aces
@test NLH.rank((A, A, J, 9, 7)) == 3435 # Pair of Aces
@test NLH.rank((A, A, J, 9, 6)) == 3436 # Pair of Aces
@test NLH.rank((A, A, J, 9, 5)) == 3437 # Pair of Aces
@test NLH.rank((A, A, J, 9, 4)) == 3438 # Pair of Aces
@test NLH.rank((A, A, J, 9, 3)) == 3439 # Pair of Aces
@test NLH.rank((A, A, J, 9, 2)) == 3440 # Pair of Aces
@test NLH.rank((A, A, J, 8, 7)) == 3441 # Pair of Aces
@test NLH.rank((A, A, J, 8, 6)) == 3442 # Pair of Aces
@test NLH.rank((A, A, J, 8, 5)) == 3443 # Pair of Aces
@test NLH.rank((A, A, J, 8, 4)) == 3444 # Pair of Aces
@test NLH.rank((A, A, J, 8, 3)) == 3445 # Pair of Aces
@test NLH.rank((A, A, J, 8, 2)) == 3446 # Pair of Aces
@test NLH.rank((A, A, J, 7, 6)) == 3447 # Pair of Aces
@test NLH.rank((A, A, J, 7, 5)) == 3448 # Pair of Aces
@test NLH.rank((A, A, J, 7, 4)) == 3449 # Pair of Aces
@test NLH.rank((A, A, J, 7, 3)) == 3450 # Pair of Aces
@test NLH.rank((A, A, J, 7, 2)) == 3451 # Pair of Aces
@test NLH.rank((A, A, J, 6, 5)) == 3452 # Pair of Aces
@test NLH.rank((A, A, J, 6, 4)) == 3453 # Pair of Aces
@test NLH.rank((A, A, J, 6, 3)) == 3454 # Pair of Aces
@test NLH.rank((A, A, J, 6, 2)) == 3455 # Pair of Aces
@test NLH.rank((A, A, J, 5, 4)) == 3456 # Pair of Aces
@test NLH.rank((A, A, J, 5, 3)) == 3457 # Pair of Aces
@test NLH.rank((A, A, J, 5, 2)) == 3458 # Pair of Aces
@test NLH.rank((A, A, J, 4, 3)) == 3459 # Pair of Aces
@test NLH.rank((A, A, J, 4, 2)) == 3460 # Pair of Aces
@test NLH.rank((A, A, J, 3, 2)) == 3461 # Pair of Aces
@test NLH.rank((A, A, T, 9, 8)) == 3462 # Pair of Aces
@test NLH.rank((A, A, T, 9, 7)) == 3463 # Pair of Aces
@test NLH.rank((A, A, T, 9, 6)) == 3464 # Pair of Aces
@test NLH.rank((A, A, T, 9, 5)) == 3465 # Pair of Aces
@test NLH.rank((A, A, T, 9, 4)) == 3466 # Pair of Aces
@test NLH.rank((A, A, T, 9, 3)) == 3467 # Pair of Aces
@test NLH.rank((A, A, T, 9, 2)) == 3468 # Pair of Aces
@test NLH.rank((A, A, T, 8, 7)) == 3469 # Pair of Aces
@test NLH.rank((A, A, T, 8, 6)) == 3470 # Pair of Aces
@test NLH.rank((A, A, T, 8, 5)) == 3471 # Pair of Aces
@test NLH.rank((A, A, T, 8, 4)) == 3472 # Pair of Aces
@test NLH.rank((A, A, T, 8, 3)) == 3473 # Pair of Aces
@test NLH.rank((A, A, T, 8, 2)) == 3474 # Pair of Aces
@test NLH.rank((A, A, T, 7, 6)) == 3475 # Pair of Aces
@test NLH.rank((A, A, T, 7, 5)) == 3476 # Pair of Aces
@test NLH.rank((A, A, T, 7, 4)) == 3477 # Pair of Aces
@test NLH.rank((A, A, T, 7, 3)) == 3478 # Pair of Aces
@test NLH.rank((A, A, T, 7, 2)) == 3479 # Pair of Aces
@test NLH.rank((A, A, T, 6, 5)) == 3480 # Pair of Aces
@test NLH.rank((A, A, T, 6, 4)) == 3481 # Pair of Aces
@test NLH.rank((A, A, T, 6, 3)) == 3482 # Pair of Aces
@test NLH.rank((A, A, T, 6, 2)) == 3483 # Pair of Aces
@test NLH.rank((A, A, T, 5, 4)) == 3484 # Pair of Aces
@test NLH.rank((A, A, T, 5, 3)) == 3485 # Pair of Aces
@test NLH.rank((A, A, T, 5, 2)) == 3486 # Pair of Aces
@test NLH.rank((A, A, T, 4, 3)) == 3487 # Pair of Aces
@test NLH.rank((A, A, T, 4, 2)) == 3488 # Pair of Aces
@test NLH.rank((A, A, T, 3, 2)) == 3489 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 7)) == 3490 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 6)) == 3491 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 5)) == 3492 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 4)) == 3493 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 3)) == 3494 # Pair of Aces
@test NLH.rank((A, A, 9, 8, 2)) == 3495 # Pair of Aces
@test NLH.rank((A, A, 9, 7, 6)) == 3496 # Pair of Aces
@test NLH.rank((A, A, 9, 7, 5)) == 3497 # Pair of Aces
@test NLH.rank((A, A, 9, 7, 4)) == 3498 # Pair of Aces
@test NLH.rank((A, A, 9, 7, 3)) == 3499 # Pair of Aces
@test NLH.rank((A, A, 9, 7, 2)) == 3500 # Pair of Aces
@test NLH.rank((A, A, 9, 6, 5)) == 3501 # Pair of Aces
@test NLH.rank((A, A, 9, 6, 4)) == 3502 # Pair of Aces
@test NLH.rank((A, A, 9, 6, 3)) == 3503 # Pair of Aces
@test NLH.rank((A, A, 9, 6, 2)) == 3504 # Pair of Aces
@test NLH.rank((A, A, 9, 5, 4)) == 3505 # Pair of Aces
@test NLH.rank((A, A, 9, 5, 3)) == 3506 # Pair of Aces
@test NLH.rank((A, A, 9, 5, 2)) == 3507 # Pair of Aces
@test NLH.rank((A, A, 9, 4, 3)) == 3508 # Pair of Aces
@test NLH.rank((A, A, 9, 4, 2)) == 3509 # Pair of Aces
@test NLH.rank((A, A, 9, 3, 2)) == 3510 # Pair of Aces
@test NLH.rank((A, A, 8, 7, 6)) == 3511 # Pair of Aces
@test NLH.rank((A, A, 8, 7, 5)) == 3512 # Pair of Aces
@test NLH.rank((A, A, 8, 7, 4)) == 3513 # Pair of Aces
@test NLH.rank((A, A, 8, 7, 3)) == 3514 # Pair of Aces
@test NLH.rank((A, A, 8, 7, 2)) == 3515 # Pair of Aces
@test NLH.rank((A, A, 8, 6, 5)) == 3516 # Pair of Aces
@test NLH.rank((A, A, 8, 6, 4)) == 3517 # Pair of Aces
@test NLH.rank((A, A, 8, 6, 3)) == 3518 # Pair of Aces
@test NLH.rank((A, A, 8, 6, 2)) == 3519 # Pair of Aces
@test NLH.rank((A, A, 8, 5, 4)) == 3520 # Pair of Aces
@test NLH.rank((A, A, 8, 5, 3)) == 3521 # Pair of Aces
@test NLH.rank((A, A, 8, 5, 2)) == 3522 # Pair of Aces
@test NLH.rank((A, A, 8, 4, 3)) == 3523 # Pair of Aces
@test NLH.rank((A, A, 8, 4, 2)) == 3524 # Pair of Aces
@test NLH.rank((A, A, 8, 3, 2)) == 3525 # Pair of Aces
@test NLH.rank((A, A, 7, 6, 5)) == 3526 # Pair of Aces
@test NLH.rank((A, A, 7, 6, 4)) == 3527 # Pair of Aces
@test NLH.rank((A, A, 7, 6, 3)) == 3528 # Pair of Aces
@test NLH.rank((A, A, 7, 6, 2)) == 3529 # Pair of Aces
@test NLH.rank((A, A, 7, 5, 4)) == 3530 # Pair of Aces
@test NLH.rank((A, A, 7, 5, 3)) == 3531 # Pair of Aces
@test NLH.rank((A, A, 7, 5, 2)) == 3532 # Pair of Aces
@test NLH.rank((A, A, 7, 4, 3)) == 3533 # Pair of Aces
@test NLH.rank((A, A, 7, 4, 2)) == 3534 # Pair of Aces
@test NLH.rank((A, A, 7, 3, 2)) == 3535 # Pair of Aces
@test NLH.rank((A, A, 6, 5, 4)) == 3536 # Pair of Aces
@test NLH.rank((A, A, 6, 5, 3)) == 3537 # Pair of Aces
@test NLH.rank((A, A, 6, 5, 2)) == 3538 # Pair of Aces
@test NLH.rank((A, A, 6, 4, 3)) == 3539 # Pair of Aces
@test NLH.rank((A, A, 6, 4, 2)) == 3540 # Pair of Aces
@test NLH.rank((A, A, 6, 3, 2)) == 3541 # Pair of Aces
@test NLH.rank((A, A, 5, 4, 3)) == 3542 # Pair of Aces
@test NLH.rank((A, A, 5, 4, 2)) == 3543 # Pair of Aces
@test NLH.rank((A, A, 5, 3, 2)) == 3544 # Pair of Aces
@test NLH.rank((A, A, 4, 3, 2)) == 3545 # Pair of Aces
@test NLH.rank((K, K, A, Q, J)) == 3546 # Pair of Kings
@test NLH.rank((K, K, A, Q, T)) == 3547 # Pair of Kings
@test NLH.rank((K, K, A, Q, 9)) == 3548 # Pair of Kings
@test NLH.rank((K, K, A, Q, 8)) == 3549 # Pair of Kings
@test NLH.rank((K, K, A, Q, 7)) == 3550 # Pair of Kings
@test NLH.rank((K, K, A, Q, 6)) == 3551 # Pair of Kings
@test NLH.rank((K, K, A, Q, 5)) == 3552 # Pair of Kings
@test NLH.rank((K, K, A, Q, 4)) == 3553 # Pair of Kings
@test NLH.rank((K, K, A, Q, 3)) == 3554 # Pair of Kings
@test NLH.rank((K, K, A, Q, 2)) == 3555 # Pair of Kings
@test NLH.rank((K, K, A, J, T)) == 3556 # Pair of Kings
@test NLH.rank((K, K, A, J, 9)) == 3557 # Pair of Kings
@test NLH.rank((K, K, A, J, 8)) == 3558 # Pair of Kings
@test NLH.rank((K, K, A, J, 7)) == 3559 # Pair of Kings
@test NLH.rank((K, K, A, J, 6)) == 3560 # Pair of Kings
@test NLH.rank((K, K, A, J, 5)) == 3561 # Pair of Kings
@test NLH.rank((K, K, A, J, 4)) == 3562 # Pair of Kings
@test NLH.rank((K, K, A, J, 3)) == 3563 # Pair of Kings
@test NLH.rank((K, K, A, J, 2)) == 3564 # Pair of Kings
@test NLH.rank((K, K, A, T, 9)) == 3565 # Pair of Kings
@test NLH.rank((K, K, A, T, 8)) == 3566 # Pair of Kings
@test NLH.rank((K, K, A, T, 7)) == 3567 # Pair of Kings
@test NLH.rank((K, K, A, T, 6)) == 3568 # Pair of Kings
@test NLH.rank((K, K, A, T, 5)) == 3569 # Pair of Kings
@test NLH.rank((K, K, A, T, 4)) == 3570 # Pair of Kings
@test NLH.rank((K, K, A, T, 3)) == 3571 # Pair of Kings
@test NLH.rank((K, K, A, T, 2)) == 3572 # Pair of Kings
@test NLH.rank((K, K, A, 9, 8)) == 3573 # Pair of Kings
@test NLH.rank((K, K, A, 9, 7)) == 3574 # Pair of Kings
@test NLH.rank((K, K, A, 9, 6)) == 3575 # Pair of Kings
@test NLH.rank((K, K, A, 9, 5)) == 3576 # Pair of Kings
@test NLH.rank((K, K, A, 9, 4)) == 3577 # Pair of Kings
@test NLH.rank((K, K, A, 9, 3)) == 3578 # Pair of Kings
@test NLH.rank((K, K, A, 9, 2)) == 3579 # Pair of Kings
@test NLH.rank((K, K, A, 8, 7)) == 3580 # Pair of Kings
@test NLH.rank((K, K, A, 8, 6)) == 3581 # Pair of Kings
@test NLH.rank((K, K, A, 8, 5)) == 3582 # Pair of Kings
@test NLH.rank((K, K, A, 8, 4)) == 3583 # Pair of Kings
@test NLH.rank((K, K, A, 8, 3)) == 3584 # Pair of Kings
@test NLH.rank((K, K, A, 8, 2)) == 3585 # Pair of Kings
@test NLH.rank((K, K, A, 7, 6)) == 3586 # Pair of Kings
@test NLH.rank((K, K, A, 7, 5)) == 3587 # Pair of Kings
@test NLH.rank((K, K, A, 7, 4)) == 3588 # Pair of Kings
@test NLH.rank((K, K, A, 7, 3)) == 3589 # Pair of Kings
@test NLH.rank((K, K, A, 7, 2)) == 3590 # Pair of Kings
@test NLH.rank((K, K, A, 6, 5)) == 3591 # Pair of Kings
@test NLH.rank((K, K, A, 6, 4)) == 3592 # Pair of Kings
@test NLH.rank((K, K, A, 6, 3)) == 3593 # Pair of Kings
@test NLH.rank((K, K, A, 6, 2)) == 3594 # Pair of Kings
@test NLH.rank((K, K, A, 5, 4)) == 3595 # Pair of Kings
@test NLH.rank((K, K, A, 5, 3)) == 3596 # Pair of Kings
@test NLH.rank((K, K, A, 5, 2)) == 3597 # Pair of Kings
@test NLH.rank((K, K, A, 4, 3)) == 3598 # Pair of Kings
@test NLH.rank((K, K, A, 4, 2)) == 3599 # Pair of Kings
@test NLH.rank((K, K, A, 3, 2)) == 3600 # Pair of Kings
@test NLH.rank((K, K, Q, J, T)) == 3601 # Pair of Kings
@test NLH.rank((K, K, Q, J, 9)) == 3602 # Pair of Kings
@test NLH.rank((K, K, Q, J, 8)) == 3603 # Pair of Kings
@test NLH.rank((K, K, Q, J, 7)) == 3604 # Pair of Kings
@test NLH.rank((K, K, Q, J, 6)) == 3605 # Pair of Kings
@test NLH.rank((K, K, Q, J, 5)) == 3606 # Pair of Kings
@test NLH.rank((K, K, Q, J, 4)) == 3607 # Pair of Kings
@test NLH.rank((K, K, Q, J, 3)) == 3608 # Pair of Kings
@test NLH.rank((K, K, Q, J, 2)) == 3609 # Pair of Kings
@test NLH.rank((K, K, Q, T, 9)) == 3610 # Pair of Kings
@test NLH.rank((K, K, Q, T, 8)) == 3611 # Pair of Kings
@test NLH.rank((K, K, Q, T, 7)) == 3612 # Pair of Kings
@test NLH.rank((K, K, Q, T, 6)) == 3613 # Pair of Kings
@test NLH.rank((K, K, Q, T, 5)) == 3614 # Pair of Kings
@test NLH.rank((K, K, Q, T, 4)) == 3615 # Pair of Kings
@test NLH.rank((K, K, Q, T, 3)) == 3616 # Pair of Kings
@test NLH.rank((K, K, Q, T, 2)) == 3617 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 8)) == 3618 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 7)) == 3619 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 6)) == 3620 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 5)) == 3621 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 4)) == 3622 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 3)) == 3623 # Pair of Kings
@test NLH.rank((K, K, Q, 9, 2)) == 3624 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 7)) == 3625 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 6)) == 3626 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 5)) == 3627 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 4)) == 3628 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 3)) == 3629 # Pair of Kings
@test NLH.rank((K, K, Q, 8, 2)) == 3630 # Pair of Kings
@test NLH.rank((K, K, Q, 7, 6)) == 3631 # Pair of Kings
@test NLH.rank((K, K, Q, 7, 5)) == 3632 # Pair of Kings
@test NLH.rank((K, K, Q, 7, 4)) == 3633 # Pair of Kings
@test NLH.rank((K, K, Q, 7, 3)) == 3634 # Pair of Kings
@test NLH.rank((K, K, Q, 7, 2)) == 3635 # Pair of Kings
@test NLH.rank((K, K, Q, 6, 5)) == 3636 # Pair of Kings
@test NLH.rank((K, K, Q, 6, 4)) == 3637 # Pair of Kings
@test NLH.rank((K, K, Q, 6, 3)) == 3638 # Pair of Kings
@test NLH.rank((K, K, Q, 6, 2)) == 3639 # Pair of Kings
@test NLH.rank((K, K, Q, 5, 4)) == 3640 # Pair of Kings
@test NLH.rank((K, K, Q, 5, 3)) == 3641 # Pair of Kings
@test NLH.rank((K, K, Q, 5, 2)) == 3642 # Pair of Kings
@test NLH.rank((K, K, Q, 4, 3)) == 3643 # Pair of Kings
@test NLH.rank((K, K, Q, 4, 2)) == 3644 # Pair of Kings
@test NLH.rank((K, K, Q, 3, 2)) == 3645 # Pair of Kings
@test NLH.rank((K, K, J, T, 9)) == 3646 # Pair of Kings
@test NLH.rank((K, K, J, T, 8)) == 3647 # Pair of Kings
@test NLH.rank((K, K, J, T, 7)) == 3648 # Pair of Kings
@test NLH.rank((K, K, J, T, 6)) == 3649 # Pair of Kings
@test NLH.rank((K, K, J, T, 5)) == 3650 # Pair of Kings
@test NLH.rank((K, K, J, T, 4)) == 3651 # Pair of Kings
@test NLH.rank((K, K, J, T, 3)) == 3652 # Pair of Kings
@test NLH.rank((K, K, J, T, 2)) == 3653 # Pair of Kings
@test NLH.rank((K, K, J, 9, 8)) == 3654 # Pair of Kings
@test NLH.rank((K, K, J, 9, 7)) == 3655 # Pair of Kings
@test NLH.rank((K, K, J, 9, 6)) == 3656 # Pair of Kings
@test NLH.rank((K, K, J, 9, 5)) == 3657 # Pair of Kings
@test NLH.rank((K, K, J, 9, 4)) == 3658 # Pair of Kings
@test NLH.rank((K, K, J, 9, 3)) == 3659 # Pair of Kings
@test NLH.rank((K, K, J, 9, 2)) == 3660 # Pair of Kings
@test NLH.rank((K, K, J, 8, 7)) == 3661 # Pair of Kings
@test NLH.rank((K, K, J, 8, 6)) == 3662 # Pair of Kings
@test NLH.rank((K, K, J, 8, 5)) == 3663 # Pair of Kings
@test NLH.rank((K, K, J, 8, 4)) == 3664 # Pair of Kings
@test NLH.rank((K, K, J, 8, 3)) == 3665 # Pair of Kings
@test NLH.rank((K, K, J, 8, 2)) == 3666 # Pair of Kings
@test NLH.rank((K, K, J, 7, 6)) == 3667 # Pair of Kings
@test NLH.rank((K, K, J, 7, 5)) == 3668 # Pair of Kings
@test NLH.rank((K, K, J, 7, 4)) == 3669 # Pair of Kings
@test NLH.rank((K, K, J, 7, 3)) == 3670 # Pair of Kings
@test NLH.rank((K, K, J, 7, 2)) == 3671 # Pair of Kings
@test NLH.rank((K, K, J, 6, 5)) == 3672 # Pair of Kings
@test NLH.rank((K, K, J, 6, 4)) == 3673 # Pair of Kings
@test NLH.rank((K, K, J, 6, 3)) == 3674 # Pair of Kings
@test NLH.rank((K, K, J, 6, 2)) == 3675 # Pair of Kings
@test NLH.rank((K, K, J, 5, 4)) == 3676 # Pair of Kings
@test NLH.rank((K, K, J, 5, 3)) == 3677 # Pair of Kings
@test NLH.rank((K, K, J, 5, 2)) == 3678 # Pair of Kings
@test NLH.rank((K, K, J, 4, 3)) == 3679 # Pair of Kings
@test NLH.rank((K, K, J, 4, 2)) == 3680 # Pair of Kings
@test NLH.rank((K, K, J, 3, 2)) == 3681 # Pair of Kings
@test NLH.rank((K, K, T, 9, 8)) == 3682 # Pair of Kings
@test NLH.rank((K, K, T, 9, 7)) == 3683 # Pair of Kings
@test NLH.rank((K, K, T, 9, 6)) == 3684 # Pair of Kings
@test NLH.rank((K, K, T, 9, 5)) == 3685 # Pair of Kings
@test NLH.rank((K, K, T, 9, 4)) == 3686 # Pair of Kings
@test NLH.rank((K, K, T, 9, 3)) == 3687 # Pair of Kings
@test NLH.rank((K, K, T, 9, 2)) == 3688 # Pair of Kings
@test NLH.rank((K, K, T, 8, 7)) == 3689 # Pair of Kings
@test NLH.rank((K, K, T, 8, 6)) == 3690 # Pair of Kings
@test NLH.rank((K, K, T, 8, 5)) == 3691 # Pair of Kings
@test NLH.rank((K, K, T, 8, 4)) == 3692 # Pair of Kings
@test NLH.rank((K, K, T, 8, 3)) == 3693 # Pair of Kings
@test NLH.rank((K, K, T, 8, 2)) == 3694 # Pair of Kings
@test NLH.rank((K, K, T, 7, 6)) == 3695 # Pair of Kings
@test NLH.rank((K, K, T, 7, 5)) == 3696 # Pair of Kings
@test NLH.rank((K, K, T, 7, 4)) == 3697 # Pair of Kings
@test NLH.rank((K, K, T, 7, 3)) == 3698 # Pair of Kings
@test NLH.rank((K, K, T, 7, 2)) == 3699 # Pair of Kings
@test NLH.rank((K, K, T, 6, 5)) == 3700 # Pair of Kings
@test NLH.rank((K, K, T, 6, 4)) == 3701 # Pair of Kings
@test NLH.rank((K, K, T, 6, 3)) == 3702 # Pair of Kings
@test NLH.rank((K, K, T, 6, 2)) == 3703 # Pair of Kings
@test NLH.rank((K, K, T, 5, 4)) == 3704 # Pair of Kings
@test NLH.rank((K, K, T, 5, 3)) == 3705 # Pair of Kings
@test NLH.rank((K, K, T, 5, 2)) == 3706 # Pair of Kings
@test NLH.rank((K, K, T, 4, 3)) == 3707 # Pair of Kings
@test NLH.rank((K, K, T, 4, 2)) == 3708 # Pair of Kings
@test NLH.rank((K, K, T, 3, 2)) == 3709 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 7)) == 3710 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 6)) == 3711 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 5)) == 3712 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 4)) == 3713 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 3)) == 3714 # Pair of Kings
@test NLH.rank((K, K, 9, 8, 2)) == 3715 # Pair of Kings
@test NLH.rank((K, K, 9, 7, 6)) == 3716 # Pair of Kings
@test NLH.rank((K, K, 9, 7, 5)) == 3717 # Pair of Kings
@test NLH.rank((K, K, 9, 7, 4)) == 3718 # Pair of Kings
@test NLH.rank((K, K, 9, 7, 3)) == 3719 # Pair of Kings
@test NLH.rank((K, K, 9, 7, 2)) == 3720 # Pair of Kings
@test NLH.rank((K, K, 9, 6, 5)) == 3721 # Pair of Kings
@test NLH.rank((K, K, 9, 6, 4)) == 3722 # Pair of Kings
@test NLH.rank((K, K, 9, 6, 3)) == 3723 # Pair of Kings
@test NLH.rank((K, K, 9, 6, 2)) == 3724 # Pair of Kings
@test NLH.rank((K, K, 9, 5, 4)) == 3725 # Pair of Kings
@test NLH.rank((K, K, 9, 5, 3)) == 3726 # Pair of Kings
@test NLH.rank((K, K, 9, 5, 2)) == 3727 # Pair of Kings
@test NLH.rank((K, K, 9, 4, 3)) == 3728 # Pair of Kings
@test NLH.rank((K, K, 9, 4, 2)) == 3729 # Pair of Kings
@test NLH.rank((K, K, 9, 3, 2)) == 3730 # Pair of Kings
@test NLH.rank((K, K, 8, 7, 6)) == 3731 # Pair of Kings
@test NLH.rank((K, K, 8, 7, 5)) == 3732 # Pair of Kings
@test NLH.rank((K, K, 8, 7, 4)) == 3733 # Pair of Kings
@test NLH.rank((K, K, 8, 7, 3)) == 3734 # Pair of Kings
@test NLH.rank((K, K, 8, 7, 2)) == 3735 # Pair of Kings
@test NLH.rank((K, K, 8, 6, 5)) == 3736 # Pair of Kings
@test NLH.rank((K, K, 8, 6, 4)) == 3737 # Pair of Kings
@test NLH.rank((K, K, 8, 6, 3)) == 3738 # Pair of Kings
@test NLH.rank((K, K, 8, 6, 2)) == 3739 # Pair of Kings
@test NLH.rank((K, K, 8, 5, 4)) == 3740 # Pair of Kings
@test NLH.rank((K, K, 8, 5, 3)) == 3741 # Pair of Kings
@test NLH.rank((K, K, 8, 5, 2)) == 3742 # Pair of Kings
@test NLH.rank((K, K, 8, 4, 3)) == 3743 # Pair of Kings
@test NLH.rank((K, K, 8, 4, 2)) == 3744 # Pair of Kings
@test NLH.rank((K, K, 8, 3, 2)) == 3745 # Pair of Kings
@test NLH.rank((K, K, 7, 6, 5)) == 3746 # Pair of Kings
@test NLH.rank((K, K, 7, 6, 4)) == 3747 # Pair of Kings
@test NLH.rank((K, K, 7, 6, 3)) == 3748 # Pair of Kings
@test NLH.rank((K, K, 7, 6, 2)) == 3749 # Pair of Kings
@test NLH.rank((K, K, 7, 5, 4)) == 3750 # Pair of Kings
@test NLH.rank((K, K, 7, 5, 3)) == 3751 # Pair of Kings
@test NLH.rank((K, K, 7, 5, 2)) == 3752 # Pair of Kings
@test NLH.rank((K, K, 7, 4, 3)) == 3753 # Pair of Kings
@test NLH.rank((K, K, 7, 4, 2)) == 3754 # Pair of Kings
@test NLH.rank((K, K, 7, 3, 2)) == 3755 # Pair of Kings
@test NLH.rank((K, K, 6, 5, 4)) == 3756 # Pair of Kings
@test NLH.rank((K, K, 6, 5, 3)) == 3757 # Pair of Kings
@test NLH.rank((K, K, 6, 5, 2)) == 3758 # Pair of Kings
@test NLH.rank((K, K, 6, 4, 3)) == 3759 # Pair of Kings
@test NLH.rank((K, K, 6, 4, 2)) == 3760 # Pair of Kings
@test NLH.rank((K, K, 6, 3, 2)) == 3761 # Pair of Kings
@test NLH.rank((K, K, 5, 4, 3)) == 3762 # Pair of Kings
@test NLH.rank((K, K, 5, 4, 2)) == 3763 # Pair of Kings
@test NLH.rank((K, K, 5, 3, 2)) == 3764 # Pair of Kings
@test NLH.rank((K, K, 4, 3, 2)) == 3765 # Pair of Kings
@test NLH.rank((Q, Q, A, K, J)) == 3766 # Pair of Queens
@test NLH.rank((Q, Q, A, K, T)) == 3767 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 9)) == 3768 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 8)) == 3769 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 7)) == 3770 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 6)) == 3771 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 5)) == 3772 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 4)) == 3773 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 3)) == 3774 # Pair of Queens
@test NLH.rank((Q, Q, A, K, 2)) == 3775 # Pair of Queens
@test NLH.rank((Q, Q, A, J, T)) == 3776 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 9)) == 3777 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 8)) == 3778 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 7)) == 3779 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 6)) == 3780 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 5)) == 3781 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 4)) == 3782 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 3)) == 3783 # Pair of Queens
@test NLH.rank((Q, Q, A, J, 2)) == 3784 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 9)) == 3785 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 8)) == 3786 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 7)) == 3787 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 6)) == 3788 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 5)) == 3789 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 4)) == 3790 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 3)) == 3791 # Pair of Queens
@test NLH.rank((Q, Q, A, T, 2)) == 3792 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 8)) == 3793 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 7)) == 3794 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 6)) == 3795 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 5)) == 3796 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 4)) == 3797 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 3)) == 3798 # Pair of Queens
@test NLH.rank((Q, Q, A, 9, 2)) == 3799 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 7)) == 3800 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 6)) == 3801 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 5)) == 3802 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 4)) == 3803 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 3)) == 3804 # Pair of Queens
@test NLH.rank((Q, Q, A, 8, 2)) == 3805 # Pair of Queens
@test NLH.rank((Q, Q, A, 7, 6)) == 3806 # Pair of Queens
@test NLH.rank((Q, Q, A, 7, 5)) == 3807 # Pair of Queens
@test NLH.rank((Q, Q, A, 7, 4)) == 3808 # Pair of Queens
@test NLH.rank((Q, Q, A, 7, 3)) == 3809 # Pair of Queens
@test NLH.rank((Q, Q, A, 7, 2)) == 3810 # Pair of Queens
@test NLH.rank((Q, Q, A, 6, 5)) == 3811 # Pair of Queens
@test NLH.rank((Q, Q, A, 6, 4)) == 3812 # Pair of Queens
@test NLH.rank((Q, Q, A, 6, 3)) == 3813 # Pair of Queens
@test NLH.rank((Q, Q, A, 6, 2)) == 3814 # Pair of Queens
@test NLH.rank((Q, Q, A, 5, 4)) == 3815 # Pair of Queens
@test NLH.rank((Q, Q, A, 5, 3)) == 3816 # Pair of Queens
@test NLH.rank((Q, Q, A, 5, 2)) == 3817 # Pair of Queens
@test NLH.rank((Q, Q, A, 4, 3)) == 3818 # Pair of Queens
@test NLH.rank((Q, Q, A, 4, 2)) == 3819 # Pair of Queens
@test NLH.rank((Q, Q, A, 3, 2)) == 3820 # Pair of Queens
@test NLH.rank((Q, Q, K, J, T)) == 3821 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 9)) == 3822 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 8)) == 3823 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 7)) == 3824 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 6)) == 3825 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 5)) == 3826 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 4)) == 3827 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 3)) == 3828 # Pair of Queens
@test NLH.rank((Q, Q, K, J, 2)) == 3829 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 9)) == 3830 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 8)) == 3831 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 7)) == 3832 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 6)) == 3833 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 5)) == 3834 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 4)) == 3835 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 3)) == 3836 # Pair of Queens
@test NLH.rank((Q, Q, K, T, 2)) == 3837 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 8)) == 3838 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 7)) == 3839 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 6)) == 3840 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 5)) == 3841 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 4)) == 3842 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 3)) == 3843 # Pair of Queens
@test NLH.rank((Q, Q, K, 9, 2)) == 3844 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 7)) == 3845 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 6)) == 3846 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 5)) == 3847 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 4)) == 3848 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 3)) == 3849 # Pair of Queens
@test NLH.rank((Q, Q, K, 8, 2)) == 3850 # Pair of Queens
@test NLH.rank((Q, Q, K, 7, 6)) == 3851 # Pair of Queens
@test NLH.rank((Q, Q, K, 7, 5)) == 3852 # Pair of Queens
@test NLH.rank((Q, Q, K, 7, 4)) == 3853 # Pair of Queens
@test NLH.rank((Q, Q, K, 7, 3)) == 3854 # Pair of Queens
@test NLH.rank((Q, Q, K, 7, 2)) == 3855 # Pair of Queens
@test NLH.rank((Q, Q, K, 6, 5)) == 3856 # Pair of Queens
@test NLH.rank((Q, Q, K, 6, 4)) == 3857 # Pair of Queens
@test NLH.rank((Q, Q, K, 6, 3)) == 3858 # Pair of Queens
@test NLH.rank((Q, Q, K, 6, 2)) == 3859 # Pair of Queens
@test NLH.rank((Q, Q, K, 5, 4)) == 3860 # Pair of Queens
@test NLH.rank((Q, Q, K, 5, 3)) == 3861 # Pair of Queens
@test NLH.rank((Q, Q, K, 5, 2)) == 3862 # Pair of Queens
@test NLH.rank((Q, Q, K, 4, 3)) == 3863 # Pair of Queens
@test NLH.rank((Q, Q, K, 4, 2)) == 3864 # Pair of Queens
@test NLH.rank((Q, Q, K, 3, 2)) == 3865 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 9)) == 3866 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 8)) == 3867 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 7)) == 3868 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 6)) == 3869 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 5)) == 3870 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 4)) == 3871 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 3)) == 3872 # Pair of Queens
@test NLH.rank((Q, Q, J, T, 2)) == 3873 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 8)) == 3874 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 7)) == 3875 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 6)) == 3876 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 5)) == 3877 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 4)) == 3878 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 3)) == 3879 # Pair of Queens
@test NLH.rank((Q, Q, J, 9, 2)) == 3880 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 7)) == 3881 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 6)) == 3882 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 5)) == 3883 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 4)) == 3884 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 3)) == 3885 # Pair of Queens
@test NLH.rank((Q, Q, J, 8, 2)) == 3886 # Pair of Queens
@test NLH.rank((Q, Q, J, 7, 6)) == 3887 # Pair of Queens
@test NLH.rank((Q, Q, J, 7, 5)) == 3888 # Pair of Queens
@test NLH.rank((Q, Q, J, 7, 4)) == 3889 # Pair of Queens
@test NLH.rank((Q, Q, J, 7, 3)) == 3890 # Pair of Queens
@test NLH.rank((Q, Q, J, 7, 2)) == 3891 # Pair of Queens
@test NLH.rank((Q, Q, J, 6, 5)) == 3892 # Pair of Queens
@test NLH.rank((Q, Q, J, 6, 4)) == 3893 # Pair of Queens
@test NLH.rank((Q, Q, J, 6, 3)) == 3894 # Pair of Queens
@test NLH.rank((Q, Q, J, 6, 2)) == 3895 # Pair of Queens
@test NLH.rank((Q, Q, J, 5, 4)) == 3896 # Pair of Queens
@test NLH.rank((Q, Q, J, 5, 3)) == 3897 # Pair of Queens
@test NLH.rank((Q, Q, J, 5, 2)) == 3898 # Pair of Queens
@test NLH.rank((Q, Q, J, 4, 3)) == 3899 # Pair of Queens
@test NLH.rank((Q, Q, J, 4, 2)) == 3900 # Pair of Queens
@test NLH.rank((Q, Q, J, 3, 2)) == 3901 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 8)) == 3902 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 7)) == 3903 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 6)) == 3904 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 5)) == 3905 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 4)) == 3906 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 3)) == 3907 # Pair of Queens
@test NLH.rank((Q, Q, T, 9, 2)) == 3908 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 7)) == 3909 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 6)) == 3910 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 5)) == 3911 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 4)) == 3912 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 3)) == 3913 # Pair of Queens
@test NLH.rank((Q, Q, T, 8, 2)) == 3914 # Pair of Queens
@test NLH.rank((Q, Q, T, 7, 6)) == 3915 # Pair of Queens
@test NLH.rank((Q, Q, T, 7, 5)) == 3916 # Pair of Queens
@test NLH.rank((Q, Q, T, 7, 4)) == 3917 # Pair of Queens
@test NLH.rank((Q, Q, T, 7, 3)) == 3918 # Pair of Queens
@test NLH.rank((Q, Q, T, 7, 2)) == 3919 # Pair of Queens
@test NLH.rank((Q, Q, T, 6, 5)) == 3920 # Pair of Queens
@test NLH.rank((Q, Q, T, 6, 4)) == 3921 # Pair of Queens
@test NLH.rank((Q, Q, T, 6, 3)) == 3922 # Pair of Queens
@test NLH.rank((Q, Q, T, 6, 2)) == 3923 # Pair of Queens
@test NLH.rank((Q, Q, T, 5, 4)) == 3924 # Pair of Queens
@test NLH.rank((Q, Q, T, 5, 3)) == 3925 # Pair of Queens
@test NLH.rank((Q, Q, T, 5, 2)) == 3926 # Pair of Queens
@test NLH.rank((Q, Q, T, 4, 3)) == 3927 # Pair of Queens
@test NLH.rank((Q, Q, T, 4, 2)) == 3928 # Pair of Queens
@test NLH.rank((Q, Q, T, 3, 2)) == 3929 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 7)) == 3930 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 6)) == 3931 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 5)) == 3932 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 4)) == 3933 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 3)) == 3934 # Pair of Queens
@test NLH.rank((Q, Q, 9, 8, 2)) == 3935 # Pair of Queens
@test NLH.rank((Q, Q, 9, 7, 6)) == 3936 # Pair of Queens
@test NLH.rank((Q, Q, 9, 7, 5)) == 3937 # Pair of Queens
@test NLH.rank((Q, Q, 9, 7, 4)) == 3938 # Pair of Queens
@test NLH.rank((Q, Q, 9, 7, 3)) == 3939 # Pair of Queens
@test NLH.rank((Q, Q, 9, 7, 2)) == 3940 # Pair of Queens
@test NLH.rank((Q, Q, 9, 6, 5)) == 3941 # Pair of Queens
@test NLH.rank((Q, Q, 9, 6, 4)) == 3942 # Pair of Queens
@test NLH.rank((Q, Q, 9, 6, 3)) == 3943 # Pair of Queens
@test NLH.rank((Q, Q, 9, 6, 2)) == 3944 # Pair of Queens
@test NLH.rank((Q, Q, 9, 5, 4)) == 3945 # Pair of Queens
@test NLH.rank((Q, Q, 9, 5, 3)) == 3946 # Pair of Queens
@test NLH.rank((Q, Q, 9, 5, 2)) == 3947 # Pair of Queens
@test NLH.rank((Q, Q, 9, 4, 3)) == 3948 # Pair of Queens
@test NLH.rank((Q, Q, 9, 4, 2)) == 3949 # Pair of Queens
@test NLH.rank((Q, Q, 9, 3, 2)) == 3950 # Pair of Queens
@test NLH.rank((Q, Q, 8, 7, 6)) == 3951 # Pair of Queens
@test NLH.rank((Q, Q, 8, 7, 5)) == 3952 # Pair of Queens
@test NLH.rank((Q, Q, 8, 7, 4)) == 3953 # Pair of Queens
@test NLH.rank((Q, Q, 8, 7, 3)) == 3954 # Pair of Queens
@test NLH.rank((Q, Q, 8, 7, 2)) == 3955 # Pair of Queens
@test NLH.rank((Q, Q, 8, 6, 5)) == 3956 # Pair of Queens
@test NLH.rank((Q, Q, 8, 6, 4)) == 3957 # Pair of Queens
@test NLH.rank((Q, Q, 8, 6, 3)) == 3958 # Pair of Queens
@test NLH.rank((Q, Q, 8, 6, 2)) == 3959 # Pair of Queens
@test NLH.rank((Q, Q, 8, 5, 4)) == 3960 # Pair of Queens
@test NLH.rank((Q, Q, 8, 5, 3)) == 3961 # Pair of Queens
@test NLH.rank((Q, Q, 8, 5, 2)) == 3962 # Pair of Queens
@test NLH.rank((Q, Q, 8, 4, 3)) == 3963 # Pair of Queens
@test NLH.rank((Q, Q, 8, 4, 2)) == 3964 # Pair of Queens
@test NLH.rank((Q, Q, 8, 3, 2)) == 3965 # Pair of Queens
@test NLH.rank((Q, Q, 7, 6, 5)) == 3966 # Pair of Queens
@test NLH.rank((Q, Q, 7, 6, 4)) == 3967 # Pair of Queens
@test NLH.rank((Q, Q, 7, 6, 3)) == 3968 # Pair of Queens
@test NLH.rank((Q, Q, 7, 6, 2)) == 3969 # Pair of Queens
@test NLH.rank((Q, Q, 7, 5, 4)) == 3970 # Pair of Queens
@test NLH.rank((Q, Q, 7, 5, 3)) == 3971 # Pair of Queens
@test NLH.rank((Q, Q, 7, 5, 2)) == 3972 # Pair of Queens
@test NLH.rank((Q, Q, 7, 4, 3)) == 3973 # Pair of Queens
@test NLH.rank((Q, Q, 7, 4, 2)) == 3974 # Pair of Queens
@test NLH.rank((Q, Q, 7, 3, 2)) == 3975 # Pair of Queens
@test NLH.rank((Q, Q, 6, 5, 4)) == 3976 # Pair of Queens
@test NLH.rank((Q, Q, 6, 5, 3)) == 3977 # Pair of Queens
@test NLH.rank((Q, Q, 6, 5, 2)) == 3978 # Pair of Queens
@test NLH.rank((Q, Q, 6, 4, 3)) == 3979 # Pair of Queens
@test NLH.rank((Q, Q, 6, 4, 2)) == 3980 # Pair of Queens
@test NLH.rank((Q, Q, 6, 3, 2)) == 3981 # Pair of Queens
@test NLH.rank((Q, Q, 5, 4, 3)) == 3982 # Pair of Queens
@test NLH.rank((Q, Q, 5, 4, 2)) == 3983 # Pair of Queens
@test NLH.rank((Q, Q, 5, 3, 2)) == 3984 # Pair of Queens
@test NLH.rank((Q, Q, 4, 3, 2)) == 3985 # Pair of Queens
@test NLH.rank((J, J, A, K, Q)) == 3986 # Pair of Jacks
@test NLH.rank((J, J, A, K, T)) == 3987 # Pair of Jacks
@test NLH.rank((J, J, A, K, 9)) == 3988 # Pair of Jacks
@test NLH.rank((J, J, A, K, 8)) == 3989 # Pair of Jacks
@test NLH.rank((J, J, A, K, 7)) == 3990 # Pair of Jacks
@test NLH.rank((J, J, A, K, 6)) == 3991 # Pair of Jacks
@test NLH.rank((J, J, A, K, 5)) == 3992 # Pair of Jacks
@test NLH.rank((J, J, A, K, 4)) == 3993 # Pair of Jacks
@test NLH.rank((J, J, A, K, 3)) == 3994 # Pair of Jacks
@test NLH.rank((J, J, A, K, 2)) == 3995 # Pair of Jacks
@test NLH.rank((J, J, A, Q, T)) == 3996 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 9)) == 3997 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 8)) == 3998 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 7)) == 3999 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 6)) == 4000 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 5)) == 4001 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 4)) == 4002 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 3)) == 4003 # Pair of Jacks
@test NLH.rank((J, J, A, Q, 2)) == 4004 # Pair of Jacks
@test NLH.rank((J, J, A, T, 9)) == 4005 # Pair of Jacks
@test NLH.rank((J, J, A, T, 8)) == 4006 # Pair of Jacks
@test NLH.rank((J, J, A, T, 7)) == 4007 # Pair of Jacks
@test NLH.rank((J, J, A, T, 6)) == 4008 # Pair of Jacks
@test NLH.rank((J, J, A, T, 5)) == 4009 # Pair of Jacks
@test NLH.rank((J, J, A, T, 4)) == 4010 # Pair of Jacks
@test NLH.rank((J, J, A, T, 3)) == 4011 # Pair of Jacks
@test NLH.rank((J, J, A, T, 2)) == 4012 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 8)) == 4013 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 7)) == 4014 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 6)) == 4015 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 5)) == 4016 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 4)) == 4017 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 3)) == 4018 # Pair of Jacks
@test NLH.rank((J, J, A, 9, 2)) == 4019 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 7)) == 4020 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 6)) == 4021 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 5)) == 4022 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 4)) == 4023 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 3)) == 4024 # Pair of Jacks
@test NLH.rank((J, J, A, 8, 2)) == 4025 # Pair of Jacks
@test NLH.rank((J, J, A, 7, 6)) == 4026 # Pair of Jacks
@test NLH.rank((J, J, A, 7, 5)) == 4027 # Pair of Jacks
@test NLH.rank((J, J, A, 7, 4)) == 4028 # Pair of Jacks
@test NLH.rank((J, J, A, 7, 3)) == 4029 # Pair of Jacks
@test NLH.rank((J, J, A, 7, 2)) == 4030 # Pair of Jacks
@test NLH.rank((J, J, A, 6, 5)) == 4031 # Pair of Jacks
@test NLH.rank((J, J, A, 6, 4)) == 4032 # Pair of Jacks
@test NLH.rank((J, J, A, 6, 3)) == 4033 # Pair of Jacks
@test NLH.rank((J, J, A, 6, 2)) == 4034 # Pair of Jacks
@test NLH.rank((J, J, A, 5, 4)) == 4035 # Pair of Jacks
@test NLH.rank((J, J, A, 5, 3)) == 4036 # Pair of Jacks
@test NLH.rank((J, J, A, 5, 2)) == 4037 # Pair of Jacks
@test NLH.rank((J, J, A, 4, 3)) == 4038 # Pair of Jacks
@test NLH.rank((J, J, A, 4, 2)) == 4039 # Pair of Jacks
@test NLH.rank((J, J, A, 3, 2)) == 4040 # Pair of Jacks
@test NLH.rank((J, J, K, Q, T)) == 4041 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 9)) == 4042 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 8)) == 4043 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 7)) == 4044 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 6)) == 4045 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 5)) == 4046 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 4)) == 4047 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 3)) == 4048 # Pair of Jacks
@test NLH.rank((J, J, K, Q, 2)) == 4049 # Pair of Jacks
@test NLH.rank((J, J, K, T, 9)) == 4050 # Pair of Jacks
@test NLH.rank((J, J, K, T, 8)) == 4051 # Pair of Jacks
@test NLH.rank((J, J, K, T, 7)) == 4052 # Pair of Jacks
@test NLH.rank((J, J, K, T, 6)) == 4053 # Pair of Jacks
@test NLH.rank((J, J, K, T, 5)) == 4054 # Pair of Jacks
@test NLH.rank((J, J, K, T, 4)) == 4055 # Pair of Jacks
@test NLH.rank((J, J, K, T, 3)) == 4056 # Pair of Jacks
@test NLH.rank((J, J, K, T, 2)) == 4057 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 8)) == 4058 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 7)) == 4059 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 6)) == 4060 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 5)) == 4061 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 4)) == 4062 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 3)) == 4063 # Pair of Jacks
@test NLH.rank((J, J, K, 9, 2)) == 4064 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 7)) == 4065 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 6)) == 4066 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 5)) == 4067 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 4)) == 4068 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 3)) == 4069 # Pair of Jacks
@test NLH.rank((J, J, K, 8, 2)) == 4070 # Pair of Jacks
@test NLH.rank((J, J, K, 7, 6)) == 4071 # Pair of Jacks
@test NLH.rank((J, J, K, 7, 5)) == 4072 # Pair of Jacks
@test NLH.rank((J, J, K, 7, 4)) == 4073 # Pair of Jacks
@test NLH.rank((J, J, K, 7, 3)) == 4074 # Pair of Jacks
@test NLH.rank((J, J, K, 7, 2)) == 4075 # Pair of Jacks
@test NLH.rank((J, J, K, 6, 5)) == 4076 # Pair of Jacks
@test NLH.rank((J, J, K, 6, 4)) == 4077 # Pair of Jacks
@test NLH.rank((J, J, K, 6, 3)) == 4078 # Pair of Jacks
@test NLH.rank((J, J, K, 6, 2)) == 4079 # Pair of Jacks
@test NLH.rank((J, J, K, 5, 4)) == 4080 # Pair of Jacks
@test NLH.rank((J, J, K, 5, 3)) == 4081 # Pair of Jacks
@test NLH.rank((J, J, K, 5, 2)) == 4082 # Pair of Jacks
@test NLH.rank((J, J, K, 4, 3)) == 4083 # Pair of Jacks
@test NLH.rank((J, J, K, 4, 2)) == 4084 # Pair of Jacks
@test NLH.rank((J, J, K, 3, 2)) == 4085 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 9)) == 4086 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 8)) == 4087 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 7)) == 4088 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 6)) == 4089 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 5)) == 4090 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 4)) == 4091 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 3)) == 4092 # Pair of Jacks
@test NLH.rank((J, J, Q, T, 2)) == 4093 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 8)) == 4094 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 7)) == 4095 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 6)) == 4096 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 5)) == 4097 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 4)) == 4098 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 3)) == 4099 # Pair of Jacks
@test NLH.rank((J, J, Q, 9, 2)) == 4100 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 7)) == 4101 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 6)) == 4102 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 5)) == 4103 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 4)) == 4104 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 3)) == 4105 # Pair of Jacks
@test NLH.rank((J, J, Q, 8, 2)) == 4106 # Pair of Jacks
@test NLH.rank((J, J, Q, 7, 6)) == 4107 # Pair of Jacks
@test NLH.rank((J, J, Q, 7, 5)) == 4108 # Pair of Jacks
@test NLH.rank((J, J, Q, 7, 4)) == 4109 # Pair of Jacks
@test NLH.rank((J, J, Q, 7, 3)) == 4110 # Pair of Jacks
@test NLH.rank((J, J, Q, 7, 2)) == 4111 # Pair of Jacks
@test NLH.rank((J, J, Q, 6, 5)) == 4112 # Pair of Jacks
@test NLH.rank((J, J, Q, 6, 4)) == 4113 # Pair of Jacks
@test NLH.rank((J, J, Q, 6, 3)) == 4114 # Pair of Jacks
@test NLH.rank((J, J, Q, 6, 2)) == 4115 # Pair of Jacks
@test NLH.rank((J, J, Q, 5, 4)) == 4116 # Pair of Jacks
@test NLH.rank((J, J, Q, 5, 3)) == 4117 # Pair of Jacks
@test NLH.rank((J, J, Q, 5, 2)) == 4118 # Pair of Jacks
@test NLH.rank((J, J, Q, 4, 3)) == 4119 # Pair of Jacks
@test NLH.rank((J, J, Q, 4, 2)) == 4120 # Pair of Jacks
@test NLH.rank((J, J, Q, 3, 2)) == 4121 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 8)) == 4122 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 7)) == 4123 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 6)) == 4124 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 5)) == 4125 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 4)) == 4126 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 3)) == 4127 # Pair of Jacks
@test NLH.rank((J, J, T, 9, 2)) == 4128 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 7)) == 4129 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 6)) == 4130 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 5)) == 4131 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 4)) == 4132 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 3)) == 4133 # Pair of Jacks
@test NLH.rank((J, J, T, 8, 2)) == 4134 # Pair of Jacks
@test NLH.rank((J, J, T, 7, 6)) == 4135 # Pair of Jacks
@test NLH.rank((J, J, T, 7, 5)) == 4136 # Pair of Jacks
@test NLH.rank((J, J, T, 7, 4)) == 4137 # Pair of Jacks
@test NLH.rank((J, J, T, 7, 3)) == 4138 # Pair of Jacks
@test NLH.rank((J, J, T, 7, 2)) == 4139 # Pair of Jacks
@test NLH.rank((J, J, T, 6, 5)) == 4140 # Pair of Jacks
@test NLH.rank((J, J, T, 6, 4)) == 4141 # Pair of Jacks
@test NLH.rank((J, J, T, 6, 3)) == 4142 # Pair of Jacks
@test NLH.rank((J, J, T, 6, 2)) == 4143 # Pair of Jacks
@test NLH.rank((J, J, T, 5, 4)) == 4144 # Pair of Jacks
@test NLH.rank((J, J, T, 5, 3)) == 4145 # Pair of Jacks
@test NLH.rank((J, J, T, 5, 2)) == 4146 # Pair of Jacks
@test NLH.rank((J, J, T, 4, 3)) == 4147 # Pair of Jacks
@test NLH.rank((J, J, T, 4, 2)) == 4148 # Pair of Jacks
@test NLH.rank((J, J, T, 3, 2)) == 4149 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 7)) == 4150 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 6)) == 4151 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 5)) == 4152 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 4)) == 4153 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 3)) == 4154 # Pair of Jacks
@test NLH.rank((J, J, 9, 8, 2)) == 4155 # Pair of Jacks
@test NLH.rank((J, J, 9, 7, 6)) == 4156 # Pair of Jacks
@test NLH.rank((J, J, 9, 7, 5)) == 4157 # Pair of Jacks
@test NLH.rank((J, J, 9, 7, 4)) == 4158 # Pair of Jacks
@test NLH.rank((J, J, 9, 7, 3)) == 4159 # Pair of Jacks
@test NLH.rank((J, J, 9, 7, 2)) == 4160 # Pair of Jacks
@test NLH.rank((J, J, 9, 6, 5)) == 4161 # Pair of Jacks
@test NLH.rank((J, J, 9, 6, 4)) == 4162 # Pair of Jacks
@test NLH.rank((J, J, 9, 6, 3)) == 4163 # Pair of Jacks
@test NLH.rank((J, J, 9, 6, 2)) == 4164 # Pair of Jacks
@test NLH.rank((J, J, 9, 5, 4)) == 4165 # Pair of Jacks
@test NLH.rank((J, J, 9, 5, 3)) == 4166 # Pair of Jacks
@test NLH.rank((J, J, 9, 5, 2)) == 4167 # Pair of Jacks
@test NLH.rank((J, J, 9, 4, 3)) == 4168 # Pair of Jacks
@test NLH.rank((J, J, 9, 4, 2)) == 4169 # Pair of Jacks
@test NLH.rank((J, J, 9, 3, 2)) == 4170 # Pair of Jacks
@test NLH.rank((J, J, 8, 7, 6)) == 4171 # Pair of Jacks
@test NLH.rank((J, J, 8, 7, 5)) == 4172 # Pair of Jacks
@test NLH.rank((J, J, 8, 7, 4)) == 4173 # Pair of Jacks
@test NLH.rank((J, J, 8, 7, 3)) == 4174 # Pair of Jacks
@test NLH.rank((J, J, 8, 7, 2)) == 4175 # Pair of Jacks
@test NLH.rank((J, J, 8, 6, 5)) == 4176 # Pair of Jacks
@test NLH.rank((J, J, 8, 6, 4)) == 4177 # Pair of Jacks
@test NLH.rank((J, J, 8, 6, 3)) == 4178 # Pair of Jacks
@test NLH.rank((J, J, 8, 6, 2)) == 4179 # Pair of Jacks
@test NLH.rank((J, J, 8, 5, 4)) == 4180 # Pair of Jacks
@test NLH.rank((J, J, 8, 5, 3)) == 4181 # Pair of Jacks
@test NLH.rank((J, J, 8, 5, 2)) == 4182 # Pair of Jacks
@test NLH.rank((J, J, 8, 4, 3)) == 4183 # Pair of Jacks
@test NLH.rank((J, J, 8, 4, 2)) == 4184 # Pair of Jacks
@test NLH.rank((J, J, 8, 3, 2)) == 4185 # Pair of Jacks
@test NLH.rank((J, J, 7, 6, 5)) == 4186 # Pair of Jacks
@test NLH.rank((J, J, 7, 6, 4)) == 4187 # Pair of Jacks
@test NLH.rank((J, J, 7, 6, 3)) == 4188 # Pair of Jacks
@test NLH.rank((J, J, 7, 6, 2)) == 4189 # Pair of Jacks
@test NLH.rank((J, J, 7, 5, 4)) == 4190 # Pair of Jacks
@test NLH.rank((J, J, 7, 5, 3)) == 4191 # Pair of Jacks
@test NLH.rank((J, J, 7, 5, 2)) == 4192 # Pair of Jacks
@test NLH.rank((J, J, 7, 4, 3)) == 4193 # Pair of Jacks
@test NLH.rank((J, J, 7, 4, 2)) == 4194 # Pair of Jacks
@test NLH.rank((J, J, 7, 3, 2)) == 4195 # Pair of Jacks
@test NLH.rank((J, J, 6, 5, 4)) == 4196 # Pair of Jacks
@test NLH.rank((J, J, 6, 5, 3)) == 4197 # Pair of Jacks
@test NLH.rank((J, J, 6, 5, 2)) == 4198 # Pair of Jacks
@test NLH.rank((J, J, 6, 4, 3)) == 4199 # Pair of Jacks
@test NLH.rank((J, J, 6, 4, 2)) == 4200 # Pair of Jacks
@test NLH.rank((J, J, 6, 3, 2)) == 4201 # Pair of Jacks
@test NLH.rank((J, J, 5, 4, 3)) == 4202 # Pair of Jacks
@test NLH.rank((J, J, 5, 4, 2)) == 4203 # Pair of Jacks
@test NLH.rank((J, J, 5, 3, 2)) == 4204 # Pair of Jacks
@test NLH.rank((J, J, 4, 3, 2)) == 4205 # Pair of Jacks
@test NLH.rank((T, T, A, K, Q)) == 4206 # Pair of Tens
@test NLH.rank((T, T, A, K, J)) == 4207 # Pair of Tens
@test NLH.rank((T, T, A, K, 9)) == 4208 # Pair of Tens
@test NLH.rank((T, T, A, K, 8)) == 4209 # Pair of Tens
@test NLH.rank((T, T, A, K, 7)) == 4210 # Pair of Tens
@test NLH.rank((T, T, A, K, 6)) == 4211 # Pair of Tens
@test NLH.rank((T, T, A, K, 5)) == 4212 # Pair of Tens
@test NLH.rank((T, T, A, K, 4)) == 4213 # Pair of Tens
@test NLH.rank((T, T, A, K, 3)) == 4214 # Pair of Tens
@test NLH.rank((T, T, A, K, 2)) == 4215 # Pair of Tens
@test NLH.rank((T, T, A, Q, J)) == 4216 # Pair of Tens
@test NLH.rank((T, T, A, Q, 9)) == 4217 # Pair of Tens
@test NLH.rank((T, T, A, Q, 8)) == 4218 # Pair of Tens
@test NLH.rank((T, T, A, Q, 7)) == 4219 # Pair of Tens
@test NLH.rank((T, T, A, Q, 6)) == 4220 # Pair of Tens
@test NLH.rank((T, T, A, Q, 5)) == 4221 # Pair of Tens
@test NLH.rank((T, T, A, Q, 4)) == 4222 # Pair of Tens
@test NLH.rank((T, T, A, Q, 3)) == 4223 # Pair of Tens
@test NLH.rank((T, T, A, Q, 2)) == 4224 # Pair of Tens
@test NLH.rank((T, T, A, J, 9)) == 4225 # Pair of Tens
@test NLH.rank((T, T, A, J, 8)) == 4226 # Pair of Tens
@test NLH.rank((T, T, A, J, 7)) == 4227 # Pair of Tens
@test NLH.rank((T, T, A, J, 6)) == 4228 # Pair of Tens
@test NLH.rank((T, T, A, J, 5)) == 4229 # Pair of Tens
@test NLH.rank((T, T, A, J, 4)) == 4230 # Pair of Tens
@test NLH.rank((T, T, A, J, 3)) == 4231 # Pair of Tens
@test NLH.rank((T, T, A, J, 2)) == 4232 # Pair of Tens
@test NLH.rank((T, T, A, 9, 8)) == 4233 # Pair of Tens
@test NLH.rank((T, T, A, 9, 7)) == 4234 # Pair of Tens
@test NLH.rank((T, T, A, 9, 6)) == 4235 # Pair of Tens
@test NLH.rank((T, T, A, 9, 5)) == 4236 # Pair of Tens
@test NLH.rank((T, T, A, 9, 4)) == 4237 # Pair of Tens
@test NLH.rank((T, T, A, 9, 3)) == 4238 # Pair of Tens
@test NLH.rank((T, T, A, 9, 2)) == 4239 # Pair of Tens
@test NLH.rank((T, T, A, 8, 7)) == 4240 # Pair of Tens
@test NLH.rank((T, T, A, 8, 6)) == 4241 # Pair of Tens
@test NLH.rank((T, T, A, 8, 5)) == 4242 # Pair of Tens
@test NLH.rank((T, T, A, 8, 4)) == 4243 # Pair of Tens
@test NLH.rank((T, T, A, 8, 3)) == 4244 # Pair of Tens
@test NLH.rank((T, T, A, 8, 2)) == 4245 # Pair of Tens
@test NLH.rank((T, T, A, 7, 6)) == 4246 # Pair of Tens
@test NLH.rank((T, T, A, 7, 5)) == 4247 # Pair of Tens
@test NLH.rank((T, T, A, 7, 4)) == 4248 # Pair of Tens
@test NLH.rank((T, T, A, 7, 3)) == 4249 # Pair of Tens
@test NLH.rank((T, T, A, 7, 2)) == 4250 # Pair of Tens
@test NLH.rank((T, T, A, 6, 5)) == 4251 # Pair of Tens
@test NLH.rank((T, T, A, 6, 4)) == 4252 # Pair of Tens
@test NLH.rank((T, T, A, 6, 3)) == 4253 # Pair of Tens
@test NLH.rank((T, T, A, 6, 2)) == 4254 # Pair of Tens
@test NLH.rank((T, T, A, 5, 4)) == 4255 # Pair of Tens
@test NLH.rank((T, T, A, 5, 3)) == 4256 # Pair of Tens
@test NLH.rank((T, T, A, 5, 2)) == 4257 # Pair of Tens
@test NLH.rank((T, T, A, 4, 3)) == 4258 # Pair of Tens
@test NLH.rank((T, T, A, 4, 2)) == 4259 # Pair of Tens
@test NLH.rank((T, T, A, 3, 2)) == 4260 # Pair of Tens
@test NLH.rank((T, T, K, Q, J)) == 4261 # Pair of Tens
@test NLH.rank((T, T, K, Q, 9)) == 4262 # Pair of Tens
@test NLH.rank((T, T, K, Q, 8)) == 4263 # Pair of Tens
@test NLH.rank((T, T, K, Q, 7)) == 4264 # Pair of Tens
@test NLH.rank((T, T, K, Q, 6)) == 4265 # Pair of Tens
@test NLH.rank((T, T, K, Q, 5)) == 4266 # Pair of Tens
@test NLH.rank((T, T, K, Q, 4)) == 4267 # Pair of Tens
@test NLH.rank((T, T, K, Q, 3)) == 4268 # Pair of Tens
@test NLH.rank((T, T, K, Q, 2)) == 4269 # Pair of Tens
@test NLH.rank((T, T, K, J, 9)) == 4270 # Pair of Tens
@test NLH.rank((T, T, K, J, 8)) == 4271 # Pair of Tens
@test NLH.rank((T, T, K, J, 7)) == 4272 # Pair of Tens
@test NLH.rank((T, T, K, J, 6)) == 4273 # Pair of Tens
@test NLH.rank((T, T, K, J, 5)) == 4274 # Pair of Tens
@test NLH.rank((T, T, K, J, 4)) == 4275 # Pair of Tens
@test NLH.rank((T, T, K, J, 3)) == 4276 # Pair of Tens
@test NLH.rank((T, T, K, J, 2)) == 4277 # Pair of Tens
@test NLH.rank((T, T, K, 9, 8)) == 4278 # Pair of Tens
@test NLH.rank((T, T, K, 9, 7)) == 4279 # Pair of Tens
@test NLH.rank((T, T, K, 9, 6)) == 4280 # Pair of Tens
@test NLH.rank((T, T, K, 9, 5)) == 4281 # Pair of Tens
@test NLH.rank((T, T, K, 9, 4)) == 4282 # Pair of Tens
@test NLH.rank((T, T, K, 9, 3)) == 4283 # Pair of Tens
@test NLH.rank((T, T, K, 9, 2)) == 4284 # Pair of Tens
@test NLH.rank((T, T, K, 8, 7)) == 4285 # Pair of Tens
@test NLH.rank((T, T, K, 8, 6)) == 4286 # Pair of Tens
@test NLH.rank((T, T, K, 8, 5)) == 4287 # Pair of Tens
@test NLH.rank((T, T, K, 8, 4)) == 4288 # Pair of Tens
@test NLH.rank((T, T, K, 8, 3)) == 4289 # Pair of Tens
@test NLH.rank((T, T, K, 8, 2)) == 4290 # Pair of Tens
@test NLH.rank((T, T, K, 7, 6)) == 4291 # Pair of Tens
@test NLH.rank((T, T, K, 7, 5)) == 4292 # Pair of Tens
@test NLH.rank((T, T, K, 7, 4)) == 4293 # Pair of Tens
@test NLH.rank((T, T, K, 7, 3)) == 4294 # Pair of Tens
@test NLH.rank((T, T, K, 7, 2)) == 4295 # Pair of Tens
@test NLH.rank((T, T, K, 6, 5)) == 4296 # Pair of Tens
@test NLH.rank((T, T, K, 6, 4)) == 4297 # Pair of Tens
@test NLH.rank((T, T, K, 6, 3)) == 4298 # Pair of Tens
@test NLH.rank((T, T, K, 6, 2)) == 4299 # Pair of Tens
@test NLH.rank((T, T, K, 5, 4)) == 4300 # Pair of Tens
@test NLH.rank((T, T, K, 5, 3)) == 4301 # Pair of Tens
@test NLH.rank((T, T, K, 5, 2)) == 4302 # Pair of Tens
@test NLH.rank((T, T, K, 4, 3)) == 4303 # Pair of Tens
@test NLH.rank((T, T, K, 4, 2)) == 4304 # Pair of Tens
@test NLH.rank((T, T, K, 3, 2)) == 4305 # Pair of Tens
@test NLH.rank((T, T, Q, J, 9)) == 4306 # Pair of Tens
@test NLH.rank((T, T, Q, J, 8)) == 4307 # Pair of Tens
@test NLH.rank((T, T, Q, J, 7)) == 4308 # Pair of Tens
@test NLH.rank((T, T, Q, J, 6)) == 4309 # Pair of Tens
@test NLH.rank((T, T, Q, J, 5)) == 4310 # Pair of Tens
@test NLH.rank((T, T, Q, J, 4)) == 4311 # Pair of Tens
@test NLH.rank((T, T, Q, J, 3)) == 4312 # Pair of Tens
@test NLH.rank((T, T, Q, J, 2)) == 4313 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 8)) == 4314 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 7)) == 4315 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 6)) == 4316 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 5)) == 4317 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 4)) == 4318 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 3)) == 4319 # Pair of Tens
@test NLH.rank((T, T, Q, 9, 2)) == 4320 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 7)) == 4321 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 6)) == 4322 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 5)) == 4323 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 4)) == 4324 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 3)) == 4325 # Pair of Tens
@test NLH.rank((T, T, Q, 8, 2)) == 4326 # Pair of Tens
@test NLH.rank((T, T, Q, 7, 6)) == 4327 # Pair of Tens
@test NLH.rank((T, T, Q, 7, 5)) == 4328 # Pair of Tens
@test NLH.rank((T, T, Q, 7, 4)) == 4329 # Pair of Tens
@test NLH.rank((T, T, Q, 7, 3)) == 4330 # Pair of Tens
@test NLH.rank((T, T, Q, 7, 2)) == 4331 # Pair of Tens
@test NLH.rank((T, T, Q, 6, 5)) == 4332 # Pair of Tens
@test NLH.rank((T, T, Q, 6, 4)) == 4333 # Pair of Tens
@test NLH.rank((T, T, Q, 6, 3)) == 4334 # Pair of Tens
@test NLH.rank((T, T, Q, 6, 2)) == 4335 # Pair of Tens
@test NLH.rank((T, T, Q, 5, 4)) == 4336 # Pair of Tens
@test NLH.rank((T, T, Q, 5, 3)) == 4337 # Pair of Tens
@test NLH.rank((T, T, Q, 5, 2)) == 4338 # Pair of Tens
@test NLH.rank((T, T, Q, 4, 3)) == 4339 # Pair of Tens
@test NLH.rank((T, T, Q, 4, 2)) == 4340 # Pair of Tens
@test NLH.rank((T, T, Q, 3, 2)) == 4341 # Pair of Tens
@test NLH.rank((T, T, J, 9, 8)) == 4342 # Pair of Tens
@test NLH.rank((T, T, J, 9, 7)) == 4343 # Pair of Tens
@test NLH.rank((T, T, J, 9, 6)) == 4344 # Pair of Tens
@test NLH.rank((T, T, J, 9, 5)) == 4345 # Pair of Tens
@test NLH.rank((T, T, J, 9, 4)) == 4346 # Pair of Tens
@test NLH.rank((T, T, J, 9, 3)) == 4347 # Pair of Tens
@test NLH.rank((T, T, J, 9, 2)) == 4348 # Pair of Tens
@test NLH.rank((T, T, J, 8, 7)) == 4349 # Pair of Tens
@test NLH.rank((T, T, J, 8, 6)) == 4350 # Pair of Tens
@test NLH.rank((T, T, J, 8, 5)) == 4351 # Pair of Tens
@test NLH.rank((T, T, J, 8, 4)) == 4352 # Pair of Tens
@test NLH.rank((T, T, J, 8, 3)) == 4353 # Pair of Tens
@test NLH.rank((T, T, J, 8, 2)) == 4354 # Pair of Tens
@test NLH.rank((T, T, J, 7, 6)) == 4355 # Pair of Tens
@test NLH.rank((T, T, J, 7, 5)) == 4356 # Pair of Tens
@test NLH.rank((T, T, J, 7, 4)) == 4357 # Pair of Tens
@test NLH.rank((T, T, J, 7, 3)) == 4358 # Pair of Tens
@test NLH.rank((T, T, J, 7, 2)) == 4359 # Pair of Tens
@test NLH.rank((T, T, J, 6, 5)) == 4360 # Pair of Tens
@test NLH.rank((T, T, J, 6, 4)) == 4361 # Pair of Tens
@test NLH.rank((T, T, J, 6, 3)) == 4362 # Pair of Tens
@test NLH.rank((T, T, J, 6, 2)) == 4363 # Pair of Tens
@test NLH.rank((T, T, J, 5, 4)) == 4364 # Pair of Tens
@test NLH.rank((T, T, J, 5, 3)) == 4365 # Pair of Tens
@test NLH.rank((T, T, J, 5, 2)) == 4366 # Pair of Tens
@test NLH.rank((T, T, J, 4, 3)) == 4367 # Pair of Tens
@test NLH.rank((T, T, J, 4, 2)) == 4368 # Pair of Tens
@test NLH.rank((T, T, J, 3, 2)) == 4369 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 7)) == 4370 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 6)) == 4371 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 5)) == 4372 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 4)) == 4373 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 3)) == 4374 # Pair of Tens
@test NLH.rank((T, T, 9, 8, 2)) == 4375 # Pair of Tens
@test NLH.rank((T, T, 9, 7, 6)) == 4376 # Pair of Tens
@test NLH.rank((T, T, 9, 7, 5)) == 4377 # Pair of Tens
@test NLH.rank((T, T, 9, 7, 4)) == 4378 # Pair of Tens
@test NLH.rank((T, T, 9, 7, 3)) == 4379 # Pair of Tens
@test NLH.rank((T, T, 9, 7, 2)) == 4380 # Pair of Tens
@test NLH.rank((T, T, 9, 6, 5)) == 4381 # Pair of Tens
@test NLH.rank((T, T, 9, 6, 4)) == 4382 # Pair of Tens
@test NLH.rank((T, T, 9, 6, 3)) == 4383 # Pair of Tens
@test NLH.rank((T, T, 9, 6, 2)) == 4384 # Pair of Tens
@test NLH.rank((T, T, 9, 5, 4)) == 4385 # Pair of Tens
@test NLH.rank((T, T, 9, 5, 3)) == 4386 # Pair of Tens
@test NLH.rank((T, T, 9, 5, 2)) == 4387 # Pair of Tens
@test NLH.rank((T, T, 9, 4, 3)) == 4388 # Pair of Tens
@test NLH.rank((T, T, 9, 4, 2)) == 4389 # Pair of Tens
@test NLH.rank((T, T, 9, 3, 2)) == 4390 # Pair of Tens
@test NLH.rank((T, T, 8, 7, 6)) == 4391 # Pair of Tens
@test NLH.rank((T, T, 8, 7, 5)) == 4392 # Pair of Tens
@test NLH.rank((T, T, 8, 7, 4)) == 4393 # Pair of Tens
@test NLH.rank((T, T, 8, 7, 3)) == 4394 # Pair of Tens
@test NLH.rank((T, T, 8, 7, 2)) == 4395 # Pair of Tens
@test NLH.rank((T, T, 8, 6, 5)) == 4396 # Pair of Tens
@test NLH.rank((T, T, 8, 6, 4)) == 4397 # Pair of Tens
@test NLH.rank((T, T, 8, 6, 3)) == 4398 # Pair of Tens
@test NLH.rank((T, T, 8, 6, 2)) == 4399 # Pair of Tens
@test NLH.rank((T, T, 8, 5, 4)) == 4400 # Pair of Tens
@test NLH.rank((T, T, 8, 5, 3)) == 4401 # Pair of Tens
@test NLH.rank((T, T, 8, 5, 2)) == 4402 # Pair of Tens
@test NLH.rank((T, T, 8, 4, 3)) == 4403 # Pair of Tens
@test NLH.rank((T, T, 8, 4, 2)) == 4404 # Pair of Tens
@test NLH.rank((T, T, 8, 3, 2)) == 4405 # Pair of Tens
@test NLH.rank((T, T, 7, 6, 5)) == 4406 # Pair of Tens
@test NLH.rank((T, T, 7, 6, 4)) == 4407 # Pair of Tens
@test NLH.rank((T, T, 7, 6, 3)) == 4408 # Pair of Tens
@test NLH.rank((T, T, 7, 6, 2)) == 4409 # Pair of Tens
@test NLH.rank((T, T, 7, 5, 4)) == 4410 # Pair of Tens
@test NLH.rank((T, T, 7, 5, 3)) == 4411 # Pair of Tens
@test NLH.rank((T, T, 7, 5, 2)) == 4412 # Pair of Tens
@test NLH.rank((T, T, 7, 4, 3)) == 4413 # Pair of Tens
@test NLH.rank((T, T, 7, 4, 2)) == 4414 # Pair of Tens
@test NLH.rank((T, T, 7, 3, 2)) == 4415 # Pair of Tens
@test NLH.rank((T, T, 6, 5, 4)) == 4416 # Pair of Tens
@test NLH.rank((T, T, 6, 5, 3)) == 4417 # Pair of Tens
@test NLH.rank((T, T, 6, 5, 2)) == 4418 # Pair of Tens
@test NLH.rank((T, T, 6, 4, 3)) == 4419 # Pair of Tens
@test NLH.rank((T, T, 6, 4, 2)) == 4420 # Pair of Tens
@test NLH.rank((T, T, 6, 3, 2)) == 4421 # Pair of Tens
@test NLH.rank((T, T, 5, 4, 3)) == 4422 # Pair of Tens
@test NLH.rank((T, T, 5, 4, 2)) == 4423 # Pair of Tens
@test NLH.rank((T, T, 5, 3, 2)) == 4424 # Pair of Tens
@test NLH.rank((T, T, 4, 3, 2)) == 4425 # Pair of Tens
@test NLH.rank((9, 9, A, K, Q)) == 4426 # Pair of Nines
@test NLH.rank((9, 9, A, K, J)) == 4427 # Pair of Nines
@test NLH.rank((9, 9, A, K, T)) == 4428 # Pair of Nines
@test NLH.rank((9, 9, A, K, 8)) == 4429 # Pair of Nines
@test NLH.rank((9, 9, A, K, 7)) == 4430 # Pair of Nines
@test NLH.rank((9, 9, A, K, 6)) == 4431 # Pair of Nines
@test NLH.rank((9, 9, A, K, 5)) == 4432 # Pair of Nines
@test NLH.rank((9, 9, A, K, 4)) == 4433 # Pair of Nines
@test NLH.rank((9, 9, A, K, 3)) == 4434 # Pair of Nines
@test NLH.rank((9, 9, A, K, 2)) == 4435 # Pair of Nines
@test NLH.rank((9, 9, A, Q, J)) == 4436 # Pair of Nines
@test NLH.rank((9, 9, A, Q, T)) == 4437 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 8)) == 4438 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 7)) == 4439 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 6)) == 4440 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 5)) == 4441 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 4)) == 4442 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 3)) == 4443 # Pair of Nines
@test NLH.rank((9, 9, A, Q, 2)) == 4444 # Pair of Nines
@test NLH.rank((9, 9, A, J, T)) == 4445 # Pair of Nines
@test NLH.rank((9, 9, A, J, 8)) == 4446 # Pair of Nines
@test NLH.rank((9, 9, A, J, 7)) == 4447 # Pair of Nines
@test NLH.rank((9, 9, A, J, 6)) == 4448 # Pair of Nines
@test NLH.rank((9, 9, A, J, 5)) == 4449 # Pair of Nines
@test NLH.rank((9, 9, A, J, 4)) == 4450 # Pair of Nines
@test NLH.rank((9, 9, A, J, 3)) == 4451 # Pair of Nines
@test NLH.rank((9, 9, A, J, 2)) == 4452 # Pair of Nines
@test NLH.rank((9, 9, A, T, 8)) == 4453 # Pair of Nines
@test NLH.rank((9, 9, A, T, 7)) == 4454 # Pair of Nines
@test NLH.rank((9, 9, A, T, 6)) == 4455 # Pair of Nines
@test NLH.rank((9, 9, A, T, 5)) == 4456 # Pair of Nines
@test NLH.rank((9, 9, A, T, 4)) == 4457 # Pair of Nines
@test NLH.rank((9, 9, A, T, 3)) == 4458 # Pair of Nines
@test NLH.rank((9, 9, A, T, 2)) == 4459 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 7)) == 4460 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 6)) == 4461 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 5)) == 4462 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 4)) == 4463 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 3)) == 4464 # Pair of Nines
@test NLH.rank((9, 9, A, 8, 2)) == 4465 # Pair of Nines
@test NLH.rank((9, 9, A, 7, 6)) == 4466 # Pair of Nines
@test NLH.rank((9, 9, A, 7, 5)) == 4467 # Pair of Nines
@test NLH.rank((9, 9, A, 7, 4)) == 4468 # Pair of Nines
@test NLH.rank((9, 9, A, 7, 3)) == 4469 # Pair of Nines
@test NLH.rank((9, 9, A, 7, 2)) == 4470 # Pair of Nines
@test NLH.rank((9, 9, A, 6, 5)) == 4471 # Pair of Nines
@test NLH.rank((9, 9, A, 6, 4)) == 4472 # Pair of Nines
@test NLH.rank((9, 9, A, 6, 3)) == 4473 # Pair of Nines
@test NLH.rank((9, 9, A, 6, 2)) == 4474 # Pair of Nines
@test NLH.rank((9, 9, A, 5, 4)) == 4475 # Pair of Nines
@test NLH.rank((9, 9, A, 5, 3)) == 4476 # Pair of Nines
@test NLH.rank((9, 9, A, 5, 2)) == 4477 # Pair of Nines
@test NLH.rank((9, 9, A, 4, 3)) == 4478 # Pair of Nines
@test NLH.rank((9, 9, A, 4, 2)) == 4479 # Pair of Nines
@test NLH.rank((9, 9, A, 3, 2)) == 4480 # Pair of Nines
@test NLH.rank((9, 9, K, Q, J)) == 4481 # Pair of Nines
@test NLH.rank((9, 9, K, Q, T)) == 4482 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 8)) == 4483 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 7)) == 4484 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 6)) == 4485 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 5)) == 4486 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 4)) == 4487 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 3)) == 4488 # Pair of Nines
@test NLH.rank((9, 9, K, Q, 2)) == 4489 # Pair of Nines
@test NLH.rank((9, 9, K, J, T)) == 4490 # Pair of Nines
@test NLH.rank((9, 9, K, J, 8)) == 4491 # Pair of Nines
@test NLH.rank((9, 9, K, J, 7)) == 4492 # Pair of Nines
@test NLH.rank((9, 9, K, J, 6)) == 4493 # Pair of Nines
@test NLH.rank((9, 9, K, J, 5)) == 4494 # Pair of Nines
@test NLH.rank((9, 9, K, J, 4)) == 4495 # Pair of Nines
@test NLH.rank((9, 9, K, J, 3)) == 4496 # Pair of Nines
@test NLH.rank((9, 9, K, J, 2)) == 4497 # Pair of Nines
@test NLH.rank((9, 9, K, T, 8)) == 4498 # Pair of Nines
@test NLH.rank((9, 9, K, T, 7)) == 4499 # Pair of Nines
@test NLH.rank((9, 9, K, T, 6)) == 4500 # Pair of Nines
@test NLH.rank((9, 9, K, T, 5)) == 4501 # Pair of Nines
@test NLH.rank((9, 9, K, T, 4)) == 4502 # Pair of Nines
@test NLH.rank((9, 9, K, T, 3)) == 4503 # Pair of Nines
@test NLH.rank((9, 9, K, T, 2)) == 4504 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 7)) == 4505 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 6)) == 4506 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 5)) == 4507 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 4)) == 4508 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 3)) == 4509 # Pair of Nines
@test NLH.rank((9, 9, K, 8, 2)) == 4510 # Pair of Nines
@test NLH.rank((9, 9, K, 7, 6)) == 4511 # Pair of Nines
@test NLH.rank((9, 9, K, 7, 5)) == 4512 # Pair of Nines
@test NLH.rank((9, 9, K, 7, 4)) == 4513 # Pair of Nines
@test NLH.rank((9, 9, K, 7, 3)) == 4514 # Pair of Nines
@test NLH.rank((9, 9, K, 7, 2)) == 4515 # Pair of Nines
@test NLH.rank((9, 9, K, 6, 5)) == 4516 # Pair of Nines
@test NLH.rank((9, 9, K, 6, 4)) == 4517 # Pair of Nines
@test NLH.rank((9, 9, K, 6, 3)) == 4518 # Pair of Nines
@test NLH.rank((9, 9, K, 6, 2)) == 4519 # Pair of Nines
@test NLH.rank((9, 9, K, 5, 4)) == 4520 # Pair of Nines
@test NLH.rank((9, 9, K, 5, 3)) == 4521 # Pair of Nines
@test NLH.rank((9, 9, K, 5, 2)) == 4522 # Pair of Nines
@test NLH.rank((9, 9, K, 4, 3)) == 4523 # Pair of Nines
@test NLH.rank((9, 9, K, 4, 2)) == 4524 # Pair of Nines
@test NLH.rank((9, 9, K, 3, 2)) == 4525 # Pair of Nines
@test NLH.rank((9, 9, Q, J, T)) == 4526 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 8)) == 4527 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 7)) == 4528 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 6)) == 4529 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 5)) == 4530 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 4)) == 4531 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 3)) == 4532 # Pair of Nines
@test NLH.rank((9, 9, Q, J, 2)) == 4533 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 8)) == 4534 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 7)) == 4535 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 6)) == 4536 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 5)) == 4537 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 4)) == 4538 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 3)) == 4539 # Pair of Nines
@test NLH.rank((9, 9, Q, T, 2)) == 4540 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 7)) == 4541 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 6)) == 4542 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 5)) == 4543 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 4)) == 4544 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 3)) == 4545 # Pair of Nines
@test NLH.rank((9, 9, Q, 8, 2)) == 4546 # Pair of Nines
@test NLH.rank((9, 9, Q, 7, 6)) == 4547 # Pair of Nines
@test NLH.rank((9, 9, Q, 7, 5)) == 4548 # Pair of Nines
@test NLH.rank((9, 9, Q, 7, 4)) == 4549 # Pair of Nines
@test NLH.rank((9, 9, Q, 7, 3)) == 4550 # Pair of Nines
@test NLH.rank((9, 9, Q, 7, 2)) == 4551 # Pair of Nines
@test NLH.rank((9, 9, Q, 6, 5)) == 4552 # Pair of Nines
@test NLH.rank((9, 9, Q, 6, 4)) == 4553 # Pair of Nines
@test NLH.rank((9, 9, Q, 6, 3)) == 4554 # Pair of Nines
@test NLH.rank((9, 9, Q, 6, 2)) == 4555 # Pair of Nines
@test NLH.rank((9, 9, Q, 5, 4)) == 4556 # Pair of Nines
@test NLH.rank((9, 9, Q, 5, 3)) == 4557 # Pair of Nines
@test NLH.rank((9, 9, Q, 5, 2)) == 4558 # Pair of Nines
@test NLH.rank((9, 9, Q, 4, 3)) == 4559 # Pair of Nines
@test NLH.rank((9, 9, Q, 4, 2)) == 4560 # Pair of Nines
@test NLH.rank((9, 9, Q, 3, 2)) == 4561 # Pair of Nines
@test NLH.rank((9, 9, J, T, 8)) == 4562 # Pair of Nines
@test NLH.rank((9, 9, J, T, 7)) == 4563 # Pair of Nines
@test NLH.rank((9, 9, J, T, 6)) == 4564 # Pair of Nines
@test NLH.rank((9, 9, J, T, 5)) == 4565 # Pair of Nines
@test NLH.rank((9, 9, J, T, 4)) == 4566 # Pair of Nines
@test NLH.rank((9, 9, J, T, 3)) == 4567 # Pair of Nines
@test NLH.rank((9, 9, J, T, 2)) == 4568 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 7)) == 4569 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 6)) == 4570 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 5)) == 4571 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 4)) == 4572 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 3)) == 4573 # Pair of Nines
@test NLH.rank((9, 9, J, 8, 2)) == 4574 # Pair of Nines
@test NLH.rank((9, 9, J, 7, 6)) == 4575 # Pair of Nines
@test NLH.rank((9, 9, J, 7, 5)) == 4576 # Pair of Nines
@test NLH.rank((9, 9, J, 7, 4)) == 4577 # Pair of Nines
@test NLH.rank((9, 9, J, 7, 3)) == 4578 # Pair of Nines
@test NLH.rank((9, 9, J, 7, 2)) == 4579 # Pair of Nines
@test NLH.rank((9, 9, J, 6, 5)) == 4580 # Pair of Nines
@test NLH.rank((9, 9, J, 6, 4)) == 4581 # Pair of Nines
@test NLH.rank((9, 9, J, 6, 3)) == 4582 # Pair of Nines
@test NLH.rank((9, 9, J, 6, 2)) == 4583 # Pair of Nines
@test NLH.rank((9, 9, J, 5, 4)) == 4584 # Pair of Nines
@test NLH.rank((9, 9, J, 5, 3)) == 4585 # Pair of Nines
@test NLH.rank((9, 9, J, 5, 2)) == 4586 # Pair of Nines
@test NLH.rank((9, 9, J, 4, 3)) == 4587 # Pair of Nines
@test NLH.rank((9, 9, J, 4, 2)) == 4588 # Pair of Nines
@test NLH.rank((9, 9, J, 3, 2)) == 4589 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 7)) == 4590 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 6)) == 4591 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 5)) == 4592 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 4)) == 4593 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 3)) == 4594 # Pair of Nines
@test NLH.rank((9, 9, T, 8, 2)) == 4595 # Pair of Nines
@test NLH.rank((9, 9, T, 7, 6)) == 4596 # Pair of Nines
@test NLH.rank((9, 9, T, 7, 5)) == 4597 # Pair of Nines
@test NLH.rank((9, 9, T, 7, 4)) == 4598 # Pair of Nines
@test NLH.rank((9, 9, T, 7, 3)) == 4599 # Pair of Nines
@test NLH.rank((9, 9, T, 7, 2)) == 4600 # Pair of Nines
@test NLH.rank((9, 9, T, 6, 5)) == 4601 # Pair of Nines
@test NLH.rank((9, 9, T, 6, 4)) == 4602 # Pair of Nines
@test NLH.rank((9, 9, T, 6, 3)) == 4603 # Pair of Nines
@test NLH.rank((9, 9, T, 6, 2)) == 4604 # Pair of Nines
@test NLH.rank((9, 9, T, 5, 4)) == 4605 # Pair of Nines
@test NLH.rank((9, 9, T, 5, 3)) == 4606 # Pair of Nines
@test NLH.rank((9, 9, T, 5, 2)) == 4607 # Pair of Nines
@test NLH.rank((9, 9, T, 4, 3)) == 4608 # Pair of Nines
@test NLH.rank((9, 9, T, 4, 2)) == 4609 # Pair of Nines
@test NLH.rank((9, 9, T, 3, 2)) == 4610 # Pair of Nines
@test NLH.rank((9, 9, 8, 7, 6)) == 4611 # Pair of Nines
@test NLH.rank((9, 9, 8, 7, 5)) == 4612 # Pair of Nines
@test NLH.rank((9, 9, 8, 7, 4)) == 4613 # Pair of Nines
@test NLH.rank((9, 9, 8, 7, 3)) == 4614 # Pair of Nines
@test NLH.rank((9, 9, 8, 7, 2)) == 4615 # Pair of Nines
@test NLH.rank((9, 9, 8, 6, 5)) == 4616 # Pair of Nines
@test NLH.rank((9, 9, 8, 6, 4)) == 4617 # Pair of Nines
@test NLH.rank((9, 9, 8, 6, 3)) == 4618 # Pair of Nines
@test NLH.rank((9, 9, 8, 6, 2)) == 4619 # Pair of Nines
@test NLH.rank((9, 9, 8, 5, 4)) == 4620 # Pair of Nines
@test NLH.rank((9, 9, 8, 5, 3)) == 4621 # Pair of Nines
@test NLH.rank((9, 9, 8, 5, 2)) == 4622 # Pair of Nines
@test NLH.rank((9, 9, 8, 4, 3)) == 4623 # Pair of Nines
@test NLH.rank((9, 9, 8, 4, 2)) == 4624 # Pair of Nines
@test NLH.rank((9, 9, 8, 3, 2)) == 4625 # Pair of Nines
@test NLH.rank((9, 9, 7, 6, 5)) == 4626 # Pair of Nines
@test NLH.rank((9, 9, 7, 6, 4)) == 4627 # Pair of Nines
@test NLH.rank((9, 9, 7, 6, 3)) == 4628 # Pair of Nines
@test NLH.rank((9, 9, 7, 6, 2)) == 4629 # Pair of Nines
@test NLH.rank((9, 9, 7, 5, 4)) == 4630 # Pair of Nines
@test NLH.rank((9, 9, 7, 5, 3)) == 4631 # Pair of Nines
@test NLH.rank((9, 9, 7, 5, 2)) == 4632 # Pair of Nines
@test NLH.rank((9, 9, 7, 4, 3)) == 4633 # Pair of Nines
@test NLH.rank((9, 9, 7, 4, 2)) == 4634 # Pair of Nines
@test NLH.rank((9, 9, 7, 3, 2)) == 4635 # Pair of Nines
@test NLH.rank((9, 9, 6, 5, 4)) == 4636 # Pair of Nines
@test NLH.rank((9, 9, 6, 5, 3)) == 4637 # Pair of Nines
@test NLH.rank((9, 9, 6, 5, 2)) == 4638 # Pair of Nines
@test NLH.rank((9, 9, 6, 4, 3)) == 4639 # Pair of Nines
@test NLH.rank((9, 9, 6, 4, 2)) == 4640 # Pair of Nines
@test NLH.rank((9, 9, 6, 3, 2)) == 4641 # Pair of Nines
@test NLH.rank((9, 9, 5, 4, 3)) == 4642 # Pair of Nines
@test NLH.rank((9, 9, 5, 4, 2)) == 4643 # Pair of Nines
@test NLH.rank((9, 9, 5, 3, 2)) == 4644 # Pair of Nines
@test NLH.rank((9, 9, 4, 3, 2)) == 4645 # Pair of Nines
@test NLH.rank((8, 8, A, K, Q)) == 4646 # Pair of Eights
@test NLH.rank((8, 8, A, K, J)) == 4647 # Pair of Eights
@test NLH.rank((8, 8, A, K, T)) == 4648 # Pair of Eights
@test NLH.rank((8, 8, A, K, 9)) == 4649 # Pair of Eights
@test NLH.rank((8, 8, A, K, 7)) == 4650 # Pair of Eights
@test NLH.rank((8, 8, A, K, 6)) == 4651 # Pair of Eights
@test NLH.rank((8, 8, A, K, 5)) == 4652 # Pair of Eights
@test NLH.rank((8, 8, A, K, 4)) == 4653 # Pair of Eights
@test NLH.rank((8, 8, A, K, 3)) == 4654 # Pair of Eights
@test NLH.rank((8, 8, A, K, 2)) == 4655 # Pair of Eights
@test NLH.rank((8, 8, A, Q, J)) == 4656 # Pair of Eights
@test NLH.rank((8, 8, A, Q, T)) == 4657 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 9)) == 4658 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 7)) == 4659 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 6)) == 4660 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 5)) == 4661 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 4)) == 4662 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 3)) == 4663 # Pair of Eights
@test NLH.rank((8, 8, A, Q, 2)) == 4664 # Pair of Eights
@test NLH.rank((8, 8, A, J, T)) == 4665 # Pair of Eights
@test NLH.rank((8, 8, A, J, 9)) == 4666 # Pair of Eights
@test NLH.rank((8, 8, A, J, 7)) == 4667 # Pair of Eights
@test NLH.rank((8, 8, A, J, 6)) == 4668 # Pair of Eights
@test NLH.rank((8, 8, A, J, 5)) == 4669 # Pair of Eights
@test NLH.rank((8, 8, A, J, 4)) == 4670 # Pair of Eights
@test NLH.rank((8, 8, A, J, 3)) == 4671 # Pair of Eights
@test NLH.rank((8, 8, A, J, 2)) == 4672 # Pair of Eights
@test NLH.rank((8, 8, A, T, 9)) == 4673 # Pair of Eights
@test NLH.rank((8, 8, A, T, 7)) == 4674 # Pair of Eights
@test NLH.rank((8, 8, A, T, 6)) == 4675 # Pair of Eights
@test NLH.rank((8, 8, A, T, 5)) == 4676 # Pair of Eights
@test NLH.rank((8, 8, A, T, 4)) == 4677 # Pair of Eights
@test NLH.rank((8, 8, A, T, 3)) == 4678 # Pair of Eights
@test NLH.rank((8, 8, A, T, 2)) == 4679 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 7)) == 4680 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 6)) == 4681 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 5)) == 4682 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 4)) == 4683 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 3)) == 4684 # Pair of Eights
@test NLH.rank((8, 8, A, 9, 2)) == 4685 # Pair of Eights
@test NLH.rank((8, 8, A, 7, 6)) == 4686 # Pair of Eights
@test NLH.rank((8, 8, A, 7, 5)) == 4687 # Pair of Eights
@test NLH.rank((8, 8, A, 7, 4)) == 4688 # Pair of Eights
@test NLH.rank((8, 8, A, 7, 3)) == 4689 # Pair of Eights
@test NLH.rank((8, 8, A, 7, 2)) == 4690 # Pair of Eights
@test NLH.rank((8, 8, A, 6, 5)) == 4691 # Pair of Eights
@test NLH.rank((8, 8, A, 6, 4)) == 4692 # Pair of Eights
@test NLH.rank((8, 8, A, 6, 3)) == 4693 # Pair of Eights
@test NLH.rank((8, 8, A, 6, 2)) == 4694 # Pair of Eights
@test NLH.rank((8, 8, A, 5, 4)) == 4695 # Pair of Eights
@test NLH.rank((8, 8, A, 5, 3)) == 4696 # Pair of Eights
@test NLH.rank((8, 8, A, 5, 2)) == 4697 # Pair of Eights
@test NLH.rank((8, 8, A, 4, 3)) == 4698 # Pair of Eights
@test NLH.rank((8, 8, A, 4, 2)) == 4699 # Pair of Eights
@test NLH.rank((8, 8, A, 3, 2)) == 4700 # Pair of Eights
@test NLH.rank((8, 8, K, Q, J)) == 4701 # Pair of Eights
@test NLH.rank((8, 8, K, Q, T)) == 4702 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 9)) == 4703 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 7)) == 4704 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 6)) == 4705 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 5)) == 4706 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 4)) == 4707 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 3)) == 4708 # Pair of Eights
@test NLH.rank((8, 8, K, Q, 2)) == 4709 # Pair of Eights
@test NLH.rank((8, 8, K, J, T)) == 4710 # Pair of Eights
@test NLH.rank((8, 8, K, J, 9)) == 4711 # Pair of Eights
@test NLH.rank((8, 8, K, J, 7)) == 4712 # Pair of Eights
@test NLH.rank((8, 8, K, J, 6)) == 4713 # Pair of Eights
@test NLH.rank((8, 8, K, J, 5)) == 4714 # Pair of Eights
@test NLH.rank((8, 8, K, J, 4)) == 4715 # Pair of Eights
@test NLH.rank((8, 8, K, J, 3)) == 4716 # Pair of Eights
@test NLH.rank((8, 8, K, J, 2)) == 4717 # Pair of Eights
@test NLH.rank((8, 8, K, T, 9)) == 4718 # Pair of Eights
@test NLH.rank((8, 8, K, T, 7)) == 4719 # Pair of Eights
@test NLH.rank((8, 8, K, T, 6)) == 4720 # Pair of Eights
@test NLH.rank((8, 8, K, T, 5)) == 4721 # Pair of Eights
@test NLH.rank((8, 8, K, T, 4)) == 4722 # Pair of Eights
@test NLH.rank((8, 8, K, T, 3)) == 4723 # Pair of Eights
@test NLH.rank((8, 8, K, T, 2)) == 4724 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 7)) == 4725 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 6)) == 4726 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 5)) == 4727 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 4)) == 4728 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 3)) == 4729 # Pair of Eights
@test NLH.rank((8, 8, K, 9, 2)) == 4730 # Pair of Eights
@test NLH.rank((8, 8, K, 7, 6)) == 4731 # Pair of Eights
@test NLH.rank((8, 8, K, 7, 5)) == 4732 # Pair of Eights
@test NLH.rank((8, 8, K, 7, 4)) == 4733 # Pair of Eights
@test NLH.rank((8, 8, K, 7, 3)) == 4734 # Pair of Eights
@test NLH.rank((8, 8, K, 7, 2)) == 4735 # Pair of Eights
@test NLH.rank((8, 8, K, 6, 5)) == 4736 # Pair of Eights
@test NLH.rank((8, 8, K, 6, 4)) == 4737 # Pair of Eights
@test NLH.rank((8, 8, K, 6, 3)) == 4738 # Pair of Eights
@test NLH.rank((8, 8, K, 6, 2)) == 4739 # Pair of Eights
@test NLH.rank((8, 8, K, 5, 4)) == 4740 # Pair of Eights
@test NLH.rank((8, 8, K, 5, 3)) == 4741 # Pair of Eights
@test NLH.rank((8, 8, K, 5, 2)) == 4742 # Pair of Eights
@test NLH.rank((8, 8, K, 4, 3)) == 4743 # Pair of Eights
@test NLH.rank((8, 8, K, 4, 2)) == 4744 # Pair of Eights
@test NLH.rank((8, 8, K, 3, 2)) == 4745 # Pair of Eights
@test NLH.rank((8, 8, Q, J, T)) == 4746 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 9)) == 4747 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 7)) == 4748 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 6)) == 4749 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 5)) == 4750 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 4)) == 4751 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 3)) == 4752 # Pair of Eights
@test NLH.rank((8, 8, Q, J, 2)) == 4753 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 9)) == 4754 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 7)) == 4755 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 6)) == 4756 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 5)) == 4757 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 4)) == 4758 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 3)) == 4759 # Pair of Eights
@test NLH.rank((8, 8, Q, T, 2)) == 4760 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 7)) == 4761 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 6)) == 4762 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 5)) == 4763 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 4)) == 4764 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 3)) == 4765 # Pair of Eights
@test NLH.rank((8, 8, Q, 9, 2)) == 4766 # Pair of Eights
@test NLH.rank((8, 8, Q, 7, 6)) == 4767 # Pair of Eights
@test NLH.rank((8, 8, Q, 7, 5)) == 4768 # Pair of Eights
@test NLH.rank((8, 8, Q, 7, 4)) == 4769 # Pair of Eights
@test NLH.rank((8, 8, Q, 7, 3)) == 4770 # Pair of Eights
@test NLH.rank((8, 8, Q, 7, 2)) == 4771 # Pair of Eights
@test NLH.rank((8, 8, Q, 6, 5)) == 4772 # Pair of Eights
@test NLH.rank((8, 8, Q, 6, 4)) == 4773 # Pair of Eights
@test NLH.rank((8, 8, Q, 6, 3)) == 4774 # Pair of Eights
@test NLH.rank((8, 8, Q, 6, 2)) == 4775 # Pair of Eights
@test NLH.rank((8, 8, Q, 5, 4)) == 4776 # Pair of Eights
@test NLH.rank((8, 8, Q, 5, 3)) == 4777 # Pair of Eights
@test NLH.rank((8, 8, Q, 5, 2)) == 4778 # Pair of Eights
@test NLH.rank((8, 8, Q, 4, 3)) == 4779 # Pair of Eights
@test NLH.rank((8, 8, Q, 4, 2)) == 4780 # Pair of Eights
@test NLH.rank((8, 8, Q, 3, 2)) == 4781 # Pair of Eights
@test NLH.rank((8, 8, J, T, 9)) == 4782 # Pair of Eights
@test NLH.rank((8, 8, J, T, 7)) == 4783 # Pair of Eights
@test NLH.rank((8, 8, J, T, 6)) == 4784 # Pair of Eights
@test NLH.rank((8, 8, J, T, 5)) == 4785 # Pair of Eights
@test NLH.rank((8, 8, J, T, 4)) == 4786 # Pair of Eights
@test NLH.rank((8, 8, J, T, 3)) == 4787 # Pair of Eights
@test NLH.rank((8, 8, J, T, 2)) == 4788 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 7)) == 4789 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 6)) == 4790 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 5)) == 4791 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 4)) == 4792 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 3)) == 4793 # Pair of Eights
@test NLH.rank((8, 8, J, 9, 2)) == 4794 # Pair of Eights
@test NLH.rank((8, 8, J, 7, 6)) == 4795 # Pair of Eights
@test NLH.rank((8, 8, J, 7, 5)) == 4796 # Pair of Eights
@test NLH.rank((8, 8, J, 7, 4)) == 4797 # Pair of Eights
@test NLH.rank((8, 8, J, 7, 3)) == 4798 # Pair of Eights
@test NLH.rank((8, 8, J, 7, 2)) == 4799 # Pair of Eights
@test NLH.rank((8, 8, J, 6, 5)) == 4800 # Pair of Eights
@test NLH.rank((8, 8, J, 6, 4)) == 4801 # Pair of Eights
@test NLH.rank((8, 8, J, 6, 3)) == 4802 # Pair of Eights
@test NLH.rank((8, 8, J, 6, 2)) == 4803 # Pair of Eights
@test NLH.rank((8, 8, J, 5, 4)) == 4804 # Pair of Eights
@test NLH.rank((8, 8, J, 5, 3)) == 4805 # Pair of Eights
@test NLH.rank((8, 8, J, 5, 2)) == 4806 # Pair of Eights
@test NLH.rank((8, 8, J, 4, 3)) == 4807 # Pair of Eights
@test NLH.rank((8, 8, J, 4, 2)) == 4808 # Pair of Eights
@test NLH.rank((8, 8, J, 3, 2)) == 4809 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 7)) == 4810 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 6)) == 4811 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 5)) == 4812 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 4)) == 4813 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 3)) == 4814 # Pair of Eights
@test NLH.rank((8, 8, T, 9, 2)) == 4815 # Pair of Eights
@test NLH.rank((8, 8, T, 7, 6)) == 4816 # Pair of Eights
@test NLH.rank((8, 8, T, 7, 5)) == 4817 # Pair of Eights
@test NLH.rank((8, 8, T, 7, 4)) == 4818 # Pair of Eights
@test NLH.rank((8, 8, T, 7, 3)) == 4819 # Pair of Eights
@test NLH.rank((8, 8, T, 7, 2)) == 4820 # Pair of Eights
@test NLH.rank((8, 8, T, 6, 5)) == 4821 # Pair of Eights
@test NLH.rank((8, 8, T, 6, 4)) == 4822 # Pair of Eights
@test NLH.rank((8, 8, T, 6, 3)) == 4823 # Pair of Eights
@test NLH.rank((8, 8, T, 6, 2)) == 4824 # Pair of Eights
@test NLH.rank((8, 8, T, 5, 4)) == 4825 # Pair of Eights
@test NLH.rank((8, 8, T, 5, 3)) == 4826 # Pair of Eights
@test NLH.rank((8, 8, T, 5, 2)) == 4827 # Pair of Eights
@test NLH.rank((8, 8, T, 4, 3)) == 4828 # Pair of Eights
@test NLH.rank((8, 8, T, 4, 2)) == 4829 # Pair of Eights
@test NLH.rank((8, 8, T, 3, 2)) == 4830 # Pair of Eights
@test NLH.rank((8, 8, 9, 7, 6)) == 4831 # Pair of Eights
@test NLH.rank((8, 8, 9, 7, 5)) == 4832 # Pair of Eights
@test NLH.rank((8, 8, 9, 7, 4)) == 4833 # Pair of Eights
@test NLH.rank((8, 8, 9, 7, 3)) == 4834 # Pair of Eights
@test NLH.rank((8, 8, 9, 7, 2)) == 4835 # Pair of Eights
@test NLH.rank((8, 8, 9, 6, 5)) == 4836 # Pair of Eights
@test NLH.rank((8, 8, 9, 6, 4)) == 4837 # Pair of Eights
@test NLH.rank((8, 8, 9, 6, 3)) == 4838 # Pair of Eights
@test NLH.rank((8, 8, 9, 6, 2)) == 4839 # Pair of Eights
@test NLH.rank((8, 8, 9, 5, 4)) == 4840 # Pair of Eights
@test NLH.rank((8, 8, 9, 5, 3)) == 4841 # Pair of Eights
@test NLH.rank((8, 8, 9, 5, 2)) == 4842 # Pair of Eights
@test NLH.rank((8, 8, 9, 4, 3)) == 4843 # Pair of Eights
@test NLH.rank((8, 8, 9, 4, 2)) == 4844 # Pair of Eights
@test NLH.rank((8, 8, 9, 3, 2)) == 4845 # Pair of Eights
@test NLH.rank((8, 8, 7, 6, 5)) == 4846 # Pair of Eights
@test NLH.rank((8, 8, 7, 6, 4)) == 4847 # Pair of Eights
@test NLH.rank((8, 8, 7, 6, 3)) == 4848 # Pair of Eights
@test NLH.rank((8, 8, 7, 6, 2)) == 4849 # Pair of Eights
@test NLH.rank((8, 8, 7, 5, 4)) == 4850 # Pair of Eights
@test NLH.rank((8, 8, 7, 5, 3)) == 4851 # Pair of Eights
@test NLH.rank((8, 8, 7, 5, 2)) == 4852 # Pair of Eights
@test NLH.rank((8, 8, 7, 4, 3)) == 4853 # Pair of Eights
@test NLH.rank((8, 8, 7, 4, 2)) == 4854 # Pair of Eights
@test NLH.rank((8, 8, 7, 3, 2)) == 4855 # Pair of Eights
@test NLH.rank((8, 8, 6, 5, 4)) == 4856 # Pair of Eights
@test NLH.rank((8, 8, 6, 5, 3)) == 4857 # Pair of Eights
@test NLH.rank((8, 8, 6, 5, 2)) == 4858 # Pair of Eights
@test NLH.rank((8, 8, 6, 4, 3)) == 4859 # Pair of Eights
@test NLH.rank((8, 8, 6, 4, 2)) == 4860 # Pair of Eights
@test NLH.rank((8, 8, 6, 3, 2)) == 4861 # Pair of Eights
@test NLH.rank((8, 8, 5, 4, 3)) == 4862 # Pair of Eights
@test NLH.rank((8, 8, 5, 4, 2)) == 4863 # Pair of Eights
@test NLH.rank((8, 8, 5, 3, 2)) == 4864 # Pair of Eights
@test NLH.rank((8, 8, 4, 3, 2)) == 4865 # Pair of Eights
@test NLH.rank((7, 7, A, K, Q)) == 4866 # Pair of Sevens
@test NLH.rank((7, 7, A, K, J)) == 4867 # Pair of Sevens
@test NLH.rank((7, 7, A, K, T)) == 4868 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 9)) == 4869 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 8)) == 4870 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 6)) == 4871 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 5)) == 4872 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 4)) == 4873 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 3)) == 4874 # Pair of Sevens
@test NLH.rank((7, 7, A, K, 2)) == 4875 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, J)) == 4876 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, T)) == 4877 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 9)) == 4878 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 8)) == 4879 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 6)) == 4880 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 5)) == 4881 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 4)) == 4882 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 3)) == 4883 # Pair of Sevens
@test NLH.rank((7, 7, A, Q, 2)) == 4884 # Pair of Sevens
@test NLH.rank((7, 7, A, J, T)) == 4885 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 9)) == 4886 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 8)) == 4887 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 6)) == 4888 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 5)) == 4889 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 4)) == 4890 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 3)) == 4891 # Pair of Sevens
@test NLH.rank((7, 7, A, J, 2)) == 4892 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 9)) == 4893 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 8)) == 4894 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 6)) == 4895 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 5)) == 4896 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 4)) == 4897 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 3)) == 4898 # Pair of Sevens
@test NLH.rank((7, 7, A, T, 2)) == 4899 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 8)) == 4900 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 6)) == 4901 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 5)) == 4902 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 4)) == 4903 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 3)) == 4904 # Pair of Sevens
@test NLH.rank((7, 7, A, 9, 2)) == 4905 # Pair of Sevens
@test NLH.rank((7, 7, A, 8, 6)) == 4906 # Pair of Sevens
@test NLH.rank((7, 7, A, 8, 5)) == 4907 # Pair of Sevens
@test NLH.rank((7, 7, A, 8, 4)) == 4908 # Pair of Sevens
@test NLH.rank((7, 7, A, 8, 3)) == 4909 # Pair of Sevens
@test NLH.rank((7, 7, A, 8, 2)) == 4910 # Pair of Sevens
@test NLH.rank((7, 7, A, 6, 5)) == 4911 # Pair of Sevens
@test NLH.rank((7, 7, A, 6, 4)) == 4912 # Pair of Sevens
@test NLH.rank((7, 7, A, 6, 3)) == 4913 # Pair of Sevens
@test NLH.rank((7, 7, A, 6, 2)) == 4914 # Pair of Sevens
@test NLH.rank((7, 7, A, 5, 4)) == 4915 # Pair of Sevens
@test NLH.rank((7, 7, A, 5, 3)) == 4916 # Pair of Sevens
@test NLH.rank((7, 7, A, 5, 2)) == 4917 # Pair of Sevens
@test NLH.rank((7, 7, A, 4, 3)) == 4918 # Pair of Sevens
@test NLH.rank((7, 7, A, 4, 2)) == 4919 # Pair of Sevens
@test NLH.rank((7, 7, A, 3, 2)) == 4920 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, J)) == 4921 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, T)) == 4922 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 9)) == 4923 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 8)) == 4924 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 6)) == 4925 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 5)) == 4926 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 4)) == 4927 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 3)) == 4928 # Pair of Sevens
@test NLH.rank((7, 7, K, Q, 2)) == 4929 # Pair of Sevens
@test NLH.rank((7, 7, K, J, T)) == 4930 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 9)) == 4931 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 8)) == 4932 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 6)) == 4933 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 5)) == 4934 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 4)) == 4935 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 3)) == 4936 # Pair of Sevens
@test NLH.rank((7, 7, K, J, 2)) == 4937 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 9)) == 4938 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 8)) == 4939 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 6)) == 4940 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 5)) == 4941 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 4)) == 4942 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 3)) == 4943 # Pair of Sevens
@test NLH.rank((7, 7, K, T, 2)) == 4944 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 8)) == 4945 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 6)) == 4946 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 5)) == 4947 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 4)) == 4948 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 3)) == 4949 # Pair of Sevens
@test NLH.rank((7, 7, K, 9, 2)) == 4950 # Pair of Sevens
@test NLH.rank((7, 7, K, 8, 6)) == 4951 # Pair of Sevens
@test NLH.rank((7, 7, K, 8, 5)) == 4952 # Pair of Sevens
@test NLH.rank((7, 7, K, 8, 4)) == 4953 # Pair of Sevens
@test NLH.rank((7, 7, K, 8, 3)) == 4954 # Pair of Sevens
@test NLH.rank((7, 7, K, 8, 2)) == 4955 # Pair of Sevens
@test NLH.rank((7, 7, K, 6, 5)) == 4956 # Pair of Sevens
@test NLH.rank((7, 7, K, 6, 4)) == 4957 # Pair of Sevens
@test NLH.rank((7, 7, K, 6, 3)) == 4958 # Pair of Sevens
@test NLH.rank((7, 7, K, 6, 2)) == 4959 # Pair of Sevens
@test NLH.rank((7, 7, K, 5, 4)) == 4960 # Pair of Sevens
@test NLH.rank((7, 7, K, 5, 3)) == 4961 # Pair of Sevens
@test NLH.rank((7, 7, K, 5, 2)) == 4962 # Pair of Sevens
@test NLH.rank((7, 7, K, 4, 3)) == 4963 # Pair of Sevens
@test NLH.rank((7, 7, K, 4, 2)) == 4964 # Pair of Sevens
@test NLH.rank((7, 7, K, 3, 2)) == 4965 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, T)) == 4966 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 9)) == 4967 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 8)) == 4968 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 6)) == 4969 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 5)) == 4970 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 4)) == 4971 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 3)) == 4972 # Pair of Sevens
@test NLH.rank((7, 7, Q, J, 2)) == 4973 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 9)) == 4974 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 8)) == 4975 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 6)) == 4976 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 5)) == 4977 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 4)) == 4978 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 3)) == 4979 # Pair of Sevens
@test NLH.rank((7, 7, Q, T, 2)) == 4980 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 8)) == 4981 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 6)) == 4982 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 5)) == 4983 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 4)) == 4984 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 3)) == 4985 # Pair of Sevens
@test NLH.rank((7, 7, Q, 9, 2)) == 4986 # Pair of Sevens
@test NLH.rank((7, 7, Q, 8, 6)) == 4987 # Pair of Sevens
@test NLH.rank((7, 7, Q, 8, 5)) == 4988 # Pair of Sevens
@test NLH.rank((7, 7, Q, 8, 4)) == 4989 # Pair of Sevens
@test NLH.rank((7, 7, Q, 8, 3)) == 4990 # Pair of Sevens
@test NLH.rank((7, 7, Q, 8, 2)) == 4991 # Pair of Sevens
@test NLH.rank((7, 7, Q, 6, 5)) == 4992 # Pair of Sevens
@test NLH.rank((7, 7, Q, 6, 4)) == 4993 # Pair of Sevens
@test NLH.rank((7, 7, Q, 6, 3)) == 4994 # Pair of Sevens
@test NLH.rank((7, 7, Q, 6, 2)) == 4995 # Pair of Sevens
@test NLH.rank((7, 7, Q, 5, 4)) == 4996 # Pair of Sevens
@test NLH.rank((7, 7, Q, 5, 3)) == 4997 # Pair of Sevens
@test NLH.rank((7, 7, Q, 5, 2)) == 4998 # Pair of Sevens
@test NLH.rank((7, 7, Q, 4, 3)) == 4999 # Pair of Sevens
@test NLH.rank((7, 7, Q, 4, 2)) == 5000 # Pair of Sevens
@test NLH.rank((7, 7, Q, 3, 2)) == 5001 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 9)) == 5002 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 8)) == 5003 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 6)) == 5004 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 5)) == 5005 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 4)) == 5006 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 3)) == 5007 # Pair of Sevens
@test NLH.rank((7, 7, J, T, 2)) == 5008 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 8)) == 5009 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 6)) == 5010 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 5)) == 5011 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 4)) == 5012 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 3)) == 5013 # Pair of Sevens
@test NLH.rank((7, 7, J, 9, 2)) == 5014 # Pair of Sevens
@test NLH.rank((7, 7, J, 8, 6)) == 5015 # Pair of Sevens
@test NLH.rank((7, 7, J, 8, 5)) == 5016 # Pair of Sevens
@test NLH.rank((7, 7, J, 8, 4)) == 5017 # Pair of Sevens
@test NLH.rank((7, 7, J, 8, 3)) == 5018 # Pair of Sevens
@test NLH.rank((7, 7, J, 8, 2)) == 5019 # Pair of Sevens
@test NLH.rank((7, 7, J, 6, 5)) == 5020 # Pair of Sevens
@test NLH.rank((7, 7, J, 6, 4)) == 5021 # Pair of Sevens
@test NLH.rank((7, 7, J, 6, 3)) == 5022 # Pair of Sevens
@test NLH.rank((7, 7, J, 6, 2)) == 5023 # Pair of Sevens
@test NLH.rank((7, 7, J, 5, 4)) == 5024 # Pair of Sevens
@test NLH.rank((7, 7, J, 5, 3)) == 5025 # Pair of Sevens
@test NLH.rank((7, 7, J, 5, 2)) == 5026 # Pair of Sevens
@test NLH.rank((7, 7, J, 4, 3)) == 5027 # Pair of Sevens
@test NLH.rank((7, 7, J, 4, 2)) == 5028 # Pair of Sevens
@test NLH.rank((7, 7, J, 3, 2)) == 5029 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 8)) == 5030 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 6)) == 5031 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 5)) == 5032 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 4)) == 5033 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 3)) == 5034 # Pair of Sevens
@test NLH.rank((7, 7, T, 9, 2)) == 5035 # Pair of Sevens
@test NLH.rank((7, 7, T, 8, 6)) == 5036 # Pair of Sevens
@test NLH.rank((7, 7, T, 8, 5)) == 5037 # Pair of Sevens
@test NLH.rank((7, 7, T, 8, 4)) == 5038 # Pair of Sevens
@test NLH.rank((7, 7, T, 8, 3)) == 5039 # Pair of Sevens
@test NLH.rank((7, 7, T, 8, 2)) == 5040 # Pair of Sevens
@test NLH.rank((7, 7, T, 6, 5)) == 5041 # Pair of Sevens
@test NLH.rank((7, 7, T, 6, 4)) == 5042 # Pair of Sevens
@test NLH.rank((7, 7, T, 6, 3)) == 5043 # Pair of Sevens
@test NLH.rank((7, 7, T, 6, 2)) == 5044 # Pair of Sevens
@test NLH.rank((7, 7, T, 5, 4)) == 5045 # Pair of Sevens
@test NLH.rank((7, 7, T, 5, 3)) == 5046 # Pair of Sevens
@test NLH.rank((7, 7, T, 5, 2)) == 5047 # Pair of Sevens
@test NLH.rank((7, 7, T, 4, 3)) == 5048 # Pair of Sevens
@test NLH.rank((7, 7, T, 4, 2)) == 5049 # Pair of Sevens
@test NLH.rank((7, 7, T, 3, 2)) == 5050 # Pair of Sevens
@test NLH.rank((7, 7, 9, 8, 6)) == 5051 # Pair of Sevens
@test NLH.rank((7, 7, 9, 8, 5)) == 5052 # Pair of Sevens
@test NLH.rank((7, 7, 9, 8, 4)) == 5053 # Pair of Sevens
@test NLH.rank((7, 7, 9, 8, 3)) == 5054 # Pair of Sevens
@test NLH.rank((7, 7, 9, 8, 2)) == 5055 # Pair of Sevens
@test NLH.rank((7, 7, 9, 6, 5)) == 5056 # Pair of Sevens
@test NLH.rank((7, 7, 9, 6, 4)) == 5057 # Pair of Sevens
@test NLH.rank((7, 7, 9, 6, 3)) == 5058 # Pair of Sevens
@test NLH.rank((7, 7, 9, 6, 2)) == 5059 # Pair of Sevens
@test NLH.rank((7, 7, 9, 5, 4)) == 5060 # Pair of Sevens
@test NLH.rank((7, 7, 9, 5, 3)) == 5061 # Pair of Sevens
@test NLH.rank((7, 7, 9, 5, 2)) == 5062 # Pair of Sevens
@test NLH.rank((7, 7, 9, 4, 3)) == 5063 # Pair of Sevens
@test NLH.rank((7, 7, 9, 4, 2)) == 5064 # Pair of Sevens
@test NLH.rank((7, 7, 9, 3, 2)) == 5065 # Pair of Sevens
@test NLH.rank((7, 7, 8, 6, 5)) == 5066 # Pair of Sevens
@test NLH.rank((7, 7, 8, 6, 4)) == 5067 # Pair of Sevens
@test NLH.rank((7, 7, 8, 6, 3)) == 5068 # Pair of Sevens
@test NLH.rank((7, 7, 8, 6, 2)) == 5069 # Pair of Sevens
@test NLH.rank((7, 7, 8, 5, 4)) == 5070 # Pair of Sevens
@test NLH.rank((7, 7, 8, 5, 3)) == 5071 # Pair of Sevens
@test NLH.rank((7, 7, 8, 5, 2)) == 5072 # Pair of Sevens
@test NLH.rank((7, 7, 8, 4, 3)) == 5073 # Pair of Sevens
@test NLH.rank((7, 7, 8, 4, 2)) == 5074 # Pair of Sevens
@test NLH.rank((7, 7, 8, 3, 2)) == 5075 # Pair of Sevens
@test NLH.rank((7, 7, 6, 5, 4)) == 5076 # Pair of Sevens
@test NLH.rank((7, 7, 6, 5, 3)) == 5077 # Pair of Sevens
@test NLH.rank((7, 7, 6, 5, 2)) == 5078 # Pair of Sevens
@test NLH.rank((7, 7, 6, 4, 3)) == 5079 # Pair of Sevens
@test NLH.rank((7, 7, 6, 4, 2)) == 5080 # Pair of Sevens
@test NLH.rank((7, 7, 6, 3, 2)) == 5081 # Pair of Sevens
@test NLH.rank((7, 7, 5, 4, 3)) == 5082 # Pair of Sevens
@test NLH.rank((7, 7, 5, 4, 2)) == 5083 # Pair of Sevens
@test NLH.rank((7, 7, 5, 3, 2)) == 5084 # Pair of Sevens
@test NLH.rank((7, 7, 4, 3, 2)) == 5085 # Pair of Sevens
@test NLH.rank((6, 6, A, K, Q)) == 5086 # Pair of Sixes
@test NLH.rank((6, 6, A, K, J)) == 5087 # Pair of Sixes
@test NLH.rank((6, 6, A, K, T)) == 5088 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 9)) == 5089 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 8)) == 5090 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 7)) == 5091 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 5)) == 5092 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 4)) == 5093 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 3)) == 5094 # Pair of Sixes
@test NLH.rank((6, 6, A, K, 2)) == 5095 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, J)) == 5096 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, T)) == 5097 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 9)) == 5098 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 8)) == 5099 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 7)) == 5100 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 5)) == 5101 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 4)) == 5102 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 3)) == 5103 # Pair of Sixes
@test NLH.rank((6, 6, A, Q, 2)) == 5104 # Pair of Sixes
@test NLH.rank((6, 6, A, J, T)) == 5105 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 9)) == 5106 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 8)) == 5107 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 7)) == 5108 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 5)) == 5109 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 4)) == 5110 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 3)) == 5111 # Pair of Sixes
@test NLH.rank((6, 6, A, J, 2)) == 5112 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 9)) == 5113 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 8)) == 5114 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 7)) == 5115 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 5)) == 5116 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 4)) == 5117 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 3)) == 5118 # Pair of Sixes
@test NLH.rank((6, 6, A, T, 2)) == 5119 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 8)) == 5120 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 7)) == 5121 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 5)) == 5122 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 4)) == 5123 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 3)) == 5124 # Pair of Sixes
@test NLH.rank((6, 6, A, 9, 2)) == 5125 # Pair of Sixes
@test NLH.rank((6, 6, A, 8, 7)) == 5126 # Pair of Sixes
@test NLH.rank((6, 6, A, 8, 5)) == 5127 # Pair of Sixes
@test NLH.rank((6, 6, A, 8, 4)) == 5128 # Pair of Sixes
@test NLH.rank((6, 6, A, 8, 3)) == 5129 # Pair of Sixes
@test NLH.rank((6, 6, A, 8, 2)) == 5130 # Pair of Sixes
@test NLH.rank((6, 6, A, 7, 5)) == 5131 # Pair of Sixes
@test NLH.rank((6, 6, A, 7, 4)) == 5132 # Pair of Sixes
@test NLH.rank((6, 6, A, 7, 3)) == 5133 # Pair of Sixes
@test NLH.rank((6, 6, A, 7, 2)) == 5134 # Pair of Sixes
@test NLH.rank((6, 6, A, 5, 4)) == 5135 # Pair of Sixes
@test NLH.rank((6, 6, A, 5, 3)) == 5136 # Pair of Sixes
@test NLH.rank((6, 6, A, 5, 2)) == 5137 # Pair of Sixes
@test NLH.rank((6, 6, A, 4, 3)) == 5138 # Pair of Sixes
@test NLH.rank((6, 6, A, 4, 2)) == 5139 # Pair of Sixes
@test NLH.rank((6, 6, A, 3, 2)) == 5140 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, J)) == 5141 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, T)) == 5142 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 9)) == 5143 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 8)) == 5144 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 7)) == 5145 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 5)) == 5146 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 4)) == 5147 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 3)) == 5148 # Pair of Sixes
@test NLH.rank((6, 6, K, Q, 2)) == 5149 # Pair of Sixes
@test NLH.rank((6, 6, K, J, T)) == 5150 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 9)) == 5151 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 8)) == 5152 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 7)) == 5153 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 5)) == 5154 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 4)) == 5155 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 3)) == 5156 # Pair of Sixes
@test NLH.rank((6, 6, K, J, 2)) == 5157 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 9)) == 5158 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 8)) == 5159 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 7)) == 5160 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 5)) == 5161 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 4)) == 5162 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 3)) == 5163 # Pair of Sixes
@test NLH.rank((6, 6, K, T, 2)) == 5164 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 8)) == 5165 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 7)) == 5166 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 5)) == 5167 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 4)) == 5168 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 3)) == 5169 # Pair of Sixes
@test NLH.rank((6, 6, K, 9, 2)) == 5170 # Pair of Sixes
@test NLH.rank((6, 6, K, 8, 7)) == 5171 # Pair of Sixes
@test NLH.rank((6, 6, K, 8, 5)) == 5172 # Pair of Sixes
@test NLH.rank((6, 6, K, 8, 4)) == 5173 # Pair of Sixes
@test NLH.rank((6, 6, K, 8, 3)) == 5174 # Pair of Sixes
@test NLH.rank((6, 6, K, 8, 2)) == 5175 # Pair of Sixes
@test NLH.rank((6, 6, K, 7, 5)) == 5176 # Pair of Sixes
@test NLH.rank((6, 6, K, 7, 4)) == 5177 # Pair of Sixes
@test NLH.rank((6, 6, K, 7, 3)) == 5178 # Pair of Sixes
@test NLH.rank((6, 6, K, 7, 2)) == 5179 # Pair of Sixes
@test NLH.rank((6, 6, K, 5, 4)) == 5180 # Pair of Sixes
@test NLH.rank((6, 6, K, 5, 3)) == 5181 # Pair of Sixes
@test NLH.rank((6, 6, K, 5, 2)) == 5182 # Pair of Sixes
@test NLH.rank((6, 6, K, 4, 3)) == 5183 # Pair of Sixes
@test NLH.rank((6, 6, K, 4, 2)) == 5184 # Pair of Sixes
@test NLH.rank((6, 6, K, 3, 2)) == 5185 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, T)) == 5186 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 9)) == 5187 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 8)) == 5188 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 7)) == 5189 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 5)) == 5190 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 4)) == 5191 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 3)) == 5192 # Pair of Sixes
@test NLH.rank((6, 6, Q, J, 2)) == 5193 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 9)) == 5194 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 8)) == 5195 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 7)) == 5196 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 5)) == 5197 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 4)) == 5198 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 3)) == 5199 # Pair of Sixes
@test NLH.rank((6, 6, Q, T, 2)) == 5200 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 8)) == 5201 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 7)) == 5202 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 5)) == 5203 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 4)) == 5204 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 3)) == 5205 # Pair of Sixes
@test NLH.rank((6, 6, Q, 9, 2)) == 5206 # Pair of Sixes
@test NLH.rank((6, 6, Q, 8, 7)) == 5207 # Pair of Sixes
@test NLH.rank((6, 6, Q, 8, 5)) == 5208 # Pair of Sixes
@test NLH.rank((6, 6, Q, 8, 4)) == 5209 # Pair of Sixes
@test NLH.rank((6, 6, Q, 8, 3)) == 5210 # Pair of Sixes
@test NLH.rank((6, 6, Q, 8, 2)) == 5211 # Pair of Sixes
@test NLH.rank((6, 6, Q, 7, 5)) == 5212 # Pair of Sixes
@test NLH.rank((6, 6, Q, 7, 4)) == 5213 # Pair of Sixes
@test NLH.rank((6, 6, Q, 7, 3)) == 5214 # Pair of Sixes
@test NLH.rank((6, 6, Q, 7, 2)) == 5215 # Pair of Sixes
@test NLH.rank((6, 6, Q, 5, 4)) == 5216 # Pair of Sixes
@test NLH.rank((6, 6, Q, 5, 3)) == 5217 # Pair of Sixes
@test NLH.rank((6, 6, Q, 5, 2)) == 5218 # Pair of Sixes
@test NLH.rank((6, 6, Q, 4, 3)) == 5219 # Pair of Sixes
@test NLH.rank((6, 6, Q, 4, 2)) == 5220 # Pair of Sixes
@test NLH.rank((6, 6, Q, 3, 2)) == 5221 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 9)) == 5222 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 8)) == 5223 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 7)) == 5224 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 5)) == 5225 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 4)) == 5226 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 3)) == 5227 # Pair of Sixes
@test NLH.rank((6, 6, J, T, 2)) == 5228 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 8)) == 5229 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 7)) == 5230 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 5)) == 5231 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 4)) == 5232 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 3)) == 5233 # Pair of Sixes
@test NLH.rank((6, 6, J, 9, 2)) == 5234 # Pair of Sixes
@test NLH.rank((6, 6, J, 8, 7)) == 5235 # Pair of Sixes
@test NLH.rank((6, 6, J, 8, 5)) == 5236 # Pair of Sixes
@test NLH.rank((6, 6, J, 8, 4)) == 5237 # Pair of Sixes
@test NLH.rank((6, 6, J, 8, 3)) == 5238 # Pair of Sixes
@test NLH.rank((6, 6, J, 8, 2)) == 5239 # Pair of Sixes
@test NLH.rank((6, 6, J, 7, 5)) == 5240 # Pair of Sixes
@test NLH.rank((6, 6, J, 7, 4)) == 5241 # Pair of Sixes
@test NLH.rank((6, 6, J, 7, 3)) == 5242 # Pair of Sixes
@test NLH.rank((6, 6, J, 7, 2)) == 5243 # Pair of Sixes
@test NLH.rank((6, 6, J, 5, 4)) == 5244 # Pair of Sixes
@test NLH.rank((6, 6, J, 5, 3)) == 5245 # Pair of Sixes
@test NLH.rank((6, 6, J, 5, 2)) == 5246 # Pair of Sixes
@test NLH.rank((6, 6, J, 4, 3)) == 5247 # Pair of Sixes
@test NLH.rank((6, 6, J, 4, 2)) == 5248 # Pair of Sixes
@test NLH.rank((6, 6, J, 3, 2)) == 5249 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 8)) == 5250 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 7)) == 5251 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 5)) == 5252 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 4)) == 5253 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 3)) == 5254 # Pair of Sixes
@test NLH.rank((6, 6, T, 9, 2)) == 5255 # Pair of Sixes
@test NLH.rank((6, 6, T, 8, 7)) == 5256 # Pair of Sixes
@test NLH.rank((6, 6, T, 8, 5)) == 5257 # Pair of Sixes
@test NLH.rank((6, 6, T, 8, 4)) == 5258 # Pair of Sixes
@test NLH.rank((6, 6, T, 8, 3)) == 5259 # Pair of Sixes
@test NLH.rank((6, 6, T, 8, 2)) == 5260 # Pair of Sixes
@test NLH.rank((6, 6, T, 7, 5)) == 5261 # Pair of Sixes
@test NLH.rank((6, 6, T, 7, 4)) == 5262 # Pair of Sixes
@test NLH.rank((6, 6, T, 7, 3)) == 5263 # Pair of Sixes
@test NLH.rank((6, 6, T, 7, 2)) == 5264 # Pair of Sixes
@test NLH.rank((6, 6, T, 5, 4)) == 5265 # Pair of Sixes
@test NLH.rank((6, 6, T, 5, 3)) == 5266 # Pair of Sixes
@test NLH.rank((6, 6, T, 5, 2)) == 5267 # Pair of Sixes
@test NLH.rank((6, 6, T, 4, 3)) == 5268 # Pair of Sixes
@test NLH.rank((6, 6, T, 4, 2)) == 5269 # Pair of Sixes
@test NLH.rank((6, 6, T, 3, 2)) == 5270 # Pair of Sixes
@test NLH.rank((6, 6, 9, 8, 7)) == 5271 # Pair of Sixes
@test NLH.rank((6, 6, 9, 8, 5)) == 5272 # Pair of Sixes
@test NLH.rank((6, 6, 9, 8, 4)) == 5273 # Pair of Sixes
@test NLH.rank((6, 6, 9, 8, 3)) == 5274 # Pair of Sixes
@test NLH.rank((6, 6, 9, 8, 2)) == 5275 # Pair of Sixes
@test NLH.rank((6, 6, 9, 7, 5)) == 5276 # Pair of Sixes
@test NLH.rank((6, 6, 9, 7, 4)) == 5277 # Pair of Sixes
@test NLH.rank((6, 6, 9, 7, 3)) == 5278 # Pair of Sixes
@test NLH.rank((6, 6, 9, 7, 2)) == 5279 # Pair of Sixes
@test NLH.rank((6, 6, 9, 5, 4)) == 5280 # Pair of Sixes
@test NLH.rank((6, 6, 9, 5, 3)) == 5281 # Pair of Sixes
@test NLH.rank((6, 6, 9, 5, 2)) == 5282 # Pair of Sixes
@test NLH.rank((6, 6, 9, 4, 3)) == 5283 # Pair of Sixes
@test NLH.rank((6, 6, 9, 4, 2)) == 5284 # Pair of Sixes
@test NLH.rank((6, 6, 9, 3, 2)) == 5285 # Pair of Sixes
@test NLH.rank((6, 6, 8, 7, 5)) == 5286 # Pair of Sixes
@test NLH.rank((6, 6, 8, 7, 4)) == 5287 # Pair of Sixes
@test NLH.rank((6, 6, 8, 7, 3)) == 5288 # Pair of Sixes
@test NLH.rank((6, 6, 8, 7, 2)) == 5289 # Pair of Sixes
@test NLH.rank((6, 6, 8, 5, 4)) == 5290 # Pair of Sixes
@test NLH.rank((6, 6, 8, 5, 3)) == 5291 # Pair of Sixes
@test NLH.rank((6, 6, 8, 5, 2)) == 5292 # Pair of Sixes
@test NLH.rank((6, 6, 8, 4, 3)) == 5293 # Pair of Sixes
@test NLH.rank((6, 6, 8, 4, 2)) == 5294 # Pair of Sixes
@test NLH.rank((6, 6, 8, 3, 2)) == 5295 # Pair of Sixes
@test NLH.rank((6, 6, 7, 5, 4)) == 5296 # Pair of Sixes
@test NLH.rank((6, 6, 7, 5, 3)) == 5297 # Pair of Sixes
@test NLH.rank((6, 6, 7, 5, 2)) == 5298 # Pair of Sixes
@test NLH.rank((6, 6, 7, 4, 3)) == 5299 # Pair of Sixes
@test NLH.rank((6, 6, 7, 4, 2)) == 5300 # Pair of Sixes
@test NLH.rank((6, 6, 7, 3, 2)) == 5301 # Pair of Sixes
@test NLH.rank((6, 6, 5, 4, 3)) == 5302 # Pair of Sixes
@test NLH.rank((6, 6, 5, 4, 2)) == 5303 # Pair of Sixes
@test NLH.rank((6, 6, 5, 3, 2)) == 5304 # Pair of Sixes
@test NLH.rank((6, 6, 4, 3, 2)) == 5305 # Pair of Sixes
@test NLH.rank((5, 5, A, K, Q)) == 5306 # Pair of Fives
@test NLH.rank((5, 5, A, K, J)) == 5307 # Pair of Fives
@test NLH.rank((5, 5, A, K, T)) == 5308 # Pair of Fives
@test NLH.rank((5, 5, A, K, 9)) == 5309 # Pair of Fives
@test NLH.rank((5, 5, A, K, 8)) == 5310 # Pair of Fives
@test NLH.rank((5, 5, A, K, 7)) == 5311 # Pair of Fives
@test NLH.rank((5, 5, A, K, 6)) == 5312 # Pair of Fives
@test NLH.rank((5, 5, A, K, 4)) == 5313 # Pair of Fives
@test NLH.rank((5, 5, A, K, 3)) == 5314 # Pair of Fives
@test NLH.rank((5, 5, A, K, 2)) == 5315 # Pair of Fives
@test NLH.rank((5, 5, A, Q, J)) == 5316 # Pair of Fives
@test NLH.rank((5, 5, A, Q, T)) == 5317 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 9)) == 5318 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 8)) == 5319 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 7)) == 5320 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 6)) == 5321 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 4)) == 5322 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 3)) == 5323 # Pair of Fives
@test NLH.rank((5, 5, A, Q, 2)) == 5324 # Pair of Fives
@test NLH.rank((5, 5, A, J, T)) == 5325 # Pair of Fives
@test NLH.rank((5, 5, A, J, 9)) == 5326 # Pair of Fives
@test NLH.rank((5, 5, A, J, 8)) == 5327 # Pair of Fives
@test NLH.rank((5, 5, A, J, 7)) == 5328 # Pair of Fives
@test NLH.rank((5, 5, A, J, 6)) == 5329 # Pair of Fives
@test NLH.rank((5, 5, A, J, 4)) == 5330 # Pair of Fives
@test NLH.rank((5, 5, A, J, 3)) == 5331 # Pair of Fives
@test NLH.rank((5, 5, A, J, 2)) == 5332 # Pair of Fives
@test NLH.rank((5, 5, A, T, 9)) == 5333 # Pair of Fives
@test NLH.rank((5, 5, A, T, 8)) == 5334 # Pair of Fives
@test NLH.rank((5, 5, A, T, 7)) == 5335 # Pair of Fives
@test NLH.rank((5, 5, A, T, 6)) == 5336 # Pair of Fives
@test NLH.rank((5, 5, A, T, 4)) == 5337 # Pair of Fives
@test NLH.rank((5, 5, A, T, 3)) == 5338 # Pair of Fives
@test NLH.rank((5, 5, A, T, 2)) == 5339 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 8)) == 5340 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 7)) == 5341 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 6)) == 5342 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 4)) == 5343 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 3)) == 5344 # Pair of Fives
@test NLH.rank((5, 5, A, 9, 2)) == 5345 # Pair of Fives
@test NLH.rank((5, 5, A, 8, 7)) == 5346 # Pair of Fives
@test NLH.rank((5, 5, A, 8, 6)) == 5347 # Pair of Fives
@test NLH.rank((5, 5, A, 8, 4)) == 5348 # Pair of Fives
@test NLH.rank((5, 5, A, 8, 3)) == 5349 # Pair of Fives
@test NLH.rank((5, 5, A, 8, 2)) == 5350 # Pair of Fives
@test NLH.rank((5, 5, A, 7, 6)) == 5351 # Pair of Fives
@test NLH.rank((5, 5, A, 7, 4)) == 5352 # Pair of Fives
@test NLH.rank((5, 5, A, 7, 3)) == 5353 # Pair of Fives
@test NLH.rank((5, 5, A, 7, 2)) == 5354 # Pair of Fives
@test NLH.rank((5, 5, A, 6, 4)) == 5355 # Pair of Fives
@test NLH.rank((5, 5, A, 6, 3)) == 5356 # Pair of Fives
@test NLH.rank((5, 5, A, 6, 2)) == 5357 # Pair of Fives
@test NLH.rank((5, 5, A, 4, 3)) == 5358 # Pair of Fives
@test NLH.rank((5, 5, A, 4, 2)) == 5359 # Pair of Fives
@test NLH.rank((5, 5, A, 3, 2)) == 5360 # Pair of Fives
@test NLH.rank((5, 5, K, Q, J)) == 5361 # Pair of Fives
@test NLH.rank((5, 5, K, Q, T)) == 5362 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 9)) == 5363 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 8)) == 5364 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 7)) == 5365 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 6)) == 5366 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 4)) == 5367 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 3)) == 5368 # Pair of Fives
@test NLH.rank((5, 5, K, Q, 2)) == 5369 # Pair of Fives
@test NLH.rank((5, 5, K, J, T)) == 5370 # Pair of Fives
@test NLH.rank((5, 5, K, J, 9)) == 5371 # Pair of Fives
@test NLH.rank((5, 5, K, J, 8)) == 5372 # Pair of Fives
@test NLH.rank((5, 5, K, J, 7)) == 5373 # Pair of Fives
@test NLH.rank((5, 5, K, J, 6)) == 5374 # Pair of Fives
@test NLH.rank((5, 5, K, J, 4)) == 5375 # Pair of Fives
@test NLH.rank((5, 5, K, J, 3)) == 5376 # Pair of Fives
@test NLH.rank((5, 5, K, J, 2)) == 5377 # Pair of Fives
@test NLH.rank((5, 5, K, T, 9)) == 5378 # Pair of Fives
@test NLH.rank((5, 5, K, T, 8)) == 5379 # Pair of Fives
@test NLH.rank((5, 5, K, T, 7)) == 5380 # Pair of Fives
@test NLH.rank((5, 5, K, T, 6)) == 5381 # Pair of Fives
@test NLH.rank((5, 5, K, T, 4)) == 5382 # Pair of Fives
@test NLH.rank((5, 5, K, T, 3)) == 5383 # Pair of Fives
@test NLH.rank((5, 5, K, T, 2)) == 5384 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 8)) == 5385 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 7)) == 5386 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 6)) == 5387 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 4)) == 5388 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 3)) == 5389 # Pair of Fives
@test NLH.rank((5, 5, K, 9, 2)) == 5390 # Pair of Fives
@test NLH.rank((5, 5, K, 8, 7)) == 5391 # Pair of Fives
@test NLH.rank((5, 5, K, 8, 6)) == 5392 # Pair of Fives
@test NLH.rank((5, 5, K, 8, 4)) == 5393 # Pair of Fives
@test NLH.rank((5, 5, K, 8, 3)) == 5394 # Pair of Fives
@test NLH.rank((5, 5, K, 8, 2)) == 5395 # Pair of Fives
@test NLH.rank((5, 5, K, 7, 6)) == 5396 # Pair of Fives
@test NLH.rank((5, 5, K, 7, 4)) == 5397 # Pair of Fives
@test NLH.rank((5, 5, K, 7, 3)) == 5398 # Pair of Fives
@test NLH.rank((5, 5, K, 7, 2)) == 5399 # Pair of Fives
@test NLH.rank((5, 5, K, 6, 4)) == 5400 # Pair of Fives
@test NLH.rank((5, 5, K, 6, 3)) == 5401 # Pair of Fives
@test NLH.rank((5, 5, K, 6, 2)) == 5402 # Pair of Fives
@test NLH.rank((5, 5, K, 4, 3)) == 5403 # Pair of Fives
@test NLH.rank((5, 5, K, 4, 2)) == 5404 # Pair of Fives
@test NLH.rank((5, 5, K, 3, 2)) == 5405 # Pair of Fives
@test NLH.rank((5, 5, Q, J, T)) == 5406 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 9)) == 5407 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 8)) == 5408 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 7)) == 5409 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 6)) == 5410 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 4)) == 5411 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 3)) == 5412 # Pair of Fives
@test NLH.rank((5, 5, Q, J, 2)) == 5413 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 9)) == 5414 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 8)) == 5415 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 7)) == 5416 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 6)) == 5417 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 4)) == 5418 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 3)) == 5419 # Pair of Fives
@test NLH.rank((5, 5, Q, T, 2)) == 5420 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 8)) == 5421 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 7)) == 5422 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 6)) == 5423 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 4)) == 5424 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 3)) == 5425 # Pair of Fives
@test NLH.rank((5, 5, Q, 9, 2)) == 5426 # Pair of Fives
@test NLH.rank((5, 5, Q, 8, 7)) == 5427 # Pair of Fives
@test NLH.rank((5, 5, Q, 8, 6)) == 5428 # Pair of Fives
@test NLH.rank((5, 5, Q, 8, 4)) == 5429 # Pair of Fives
@test NLH.rank((5, 5, Q, 8, 3)) == 5430 # Pair of Fives
@test NLH.rank((5, 5, Q, 8, 2)) == 5431 # Pair of Fives
@test NLH.rank((5, 5, Q, 7, 6)) == 5432 # Pair of Fives
@test NLH.rank((5, 5, Q, 7, 4)) == 5433 # Pair of Fives
@test NLH.rank((5, 5, Q, 7, 3)) == 5434 # Pair of Fives
@test NLH.rank((5, 5, Q, 7, 2)) == 5435 # Pair of Fives
@test NLH.rank((5, 5, Q, 6, 4)) == 5436 # Pair of Fives
@test NLH.rank((5, 5, Q, 6, 3)) == 5437 # Pair of Fives
@test NLH.rank((5, 5, Q, 6, 2)) == 5438 # Pair of Fives
@test NLH.rank((5, 5, Q, 4, 3)) == 5439 # Pair of Fives
@test NLH.rank((5, 5, Q, 4, 2)) == 5440 # Pair of Fives
@test NLH.rank((5, 5, Q, 3, 2)) == 5441 # Pair of Fives
@test NLH.rank((5, 5, J, T, 9)) == 5442 # Pair of Fives
@test NLH.rank((5, 5, J, T, 8)) == 5443 # Pair of Fives
@test NLH.rank((5, 5, J, T, 7)) == 5444 # Pair of Fives
@test NLH.rank((5, 5, J, T, 6)) == 5445 # Pair of Fives
@test NLH.rank((5, 5, J, T, 4)) == 5446 # Pair of Fives
@test NLH.rank((5, 5, J, T, 3)) == 5447 # Pair of Fives
@test NLH.rank((5, 5, J, T, 2)) == 5448 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 8)) == 5449 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 7)) == 5450 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 6)) == 5451 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 4)) == 5452 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 3)) == 5453 # Pair of Fives
@test NLH.rank((5, 5, J, 9, 2)) == 5454 # Pair of Fives
@test NLH.rank((5, 5, J, 8, 7)) == 5455 # Pair of Fives
@test NLH.rank((5, 5, J, 8, 6)) == 5456 # Pair of Fives
@test NLH.rank((5, 5, J, 8, 4)) == 5457 # Pair of Fives
@test NLH.rank((5, 5, J, 8, 3)) == 5458 # Pair of Fives
@test NLH.rank((5, 5, J, 8, 2)) == 5459 # Pair of Fives
@test NLH.rank((5, 5, J, 7, 6)) == 5460 # Pair of Fives
@test NLH.rank((5, 5, J, 7, 4)) == 5461 # Pair of Fives
@test NLH.rank((5, 5, J, 7, 3)) == 5462 # Pair of Fives
@test NLH.rank((5, 5, J, 7, 2)) == 5463 # Pair of Fives
@test NLH.rank((5, 5, J, 6, 4)) == 5464 # Pair of Fives
@test NLH.rank((5, 5, J, 6, 3)) == 5465 # Pair of Fives
@test NLH.rank((5, 5, J, 6, 2)) == 5466 # Pair of Fives
@test NLH.rank((5, 5, J, 4, 3)) == 5467 # Pair of Fives
@test NLH.rank((5, 5, J, 4, 2)) == 5468 # Pair of Fives
@test NLH.rank((5, 5, J, 3, 2)) == 5469 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 8)) == 5470 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 7)) == 5471 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 6)) == 5472 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 4)) == 5473 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 3)) == 5474 # Pair of Fives
@test NLH.rank((5, 5, T, 9, 2)) == 5475 # Pair of Fives
@test NLH.rank((5, 5, T, 8, 7)) == 5476 # Pair of Fives
@test NLH.rank((5, 5, T, 8, 6)) == 5477 # Pair of Fives
@test NLH.rank((5, 5, T, 8, 4)) == 5478 # Pair of Fives
@test NLH.rank((5, 5, T, 8, 3)) == 5479 # Pair of Fives
@test NLH.rank((5, 5, T, 8, 2)) == 5480 # Pair of Fives
@test NLH.rank((5, 5, T, 7, 6)) == 5481 # Pair of Fives
@test NLH.rank((5, 5, T, 7, 4)) == 5482 # Pair of Fives
@test NLH.rank((5, 5, T, 7, 3)) == 5483 # Pair of Fives
@test NLH.rank((5, 5, T, 7, 2)) == 5484 # Pair of Fives
@test NLH.rank((5, 5, T, 6, 4)) == 5485 # Pair of Fives
@test NLH.rank((5, 5, T, 6, 3)) == 5486 # Pair of Fives
@test NLH.rank((5, 5, T, 6, 2)) == 5487 # Pair of Fives
@test NLH.rank((5, 5, T, 4, 3)) == 5488 # Pair of Fives
@test NLH.rank((5, 5, T, 4, 2)) == 5489 # Pair of Fives
@test NLH.rank((5, 5, T, 3, 2)) == 5490 # Pair of Fives
@test NLH.rank((5, 5, 9, 8, 7)) == 5491 # Pair of Fives
@test NLH.rank((5, 5, 9, 8, 6)) == 5492 # Pair of Fives
@test NLH.rank((5, 5, 9, 8, 4)) == 5493 # Pair of Fives
@test NLH.rank((5, 5, 9, 8, 3)) == 5494 # Pair of Fives
@test NLH.rank((5, 5, 9, 8, 2)) == 5495 # Pair of Fives
@test NLH.rank((5, 5, 9, 7, 6)) == 5496 # Pair of Fives
@test NLH.rank((5, 5, 9, 7, 4)) == 5497 # Pair of Fives
@test NLH.rank((5, 5, 9, 7, 3)) == 5498 # Pair of Fives
@test NLH.rank((5, 5, 9, 7, 2)) == 5499 # Pair of Fives
@test NLH.rank((5, 5, 9, 6, 4)) == 5500 # Pair of Fives
@test NLH.rank((5, 5, 9, 6, 3)) == 5501 # Pair of Fives
@test NLH.rank((5, 5, 9, 6, 2)) == 5502 # Pair of Fives
@test NLH.rank((5, 5, 9, 4, 3)) == 5503 # Pair of Fives
@test NLH.rank((5, 5, 9, 4, 2)) == 5504 # Pair of Fives
@test NLH.rank((5, 5, 9, 3, 2)) == 5505 # Pair of Fives
@test NLH.rank((5, 5, 8, 7, 6)) == 5506 # Pair of Fives
@test NLH.rank((5, 5, 8, 7, 4)) == 5507 # Pair of Fives
@test NLH.rank((5, 5, 8, 7, 3)) == 5508 # Pair of Fives
@test NLH.rank((5, 5, 8, 7, 2)) == 5509 # Pair of Fives
@test NLH.rank((5, 5, 8, 6, 4)) == 5510 # Pair of Fives
@test NLH.rank((5, 5, 8, 6, 3)) == 5511 # Pair of Fives
@test NLH.rank((5, 5, 8, 6, 2)) == 5512 # Pair of Fives
@test NLH.rank((5, 5, 8, 4, 3)) == 5513 # Pair of Fives
@test NLH.rank((5, 5, 8, 4, 2)) == 5514 # Pair of Fives
@test NLH.rank((5, 5, 8, 3, 2)) == 5515 # Pair of Fives
@test NLH.rank((5, 5, 7, 6, 4)) == 5516 # Pair of Fives
@test NLH.rank((5, 5, 7, 6, 3)) == 5517 # Pair of Fives
@test NLH.rank((5, 5, 7, 6, 2)) == 5518 # Pair of Fives
@test NLH.rank((5, 5, 7, 4, 3)) == 5519 # Pair of Fives
@test NLH.rank((5, 5, 7, 4, 2)) == 5520 # Pair of Fives
@test NLH.rank((5, 5, 7, 3, 2)) == 5521 # Pair of Fives
@test NLH.rank((5, 5, 6, 4, 3)) == 5522 # Pair of Fives
@test NLH.rank((5, 5, 6, 4, 2)) == 5523 # Pair of Fives
@test NLH.rank((5, 5, 6, 3, 2)) == 5524 # Pair of Fives
@test NLH.rank((5, 5, 4, 3, 2)) == 5525 # Pair of Fives
@test NLH.rank((4, 4, A, K, Q)) == 5526 # Pair of Fours
@test NLH.rank((4, 4, A, K, J)) == 5527 # Pair of Fours
@test NLH.rank((4, 4, A, K, T)) == 5528 # Pair of Fours
@test NLH.rank((4, 4, A, K, 9)) == 5529 # Pair of Fours
@test NLH.rank((4, 4, A, K, 8)) == 5530 # Pair of Fours
@test NLH.rank((4, 4, A, K, 7)) == 5531 # Pair of Fours
@test NLH.rank((4, 4, A, K, 6)) == 5532 # Pair of Fours
@test NLH.rank((4, 4, A, K, 5)) == 5533 # Pair of Fours
@test NLH.rank((4, 4, A, K, 3)) == 5534 # Pair of Fours
@test NLH.rank((4, 4, A, K, 2)) == 5535 # Pair of Fours
@test NLH.rank((4, 4, A, Q, J)) == 5536 # Pair of Fours
@test NLH.rank((4, 4, A, Q, T)) == 5537 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 9)) == 5538 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 8)) == 5539 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 7)) == 5540 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 6)) == 5541 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 5)) == 5542 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 3)) == 5543 # Pair of Fours
@test NLH.rank((4, 4, A, Q, 2)) == 5544 # Pair of Fours
@test NLH.rank((4, 4, A, J, T)) == 5545 # Pair of Fours
@test NLH.rank((4, 4, A, J, 9)) == 5546 # Pair of Fours
@test NLH.rank((4, 4, A, J, 8)) == 5547 # Pair of Fours
@test NLH.rank((4, 4, A, J, 7)) == 5548 # Pair of Fours
@test NLH.rank((4, 4, A, J, 6)) == 5549 # Pair of Fours
@test NLH.rank((4, 4, A, J, 5)) == 5550 # Pair of Fours
@test NLH.rank((4, 4, A, J, 3)) == 5551 # Pair of Fours
@test NLH.rank((4, 4, A, J, 2)) == 5552 # Pair of Fours
@test NLH.rank((4, 4, A, T, 9)) == 5553 # Pair of Fours
@test NLH.rank((4, 4, A, T, 8)) == 5554 # Pair of Fours
@test NLH.rank((4, 4, A, T, 7)) == 5555 # Pair of Fours
@test NLH.rank((4, 4, A, T, 6)) == 5556 # Pair of Fours
@test NLH.rank((4, 4, A, T, 5)) == 5557 # Pair of Fours
@test NLH.rank((4, 4, A, T, 3)) == 5558 # Pair of Fours
@test NLH.rank((4, 4, A, T, 2)) == 5559 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 8)) == 5560 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 7)) == 5561 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 6)) == 5562 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 5)) == 5563 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 3)) == 5564 # Pair of Fours
@test NLH.rank((4, 4, A, 9, 2)) == 5565 # Pair of Fours
@test NLH.rank((4, 4, A, 8, 7)) == 5566 # Pair of Fours
@test NLH.rank((4, 4, A, 8, 6)) == 5567 # Pair of Fours
@test NLH.rank((4, 4, A, 8, 5)) == 5568 # Pair of Fours
@test NLH.rank((4, 4, A, 8, 3)) == 5569 # Pair of Fours
@test NLH.rank((4, 4, A, 8, 2)) == 5570 # Pair of Fours
@test NLH.rank((4, 4, A, 7, 6)) == 5571 # Pair of Fours
@test NLH.rank((4, 4, A, 7, 5)) == 5572 # Pair of Fours
@test NLH.rank((4, 4, A, 7, 3)) == 5573 # Pair of Fours
@test NLH.rank((4, 4, A, 7, 2)) == 5574 # Pair of Fours
@test NLH.rank((4, 4, A, 6, 5)) == 5575 # Pair of Fours
@test NLH.rank((4, 4, A, 6, 3)) == 5576 # Pair of Fours
@test NLH.rank((4, 4, A, 6, 2)) == 5577 # Pair of Fours
@test NLH.rank((4, 4, A, 5, 3)) == 5578 # Pair of Fours
@test NLH.rank((4, 4, A, 5, 2)) == 5579 # Pair of Fours
@test NLH.rank((4, 4, A, 3, 2)) == 5580 # Pair of Fours
@test NLH.rank((4, 4, K, Q, J)) == 5581 # Pair of Fours
@test NLH.rank((4, 4, K, Q, T)) == 5582 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 9)) == 5583 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 8)) == 5584 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 7)) == 5585 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 6)) == 5586 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 5)) == 5587 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 3)) == 5588 # Pair of Fours
@test NLH.rank((4, 4, K, Q, 2)) == 5589 # Pair of Fours
@test NLH.rank((4, 4, K, J, T)) == 5590 # Pair of Fours
@test NLH.rank((4, 4, K, J, 9)) == 5591 # Pair of Fours
@test NLH.rank((4, 4, K, J, 8)) == 5592 # Pair of Fours
@test NLH.rank((4, 4, K, J, 7)) == 5593 # Pair of Fours
@test NLH.rank((4, 4, K, J, 6)) == 5594 # Pair of Fours
@test NLH.rank((4, 4, K, J, 5)) == 5595 # Pair of Fours
@test NLH.rank((4, 4, K, J, 3)) == 5596 # Pair of Fours
@test NLH.rank((4, 4, K, J, 2)) == 5597 # Pair of Fours
@test NLH.rank((4, 4, K, T, 9)) == 5598 # Pair of Fours
@test NLH.rank((4, 4, K, T, 8)) == 5599 # Pair of Fours
@test NLH.rank((4, 4, K, T, 7)) == 5600 # Pair of Fours
@test NLH.rank((4, 4, K, T, 6)) == 5601 # Pair of Fours
@test NLH.rank((4, 4, K, T, 5)) == 5602 # Pair of Fours
@test NLH.rank((4, 4, K, T, 3)) == 5603 # Pair of Fours
@test NLH.rank((4, 4, K, T, 2)) == 5604 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 8)) == 5605 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 7)) == 5606 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 6)) == 5607 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 5)) == 5608 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 3)) == 5609 # Pair of Fours
@test NLH.rank((4, 4, K, 9, 2)) == 5610 # Pair of Fours
@test NLH.rank((4, 4, K, 8, 7)) == 5611 # Pair of Fours
@test NLH.rank((4, 4, K, 8, 6)) == 5612 # Pair of Fours
@test NLH.rank((4, 4, K, 8, 5)) == 5613 # Pair of Fours
@test NLH.rank((4, 4, K, 8, 3)) == 5614 # Pair of Fours
@test NLH.rank((4, 4, K, 8, 2)) == 5615 # Pair of Fours
@test NLH.rank((4, 4, K, 7, 6)) == 5616 # Pair of Fours
@test NLH.rank((4, 4, K, 7, 5)) == 5617 # Pair of Fours
@test NLH.rank((4, 4, K, 7, 3)) == 5618 # Pair of Fours
@test NLH.rank((4, 4, K, 7, 2)) == 5619 # Pair of Fours
@test NLH.rank((4, 4, K, 6, 5)) == 5620 # Pair of Fours
@test NLH.rank((4, 4, K, 6, 3)) == 5621 # Pair of Fours
@test NLH.rank((4, 4, K, 6, 2)) == 5622 # Pair of Fours
@test NLH.rank((4, 4, K, 5, 3)) == 5623 # Pair of Fours
@test NLH.rank((4, 4, K, 5, 2)) == 5624 # Pair of Fours
@test NLH.rank((4, 4, K, 3, 2)) == 5625 # Pair of Fours
@test NLH.rank((4, 4, Q, J, T)) == 5626 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 9)) == 5627 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 8)) == 5628 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 7)) == 5629 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 6)) == 5630 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 5)) == 5631 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 3)) == 5632 # Pair of Fours
@test NLH.rank((4, 4, Q, J, 2)) == 5633 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 9)) == 5634 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 8)) == 5635 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 7)) == 5636 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 6)) == 5637 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 5)) == 5638 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 3)) == 5639 # Pair of Fours
@test NLH.rank((4, 4, Q, T, 2)) == 5640 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 8)) == 5641 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 7)) == 5642 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 6)) == 5643 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 5)) == 5644 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 3)) == 5645 # Pair of Fours
@test NLH.rank((4, 4, Q, 9, 2)) == 5646 # Pair of Fours
@test NLH.rank((4, 4, Q, 8, 7)) == 5647 # Pair of Fours
@test NLH.rank((4, 4, Q, 8, 6)) == 5648 # Pair of Fours
@test NLH.rank((4, 4, Q, 8, 5)) == 5649 # Pair of Fours
@test NLH.rank((4, 4, Q, 8, 3)) == 5650 # Pair of Fours
@test NLH.rank((4, 4, Q, 8, 2)) == 5651 # Pair of Fours
@test NLH.rank((4, 4, Q, 7, 6)) == 5652 # Pair of Fours
@test NLH.rank((4, 4, Q, 7, 5)) == 5653 # Pair of Fours
@test NLH.rank((4, 4, Q, 7, 3)) == 5654 # Pair of Fours
@test NLH.rank((4, 4, Q, 7, 2)) == 5655 # Pair of Fours
@test NLH.rank((4, 4, Q, 6, 5)) == 5656 # Pair of Fours
@test NLH.rank((4, 4, Q, 6, 3)) == 5657 # Pair of Fours
@test NLH.rank((4, 4, Q, 6, 2)) == 5658 # Pair of Fours
@test NLH.rank((4, 4, Q, 5, 3)) == 5659 # Pair of Fours
@test NLH.rank((4, 4, Q, 5, 2)) == 5660 # Pair of Fours
@test NLH.rank((4, 4, Q, 3, 2)) == 5661 # Pair of Fours
@test NLH.rank((4, 4, J, T, 9)) == 5662 # Pair of Fours
@test NLH.rank((4, 4, J, T, 8)) == 5663 # Pair of Fours
@test NLH.rank((4, 4, J, T, 7)) == 5664 # Pair of Fours
@test NLH.rank((4, 4, J, T, 6)) == 5665 # Pair of Fours
@test NLH.rank((4, 4, J, T, 5)) == 5666 # Pair of Fours
@test NLH.rank((4, 4, J, T, 3)) == 5667 # Pair of Fours
@test NLH.rank((4, 4, J, T, 2)) == 5668 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 8)) == 5669 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 7)) == 5670 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 6)) == 5671 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 5)) == 5672 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 3)) == 5673 # Pair of Fours
@test NLH.rank((4, 4, J, 9, 2)) == 5674 # Pair of Fours
@test NLH.rank((4, 4, J, 8, 7)) == 5675 # Pair of Fours
@test NLH.rank((4, 4, J, 8, 6)) == 5676 # Pair of Fours
@test NLH.rank((4, 4, J, 8, 5)) == 5677 # Pair of Fours
@test NLH.rank((4, 4, J, 8, 3)) == 5678 # Pair of Fours
@test NLH.rank((4, 4, J, 8, 2)) == 5679 # Pair of Fours
@test NLH.rank((4, 4, J, 7, 6)) == 5680 # Pair of Fours
@test NLH.rank((4, 4, J, 7, 5)) == 5681 # Pair of Fours
@test NLH.rank((4, 4, J, 7, 3)) == 5682 # Pair of Fours
@test NLH.rank((4, 4, J, 7, 2)) == 5683 # Pair of Fours
@test NLH.rank((4, 4, J, 6, 5)) == 5684 # Pair of Fours
@test NLH.rank((4, 4, J, 6, 3)) == 5685 # Pair of Fours
@test NLH.rank((4, 4, J, 6, 2)) == 5686 # Pair of Fours
@test NLH.rank((4, 4, J, 5, 3)) == 5687 # Pair of Fours
@test NLH.rank((4, 4, J, 5, 2)) == 5688 # Pair of Fours
@test NLH.rank((4, 4, J, 3, 2)) == 5689 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 8)) == 5690 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 7)) == 5691 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 6)) == 5692 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 5)) == 5693 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 3)) == 5694 # Pair of Fours
@test NLH.rank((4, 4, T, 9, 2)) == 5695 # Pair of Fours
@test NLH.rank((4, 4, T, 8, 7)) == 5696 # Pair of Fours
@test NLH.rank((4, 4, T, 8, 6)) == 5697 # Pair of Fours
@test NLH.rank((4, 4, T, 8, 5)) == 5698 # Pair of Fours
@test NLH.rank((4, 4, T, 8, 3)) == 5699 # Pair of Fours
@test NLH.rank((4, 4, T, 8, 2)) == 5700 # Pair of Fours
@test NLH.rank((4, 4, T, 7, 6)) == 5701 # Pair of Fours
@test NLH.rank((4, 4, T, 7, 5)) == 5702 # Pair of Fours
@test NLH.rank((4, 4, T, 7, 3)) == 5703 # Pair of Fours
@test NLH.rank((4, 4, T, 7, 2)) == 5704 # Pair of Fours
@test NLH.rank((4, 4, T, 6, 5)) == 5705 # Pair of Fours
@test NLH.rank((4, 4, T, 6, 3)) == 5706 # Pair of Fours
@test NLH.rank((4, 4, T, 6, 2)) == 5707 # Pair of Fours
@test NLH.rank((4, 4, T, 5, 3)) == 5708 # Pair of Fours
@test NLH.rank((4, 4, T, 5, 2)) == 5709 # Pair of Fours
@test NLH.rank((4, 4, T, 3, 2)) == 5710 # Pair of Fours
@test NLH.rank((4, 4, 9, 8, 7)) == 5711 # Pair of Fours
@test NLH.rank((4, 4, 9, 8, 6)) == 5712 # Pair of Fours
@test NLH.rank((4, 4, 9, 8, 5)) == 5713 # Pair of Fours
@test NLH.rank((4, 4, 9, 8, 3)) == 5714 # Pair of Fours
@test NLH.rank((4, 4, 9, 8, 2)) == 5715 # Pair of Fours
@test NLH.rank((4, 4, 9, 7, 6)) == 5716 # Pair of Fours
@test NLH.rank((4, 4, 9, 7, 5)) == 5717 # Pair of Fours
@test NLH.rank((4, 4, 9, 7, 3)) == 5718 # Pair of Fours
@test NLH.rank((4, 4, 9, 7, 2)) == 5719 # Pair of Fours
@test NLH.rank((4, 4, 9, 6, 5)) == 5720 # Pair of Fours
@test NLH.rank((4, 4, 9, 6, 3)) == 5721 # Pair of Fours
@test NLH.rank((4, 4, 9, 6, 2)) == 5722 # Pair of Fours
@test NLH.rank((4, 4, 9, 5, 3)) == 5723 # Pair of Fours
@test NLH.rank((4, 4, 9, 5, 2)) == 5724 # Pair of Fours
@test NLH.rank((4, 4, 9, 3, 2)) == 5725 # Pair of Fours
@test NLH.rank((4, 4, 8, 7, 6)) == 5726 # Pair of Fours
@test NLH.rank((4, 4, 8, 7, 5)) == 5727 # Pair of Fours
@test NLH.rank((4, 4, 8, 7, 3)) == 5728 # Pair of Fours
@test NLH.rank((4, 4, 8, 7, 2)) == 5729 # Pair of Fours
@test NLH.rank((4, 4, 8, 6, 5)) == 5730 # Pair of Fours
@test NLH.rank((4, 4, 8, 6, 3)) == 5731 # Pair of Fours
@test NLH.rank((4, 4, 8, 6, 2)) == 5732 # Pair of Fours
@test NLH.rank((4, 4, 8, 5, 3)) == 5733 # Pair of Fours
@test NLH.rank((4, 4, 8, 5, 2)) == 5734 # Pair of Fours
@test NLH.rank((4, 4, 8, 3, 2)) == 5735 # Pair of Fours
@test NLH.rank((4, 4, 7, 6, 5)) == 5736 # Pair of Fours
@test NLH.rank((4, 4, 7, 6, 3)) == 5737 # Pair of Fours
@test NLH.rank((4, 4, 7, 6, 2)) == 5738 # Pair of Fours
@test NLH.rank((4, 4, 7, 5, 3)) == 5739 # Pair of Fours
@test NLH.rank((4, 4, 7, 5, 2)) == 5740 # Pair of Fours
@test NLH.rank((4, 4, 7, 3, 2)) == 5741 # Pair of Fours
@test NLH.rank((4, 4, 6, 5, 3)) == 5742 # Pair of Fours
@test NLH.rank((4, 4, 6, 5, 2)) == 5743 # Pair of Fours
@test NLH.rank((4, 4, 6, 3, 2)) == 5744 # Pair of Fours
@test NLH.rank((4, 4, 5, 3, 2)) == 5745 # Pair of Fours
@test NLH.rank((3, 3, A, K, Q)) == 5746 # Pair of Treys
@test NLH.rank((3, 3, A, K, J)) == 5747 # Pair of Treys
@test NLH.rank((3, 3, A, K, T)) == 5748 # Pair of Treys
@test NLH.rank((3, 3, A, K, 9)) == 5749 # Pair of Treys
@test NLH.rank((3, 3, A, K, 8)) == 5750 # Pair of Treys
@test NLH.rank((3, 3, A, K, 7)) == 5751 # Pair of Treys
@test NLH.rank((3, 3, A, K, 6)) == 5752 # Pair of Treys
@test NLH.rank((3, 3, A, K, 5)) == 5753 # Pair of Treys
@test NLH.rank((3, 3, A, K, 4)) == 5754 # Pair of Treys
@test NLH.rank((3, 3, A, K, 2)) == 5755 # Pair of Treys
@test NLH.rank((3, 3, A, Q, J)) == 5756 # Pair of Treys
@test NLH.rank((3, 3, A, Q, T)) == 5757 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 9)) == 5758 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 8)) == 5759 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 7)) == 5760 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 6)) == 5761 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 5)) == 5762 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 4)) == 5763 # Pair of Treys
@test NLH.rank((3, 3, A, Q, 2)) == 5764 # Pair of Treys
@test NLH.rank((3, 3, A, J, T)) == 5765 # Pair of Treys
@test NLH.rank((3, 3, A, J, 9)) == 5766 # Pair of Treys
@test NLH.rank((3, 3, A, J, 8)) == 5767 # Pair of Treys
@test NLH.rank((3, 3, A, J, 7)) == 5768 # Pair of Treys
@test NLH.rank((3, 3, A, J, 6)) == 5769 # Pair of Treys
@test NLH.rank((3, 3, A, J, 5)) == 5770 # Pair of Treys
@test NLH.rank((3, 3, A, J, 4)) == 5771 # Pair of Treys
@test NLH.rank((3, 3, A, J, 2)) == 5772 # Pair of Treys
@test NLH.rank((3, 3, A, T, 9)) == 5773 # Pair of Treys
@test NLH.rank((3, 3, A, T, 8)) == 5774 # Pair of Treys
@test NLH.rank((3, 3, A, T, 7)) == 5775 # Pair of Treys
@test NLH.rank((3, 3, A, T, 6)) == 5776 # Pair of Treys
@test NLH.rank((3, 3, A, T, 5)) == 5777 # Pair of Treys
@test NLH.rank((3, 3, A, T, 4)) == 5778 # Pair of Treys
@test NLH.rank((3, 3, A, T, 2)) == 5779 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 8)) == 5780 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 7)) == 5781 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 6)) == 5782 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 5)) == 5783 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 4)) == 5784 # Pair of Treys
@test NLH.rank((3, 3, A, 9, 2)) == 5785 # Pair of Treys
@test NLH.rank((3, 3, A, 8, 7)) == 5786 # Pair of Treys
@test NLH.rank((3, 3, A, 8, 6)) == 5787 # Pair of Treys
@test NLH.rank((3, 3, A, 8, 5)) == 5788 # Pair of Treys
@test NLH.rank((3, 3, A, 8, 4)) == 5789 # Pair of Treys
@test NLH.rank((3, 3, A, 8, 2)) == 5790 # Pair of Treys
@test NLH.rank((3, 3, A, 7, 6)) == 5791 # Pair of Treys
@test NLH.rank((3, 3, A, 7, 5)) == 5792 # Pair of Treys
@test NLH.rank((3, 3, A, 7, 4)) == 5793 # Pair of Treys
@test NLH.rank((3, 3, A, 7, 2)) == 5794 # Pair of Treys
@test NLH.rank((3, 3, A, 6, 5)) == 5795 # Pair of Treys
@test NLH.rank((3, 3, A, 6, 4)) == 5796 # Pair of Treys
@test NLH.rank((3, 3, A, 6, 2)) == 5797 # Pair of Treys
@test NLH.rank((3, 3, A, 5, 4)) == 5798 # Pair of Treys
@test NLH.rank((3, 3, A, 5, 2)) == 5799 # Pair of Treys
@test NLH.rank((3, 3, A, 4, 2)) == 5800 # Pair of Treys
@test NLH.rank((3, 3, K, Q, J)) == 5801 # Pair of Treys
@test NLH.rank((3, 3, K, Q, T)) == 5802 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 9)) == 5803 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 8)) == 5804 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 7)) == 5805 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 6)) == 5806 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 5)) == 5807 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 4)) == 5808 # Pair of Treys
@test NLH.rank((3, 3, K, Q, 2)) == 5809 # Pair of Treys
@test NLH.rank((3, 3, K, J, T)) == 5810 # Pair of Treys
@test NLH.rank((3, 3, K, J, 9)) == 5811 # Pair of Treys
@test NLH.rank((3, 3, K, J, 8)) == 5812 # Pair of Treys
@test NLH.rank((3, 3, K, J, 7)) == 5813 # Pair of Treys
@test NLH.rank((3, 3, K, J, 6)) == 5814 # Pair of Treys
@test NLH.rank((3, 3, K, J, 5)) == 5815 # Pair of Treys
@test NLH.rank((3, 3, K, J, 4)) == 5816 # Pair of Treys
@test NLH.rank((3, 3, K, J, 2)) == 5817 # Pair of Treys
@test NLH.rank((3, 3, K, T, 9)) == 5818 # Pair of Treys
@test NLH.rank((3, 3, K, T, 8)) == 5819 # Pair of Treys
@test NLH.rank((3, 3, K, T, 7)) == 5820 # Pair of Treys
@test NLH.rank((3, 3, K, T, 6)) == 5821 # Pair of Treys
@test NLH.rank((3, 3, K, T, 5)) == 5822 # Pair of Treys
@test NLH.rank((3, 3, K, T, 4)) == 5823 # Pair of Treys
@test NLH.rank((3, 3, K, T, 2)) == 5824 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 8)) == 5825 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 7)) == 5826 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 6)) == 5827 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 5)) == 5828 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 4)) == 5829 # Pair of Treys
@test NLH.rank((3, 3, K, 9, 2)) == 5830 # Pair of Treys
@test NLH.rank((3, 3, K, 8, 7)) == 5831 # Pair of Treys
@test NLH.rank((3, 3, K, 8, 6)) == 5832 # Pair of Treys
@test NLH.rank((3, 3, K, 8, 5)) == 5833 # Pair of Treys
@test NLH.rank((3, 3, K, 8, 4)) == 5834 # Pair of Treys
@test NLH.rank((3, 3, K, 8, 2)) == 5835 # Pair of Treys
@test NLH.rank((3, 3, K, 7, 6)) == 5836 # Pair of Treys
@test NLH.rank((3, 3, K, 7, 5)) == 5837 # Pair of Treys
@test NLH.rank((3, 3, K, 7, 4)) == 5838 # Pair of Treys
@test NLH.rank((3, 3, K, 7, 2)) == 5839 # Pair of Treys
@test NLH.rank((3, 3, K, 6, 5)) == 5840 # Pair of Treys
@test NLH.rank((3, 3, K, 6, 4)) == 5841 # Pair of Treys
@test NLH.rank((3, 3, K, 6, 2)) == 5842 # Pair of Treys
@test NLH.rank((3, 3, K, 5, 4)) == 5843 # Pair of Treys
@test NLH.rank((3, 3, K, 5, 2)) == 5844 # Pair of Treys
@test NLH.rank((3, 3, K, 4, 2)) == 5845 # Pair of Treys
@test NLH.rank((3, 3, Q, J, T)) == 5846 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 9)) == 5847 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 8)) == 5848 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 7)) == 5849 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 6)) == 5850 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 5)) == 5851 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 4)) == 5852 # Pair of Treys
@test NLH.rank((3, 3, Q, J, 2)) == 5853 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 9)) == 5854 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 8)) == 5855 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 7)) == 5856 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 6)) == 5857 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 5)) == 5858 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 4)) == 5859 # Pair of Treys
@test NLH.rank((3, 3, Q, T, 2)) == 5860 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 8)) == 5861 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 7)) == 5862 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 6)) == 5863 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 5)) == 5864 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 4)) == 5865 # Pair of Treys
@test NLH.rank((3, 3, Q, 9, 2)) == 5866 # Pair of Treys
@test NLH.rank((3, 3, Q, 8, 7)) == 5867 # Pair of Treys
@test NLH.rank((3, 3, Q, 8, 6)) == 5868 # Pair of Treys
@test NLH.rank((3, 3, Q, 8, 5)) == 5869 # Pair of Treys
@test NLH.rank((3, 3, Q, 8, 4)) == 5870 # Pair of Treys
@test NLH.rank((3, 3, Q, 8, 2)) == 5871 # Pair of Treys
@test NLH.rank((3, 3, Q, 7, 6)) == 5872 # Pair of Treys
@test NLH.rank((3, 3, Q, 7, 5)) == 5873 # Pair of Treys
@test NLH.rank((3, 3, Q, 7, 4)) == 5874 # Pair of Treys
@test NLH.rank((3, 3, Q, 7, 2)) == 5875 # Pair of Treys
@test NLH.rank((3, 3, Q, 6, 5)) == 5876 # Pair of Treys
@test NLH.rank((3, 3, Q, 6, 4)) == 5877 # Pair of Treys
@test NLH.rank((3, 3, Q, 6, 2)) == 5878 # Pair of Treys
@test NLH.rank((3, 3, Q, 5, 4)) == 5879 # Pair of Treys
@test NLH.rank((3, 3, Q, 5, 2)) == 5880 # Pair of Treys
@test NLH.rank((3, 3, Q, 4, 2)) == 5881 # Pair of Treys
@test NLH.rank((3, 3, J, T, 9)) == 5882 # Pair of Treys
@test NLH.rank((3, 3, J, T, 8)) == 5883 # Pair of Treys
@test NLH.rank((3, 3, J, T, 7)) == 5884 # Pair of Treys
@test NLH.rank((3, 3, J, T, 6)) == 5885 # Pair of Treys
@test NLH.rank((3, 3, J, T, 5)) == 5886 # Pair of Treys
@test NLH.rank((3, 3, J, T, 4)) == 5887 # Pair of Treys
@test NLH.rank((3, 3, J, T, 2)) == 5888 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 8)) == 5889 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 7)) == 5890 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 6)) == 5891 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 5)) == 5892 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 4)) == 5893 # Pair of Treys
@test NLH.rank((3, 3, J, 9, 2)) == 5894 # Pair of Treys
@test NLH.rank((3, 3, J, 8, 7)) == 5895 # Pair of Treys
@test NLH.rank((3, 3, J, 8, 6)) == 5896 # Pair of Treys
@test NLH.rank((3, 3, J, 8, 5)) == 5897 # Pair of Treys
@test NLH.rank((3, 3, J, 8, 4)) == 5898 # Pair of Treys
@test NLH.rank((3, 3, J, 8, 2)) == 5899 # Pair of Treys
@test NLH.rank((3, 3, J, 7, 6)) == 5900 # Pair of Treys
@test NLH.rank((3, 3, J, 7, 5)) == 5901 # Pair of Treys
@test NLH.rank((3, 3, J, 7, 4)) == 5902 # Pair of Treys
@test NLH.rank((3, 3, J, 7, 2)) == 5903 # Pair of Treys
@test NLH.rank((3, 3, J, 6, 5)) == 5904 # Pair of Treys
@test NLH.rank((3, 3, J, 6, 4)) == 5905 # Pair of Treys
@test NLH.rank((3, 3, J, 6, 2)) == 5906 # Pair of Treys
@test NLH.rank((3, 3, J, 5, 4)) == 5907 # Pair of Treys
@test NLH.rank((3, 3, J, 5, 2)) == 5908 # Pair of Treys
@test NLH.rank((3, 3, J, 4, 2)) == 5909 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 8)) == 5910 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 7)) == 5911 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 6)) == 5912 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 5)) == 5913 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 4)) == 5914 # Pair of Treys
@test NLH.rank((3, 3, T, 9, 2)) == 5915 # Pair of Treys
@test NLH.rank((3, 3, T, 8, 7)) == 5916 # Pair of Treys
@test NLH.rank((3, 3, T, 8, 6)) == 5917 # Pair of Treys
@test NLH.rank((3, 3, T, 8, 5)) == 5918 # Pair of Treys
@test NLH.rank((3, 3, T, 8, 4)) == 5919 # Pair of Treys
@test NLH.rank((3, 3, T, 8, 2)) == 5920 # Pair of Treys
@test NLH.rank((3, 3, T, 7, 6)) == 5921 # Pair of Treys
@test NLH.rank((3, 3, T, 7, 5)) == 5922 # Pair of Treys
@test NLH.rank((3, 3, T, 7, 4)) == 5923 # Pair of Treys
@test NLH.rank((3, 3, T, 7, 2)) == 5924 # Pair of Treys
@test NLH.rank((3, 3, T, 6, 5)) == 5925 # Pair of Treys
@test NLH.rank((3, 3, T, 6, 4)) == 5926 # Pair of Treys
@test NLH.rank((3, 3, T, 6, 2)) == 5927 # Pair of Treys
@test NLH.rank((3, 3, T, 5, 4)) == 5928 # Pair of Treys
@test NLH.rank((3, 3, T, 5, 2)) == 5929 # Pair of Treys
@test NLH.rank((3, 3, T, 4, 2)) == 5930 # Pair of Treys
@test NLH.rank((3, 3, 9, 8, 7)) == 5931 # Pair of Treys
@test NLH.rank((3, 3, 9, 8, 6)) == 5932 # Pair of Treys
@test NLH.rank((3, 3, 9, 8, 5)) == 5933 # Pair of Treys
@test NLH.rank((3, 3, 9, 8, 4)) == 5934 # Pair of Treys
@test NLH.rank((3, 3, 9, 8, 2)) == 5935 # Pair of Treys
@test NLH.rank((3, 3, 9, 7, 6)) == 5936 # Pair of Treys
@test NLH.rank((3, 3, 9, 7, 5)) == 5937 # Pair of Treys
@test NLH.rank((3, 3, 9, 7, 4)) == 5938 # Pair of Treys
@test NLH.rank((3, 3, 9, 7, 2)) == 5939 # Pair of Treys
@test NLH.rank((3, 3, 9, 6, 5)) == 5940 # Pair of Treys
@test NLH.rank((3, 3, 9, 6, 4)) == 5941 # Pair of Treys
@test NLH.rank((3, 3, 9, 6, 2)) == 5942 # Pair of Treys
@test NLH.rank((3, 3, 9, 5, 4)) == 5943 # Pair of Treys
@test NLH.rank((3, 3, 9, 5, 2)) == 5944 # Pair of Treys
@test NLH.rank((3, 3, 9, 4, 2)) == 5945 # Pair of Treys
@test NLH.rank((3, 3, 8, 7, 6)) == 5946 # Pair of Treys
@test NLH.rank((3, 3, 8, 7, 5)) == 5947 # Pair of Treys
@test NLH.rank((3, 3, 8, 7, 4)) == 5948 # Pair of Treys
@test NLH.rank((3, 3, 8, 7, 2)) == 5949 # Pair of Treys
@test NLH.rank((3, 3, 8, 6, 5)) == 5950 # Pair of Treys
@test NLH.rank((3, 3, 8, 6, 4)) == 5951 # Pair of Treys
@test NLH.rank((3, 3, 8, 6, 2)) == 5952 # Pair of Treys
@test NLH.rank((3, 3, 8, 5, 4)) == 5953 # Pair of Treys
@test NLH.rank((3, 3, 8, 5, 2)) == 5954 # Pair of Treys
@test NLH.rank((3, 3, 8, 4, 2)) == 5955 # Pair of Treys
@test NLH.rank((3, 3, 7, 6, 5)) == 5956 # Pair of Treys
@test NLH.rank((3, 3, 7, 6, 4)) == 5957 # Pair of Treys
@test NLH.rank((3, 3, 7, 6, 2)) == 5958 # Pair of Treys
@test NLH.rank((3, 3, 7, 5, 4)) == 5959 # Pair of Treys
@test NLH.rank((3, 3, 7, 5, 2)) == 5960 # Pair of Treys
@test NLH.rank((3, 3, 7, 4, 2)) == 5961 # Pair of Treys
@test NLH.rank((3, 3, 6, 5, 4)) == 5962 # Pair of Treys
@test NLH.rank((3, 3, 6, 5, 2)) == 5963 # Pair of Treys
@test NLH.rank((3, 3, 6, 4, 2)) == 5964 # Pair of Treys
@test NLH.rank((3, 3, 5, 4, 2)) == 5965 # Pair of Treys
@test NLH.rank((2, 2, A, K, Q)) == 5966 # Pair of Deuces
@test NLH.rank((2, 2, A, K, J)) == 5967 # Pair of Deuces
@test NLH.rank((2, 2, A, K, T)) == 5968 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 9)) == 5969 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 8)) == 5970 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 7)) == 5971 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 6)) == 5972 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 5)) == 5973 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 4)) == 5974 # Pair of Deuces
@test NLH.rank((2, 2, A, K, 3)) == 5975 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, J)) == 5976 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, T)) == 5977 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 9)) == 5978 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 8)) == 5979 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 7)) == 5980 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 6)) == 5981 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 5)) == 5982 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 4)) == 5983 # Pair of Deuces
@test NLH.rank((2, 2, A, Q, 3)) == 5984 # Pair of Deuces
@test NLH.rank((2, 2, A, J, T)) == 5985 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 9)) == 5986 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 8)) == 5987 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 7)) == 5988 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 6)) == 5989 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 5)) == 5990 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 4)) == 5991 # Pair of Deuces
@test NLH.rank((2, 2, A, J, 3)) == 5992 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 9)) == 5993 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 8)) == 5994 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 7)) == 5995 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 6)) == 5996 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 5)) == 5997 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 4)) == 5998 # Pair of Deuces
@test NLH.rank((2, 2, A, T, 3)) == 5999 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 8)) == 6000 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 7)) == 6001 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 6)) == 6002 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 5)) == 6003 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 4)) == 6004 # Pair of Deuces
@test NLH.rank((2, 2, A, 9, 3)) == 6005 # Pair of Deuces
@test NLH.rank((2, 2, A, 8, 7)) == 6006 # Pair of Deuces
@test NLH.rank((2, 2, A, 8, 6)) == 6007 # Pair of Deuces
@test NLH.rank((2, 2, A, 8, 5)) == 6008 # Pair of Deuces
@test NLH.rank((2, 2, A, 8, 4)) == 6009 # Pair of Deuces
@test NLH.rank((2, 2, A, 8, 3)) == 6010 # Pair of Deuces
@test NLH.rank((2, 2, A, 7, 6)) == 6011 # Pair of Deuces
@test NLH.rank((2, 2, A, 7, 5)) == 6012 # Pair of Deuces
@test NLH.rank((2, 2, A, 7, 4)) == 6013 # Pair of Deuces
@test NLH.rank((2, 2, A, 7, 3)) == 6014 # Pair of Deuces
@test NLH.rank((2, 2, A, 6, 5)) == 6015 # Pair of Deuces
@test NLH.rank((2, 2, A, 6, 4)) == 6016 # Pair of Deuces
@test NLH.rank((2, 2, A, 6, 3)) == 6017 # Pair of Deuces
@test NLH.rank((2, 2, A, 5, 4)) == 6018 # Pair of Deuces
@test NLH.rank((2, 2, A, 5, 3)) == 6019 # Pair of Deuces
@test NLH.rank((2, 2, A, 4, 3)) == 6020 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, J)) == 6021 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, T)) == 6022 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 9)) == 6023 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 8)) == 6024 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 7)) == 6025 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 6)) == 6026 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 5)) == 6027 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 4)) == 6028 # Pair of Deuces
@test NLH.rank((2, 2, K, Q, 3)) == 6029 # Pair of Deuces
@test NLH.rank((2, 2, K, J, T)) == 6030 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 9)) == 6031 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 8)) == 6032 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 7)) == 6033 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 6)) == 6034 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 5)) == 6035 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 4)) == 6036 # Pair of Deuces
@test NLH.rank((2, 2, K, J, 3)) == 6037 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 9)) == 6038 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 8)) == 6039 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 7)) == 6040 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 6)) == 6041 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 5)) == 6042 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 4)) == 6043 # Pair of Deuces
@test NLH.rank((2, 2, K, T, 3)) == 6044 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 8)) == 6045 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 7)) == 6046 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 6)) == 6047 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 5)) == 6048 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 4)) == 6049 # Pair of Deuces
@test NLH.rank((2, 2, K, 9, 3)) == 6050 # Pair of Deuces
@test NLH.rank((2, 2, K, 8, 7)) == 6051 # Pair of Deuces
@test NLH.rank((2, 2, K, 8, 6)) == 6052 # Pair of Deuces
@test NLH.rank((2, 2, K, 8, 5)) == 6053 # Pair of Deuces
@test NLH.rank((2, 2, K, 8, 4)) == 6054 # Pair of Deuces
@test NLH.rank((2, 2, K, 8, 3)) == 6055 # Pair of Deuces
@test NLH.rank((2, 2, K, 7, 6)) == 6056 # Pair of Deuces
@test NLH.rank((2, 2, K, 7, 5)) == 6057 # Pair of Deuces
@test NLH.rank((2, 2, K, 7, 4)) == 6058 # Pair of Deuces
@test NLH.rank((2, 2, K, 7, 3)) == 6059 # Pair of Deuces
@test NLH.rank((2, 2, K, 6, 5)) == 6060 # Pair of Deuces
@test NLH.rank((2, 2, K, 6, 4)) == 6061 # Pair of Deuces
@test NLH.rank((2, 2, K, 6, 3)) == 6062 # Pair of Deuces
@test NLH.rank((2, 2, K, 5, 4)) == 6063 # Pair of Deuces
@test NLH.rank((2, 2, K, 5, 3)) == 6064 # Pair of Deuces
@test NLH.rank((2, 2, K, 4, 3)) == 6065 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, T)) == 6066 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 9)) == 6067 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 8)) == 6068 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 7)) == 6069 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 6)) == 6070 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 5)) == 6071 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 4)) == 6072 # Pair of Deuces
@test NLH.rank((2, 2, Q, J, 3)) == 6073 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 9)) == 6074 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 8)) == 6075 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 7)) == 6076 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 6)) == 6077 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 5)) == 6078 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 4)) == 6079 # Pair of Deuces
@test NLH.rank((2, 2, Q, T, 3)) == 6080 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 8)) == 6081 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 7)) == 6082 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 6)) == 6083 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 5)) == 6084 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 4)) == 6085 # Pair of Deuces
@test NLH.rank((2, 2, Q, 9, 3)) == 6086 # Pair of Deuces
@test NLH.rank((2, 2, Q, 8, 7)) == 6087 # Pair of Deuces
@test NLH.rank((2, 2, Q, 8, 6)) == 6088 # Pair of Deuces
@test NLH.rank((2, 2, Q, 8, 5)) == 6089 # Pair of Deuces
@test NLH.rank((2, 2, Q, 8, 4)) == 6090 # Pair of Deuces
@test NLH.rank((2, 2, Q, 8, 3)) == 6091 # Pair of Deuces
@test NLH.rank((2, 2, Q, 7, 6)) == 6092 # Pair of Deuces
@test NLH.rank((2, 2, Q, 7, 5)) == 6093 # Pair of Deuces
@test NLH.rank((2, 2, Q, 7, 4)) == 6094 # Pair of Deuces
@test NLH.rank((2, 2, Q, 7, 3)) == 6095 # Pair of Deuces
@test NLH.rank((2, 2, Q, 6, 5)) == 6096 # Pair of Deuces
@test NLH.rank((2, 2, Q, 6, 4)) == 6097 # Pair of Deuces
@test NLH.rank((2, 2, Q, 6, 3)) == 6098 # Pair of Deuces
@test NLH.rank((2, 2, Q, 5, 4)) == 6099 # Pair of Deuces
@test NLH.rank((2, 2, Q, 5, 3)) == 6100 # Pair of Deuces
@test NLH.rank((2, 2, Q, 4, 3)) == 6101 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 9)) == 6102 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 8)) == 6103 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 7)) == 6104 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 6)) == 6105 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 5)) == 6106 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 4)) == 6107 # Pair of Deuces
@test NLH.rank((2, 2, J, T, 3)) == 6108 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 8)) == 6109 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 7)) == 6110 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 6)) == 6111 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 5)) == 6112 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 4)) == 6113 # Pair of Deuces
@test NLH.rank((2, 2, J, 9, 3)) == 6114 # Pair of Deuces
@test NLH.rank((2, 2, J, 8, 7)) == 6115 # Pair of Deuces
@test NLH.rank((2, 2, J, 8, 6)) == 6116 # Pair of Deuces
@test NLH.rank((2, 2, J, 8, 5)) == 6117 # Pair of Deuces
@test NLH.rank((2, 2, J, 8, 4)) == 6118 # Pair of Deuces
@test NLH.rank((2, 2, J, 8, 3)) == 6119 # Pair of Deuces
@test NLH.rank((2, 2, J, 7, 6)) == 6120 # Pair of Deuces
@test NLH.rank((2, 2, J, 7, 5)) == 6121 # Pair of Deuces
@test NLH.rank((2, 2, J, 7, 4)) == 6122 # Pair of Deuces
@test NLH.rank((2, 2, J, 7, 3)) == 6123 # Pair of Deuces
@test NLH.rank((2, 2, J, 6, 5)) == 6124 # Pair of Deuces
@test NLH.rank((2, 2, J, 6, 4)) == 6125 # Pair of Deuces
@test NLH.rank((2, 2, J, 6, 3)) == 6126 # Pair of Deuces
@test NLH.rank((2, 2, J, 5, 4)) == 6127 # Pair of Deuces
@test NLH.rank((2, 2, J, 5, 3)) == 6128 # Pair of Deuces
@test NLH.rank((2, 2, J, 4, 3)) == 6129 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 8)) == 6130 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 7)) == 6131 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 6)) == 6132 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 5)) == 6133 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 4)) == 6134 # Pair of Deuces
@test NLH.rank((2, 2, T, 9, 3)) == 6135 # Pair of Deuces
@test NLH.rank((2, 2, T, 8, 7)) == 6136 # Pair of Deuces
@test NLH.rank((2, 2, T, 8, 6)) == 6137 # Pair of Deuces
@test NLH.rank((2, 2, T, 8, 5)) == 6138 # Pair of Deuces
@test NLH.rank((2, 2, T, 8, 4)) == 6139 # Pair of Deuces
@test NLH.rank((2, 2, T, 8, 3)) == 6140 # Pair of Deuces
@test NLH.rank((2, 2, T, 7, 6)) == 6141 # Pair of Deuces
@test NLH.rank((2, 2, T, 7, 5)) == 6142 # Pair of Deuces
@test NLH.rank((2, 2, T, 7, 4)) == 6143 # Pair of Deuces
@test NLH.rank((2, 2, T, 7, 3)) == 6144 # Pair of Deuces
@test NLH.rank((2, 2, T, 6, 5)) == 6145 # Pair of Deuces
@test NLH.rank((2, 2, T, 6, 4)) == 6146 # Pair of Deuces
@test NLH.rank((2, 2, T, 6, 3)) == 6147 # Pair of Deuces
@test NLH.rank((2, 2, T, 5, 4)) == 6148 # Pair of Deuces
@test NLH.rank((2, 2, T, 5, 3)) == 6149 # Pair of Deuces
@test NLH.rank((2, 2, T, 4, 3)) == 6150 # Pair of Deuces
@test NLH.rank((2, 2, 9, 8, 7)) == 6151 # Pair of Deuces
@test NLH.rank((2, 2, 9, 8, 6)) == 6152 # Pair of Deuces
@test NLH.rank((2, 2, 9, 8, 5)) == 6153 # Pair of Deuces
@test NLH.rank((2, 2, 9, 8, 4)) == 6154 # Pair of Deuces
@test NLH.rank((2, 2, 9, 8, 3)) == 6155 # Pair of Deuces
@test NLH.rank((2, 2, 9, 7, 6)) == 6156 # Pair of Deuces
@test NLH.rank((2, 2, 9, 7, 5)) == 6157 # Pair of Deuces
@test NLH.rank((2, 2, 9, 7, 4)) == 6158 # Pair of Deuces
@test NLH.rank((2, 2, 9, 7, 3)) == 6159 # Pair of Deuces
@test NLH.rank((2, 2, 9, 6, 5)) == 6160 # Pair of Deuces
@test NLH.rank((2, 2, 9, 6, 4)) == 6161 # Pair of Deuces
@test NLH.rank((2, 2, 9, 6, 3)) == 6162 # Pair of Deuces
@test NLH.rank((2, 2, 9, 5, 4)) == 6163 # Pair of Deuces
@test NLH.rank((2, 2, 9, 5, 3)) == 6164 # Pair of Deuces
@test NLH.rank((2, 2, 9, 4, 3)) == 6165 # Pair of Deuces
@test NLH.rank((2, 2, 8, 7, 6)) == 6166 # Pair of Deuces
@test NLH.rank((2, 2, 8, 7, 5)) == 6167 # Pair of Deuces
@test NLH.rank((2, 2, 8, 7, 4)) == 6168 # Pair of Deuces
@test NLH.rank((2, 2, 8, 7, 3)) == 6169 # Pair of Deuces
@test NLH.rank((2, 2, 8, 6, 5)) == 6170 # Pair of Deuces
@test NLH.rank((2, 2, 8, 6, 4)) == 6171 # Pair of Deuces
@test NLH.rank((2, 2, 8, 6, 3)) == 6172 # Pair of Deuces
@test NLH.rank((2, 2, 8, 5, 4)) == 6173 # Pair of Deuces
@test NLH.rank((2, 2, 8, 5, 3)) == 6174 # Pair of Deuces
@test NLH.rank((2, 2, 8, 4, 3)) == 6175 # Pair of Deuces
@test NLH.rank((2, 2, 7, 6, 5)) == 6176 # Pair of Deuces
@test NLH.rank((2, 2, 7, 6, 4)) == 6177 # Pair of Deuces
@test NLH.rank((2, 2, 7, 6, 3)) == 6178 # Pair of Deuces
@test NLH.rank((2, 2, 7, 5, 4)) == 6179 # Pair of Deuces
@test NLH.rank((2, 2, 7, 5, 3)) == 6180 # Pair of Deuces
@test NLH.rank((2, 2, 7, 4, 3)) == 6181 # Pair of Deuces
@test NLH.rank((2, 2, 6, 5, 4)) == 6182 # Pair of Deuces
@test NLH.rank((2, 2, 6, 5, 3)) == 6183 # Pair of Deuces
@test NLH.rank((2, 2, 6, 4, 3)) == 6184 # Pair of Deuces
@test NLH.rank((2, 2, 5, 4, 3)) == 6185 # Pair of Deuces
@test NLH.rank((A, K, Q, J, 9)) == 6186 # Ace-High
@test NLH.rank((A, K, Q, J, 8)) == 6187 # Ace-High
@test NLH.rank((A, K, Q, J, 7)) == 6188 # Ace-High
@test NLH.rank((A, K, Q, J, 6)) == 6189 # Ace-High
@test NLH.rank((A, K, Q, J, 5)) == 6190 # Ace-High
@test NLH.rank((A, K, Q, J, 4)) == 6191 # Ace-High
@test NLH.rank((A, K, Q, J, 3)) == 6192 # Ace-High
@test NLH.rank((A, K, Q, J, 2)) == 6193 # Ace-High
@test NLH.rank((A, K, Q, T, 9)) == 6194 # Ace-High
@test NLH.rank((A, K, Q, T, 8)) == 6195 # Ace-High
@test NLH.rank((A, K, Q, T, 7)) == 6196 # Ace-High
@test NLH.rank((A, K, Q, T, 6)) == 6197 # Ace-High
@test NLH.rank((A, K, Q, T, 5)) == 6198 # Ace-High
@test NLH.rank((A, K, Q, T, 4)) == 6199 # Ace-High
@test NLH.rank((A, K, Q, T, 3)) == 6200 # Ace-High
@test NLH.rank((A, K, Q, T, 2)) == 6201 # Ace-High
@test NLH.rank((A, K, Q, 9, 8)) == 6202 # Ace-High
@test NLH.rank((A, K, Q, 9, 7)) == 6203 # Ace-High
@test NLH.rank((A, K, Q, 9, 6)) == 6204 # Ace-High
@test NLH.rank((A, K, Q, 9, 5)) == 6205 # Ace-High
@test NLH.rank((A, K, Q, 9, 4)) == 6206 # Ace-High
@test NLH.rank((A, K, Q, 9, 3)) == 6207 # Ace-High
@test NLH.rank((A, K, Q, 9, 2)) == 6208 # Ace-High
@test NLH.rank((A, K, Q, 8, 7)) == 6209 # Ace-High
@test NLH.rank((A, K, Q, 8, 6)) == 6210 # Ace-High
@test NLH.rank((A, K, Q, 8, 5)) == 6211 # Ace-High
@test NLH.rank((A, K, Q, 8, 4)) == 6212 # Ace-High
@test NLH.rank((A, K, Q, 8, 3)) == 6213 # Ace-High
@test NLH.rank((A, K, Q, 8, 2)) == 6214 # Ace-High
@test NLH.rank((A, K, Q, 7, 6)) == 6215 # Ace-High
@test NLH.rank((A, K, Q, 7, 5)) == 6216 # Ace-High
@test NLH.rank((A, K, Q, 7, 4)) == 6217 # Ace-High
@test NLH.rank((A, K, Q, 7, 3)) == 6218 # Ace-High
@test NLH.rank((A, K, Q, 7, 2)) == 6219 # Ace-High
@test NLH.rank((A, K, Q, 6, 5)) == 6220 # Ace-High
@test NLH.rank((A, K, Q, 6, 4)) == 6221 # Ace-High
@test NLH.rank((A, K, Q, 6, 3)) == 6222 # Ace-High
@test NLH.rank((A, K, Q, 6, 2)) == 6223 # Ace-High
@test NLH.rank((A, K, Q, 5, 4)) == 6224 # Ace-High
@test NLH.rank((A, K, Q, 5, 3)) == 6225 # Ace-High
@test NLH.rank((A, K, Q, 5, 2)) == 6226 # Ace-High
@test NLH.rank((A, K, Q, 4, 3)) == 6227 # Ace-High
@test NLH.rank((A, K, Q, 4, 2)) == 6228 # Ace-High
@test NLH.rank((A, K, Q, 3, 2)) == 6229 # Ace-High
@test NLH.rank((A, K, J, T, 9)) == 6230 # Ace-High
@test NLH.rank((A, K, J, T, 8)) == 6231 # Ace-High
@test NLH.rank((A, K, J, T, 7)) == 6232 # Ace-High
@test NLH.rank((A, K, J, T, 6)) == 6233 # Ace-High
@test NLH.rank((A, K, J, T, 5)) == 6234 # Ace-High
@test NLH.rank((A, K, J, T, 4)) == 6235 # Ace-High
@test NLH.rank((A, K, J, T, 3)) == 6236 # Ace-High
@test NLH.rank((A, K, J, T, 2)) == 6237 # Ace-High
@test NLH.rank((A, K, J, 9, 8)) == 6238 # Ace-High
@test NLH.rank((A, K, J, 9, 7)) == 6239 # Ace-High
@test NLH.rank((A, K, J, 9, 6)) == 6240 # Ace-High
@test NLH.rank((A, K, J, 9, 5)) == 6241 # Ace-High
@test NLH.rank((A, K, J, 9, 4)) == 6242 # Ace-High
@test NLH.rank((A, K, J, 9, 3)) == 6243 # Ace-High
@test NLH.rank((A, K, J, 9, 2)) == 6244 # Ace-High
@test NLH.rank((A, K, J, 8, 7)) == 6245 # Ace-High
@test NLH.rank((A, K, J, 8, 6)) == 6246 # Ace-High
@test NLH.rank((A, K, J, 8, 5)) == 6247 # Ace-High
@test NLH.rank((A, K, J, 8, 4)) == 6248 # Ace-High
@test NLH.rank((A, K, J, 8, 3)) == 6249 # Ace-High
@test NLH.rank((A, K, J, 8, 2)) == 6250 # Ace-High
@test NLH.rank((A, K, J, 7, 6)) == 6251 # Ace-High
@test NLH.rank((A, K, J, 7, 5)) == 6252 # Ace-High
@test NLH.rank((A, K, J, 7, 4)) == 6253 # Ace-High
@test NLH.rank((A, K, J, 7, 3)) == 6254 # Ace-High
@test NLH.rank((A, K, J, 7, 2)) == 6255 # Ace-High
@test NLH.rank((A, K, J, 6, 5)) == 6256 # Ace-High
@test NLH.rank((A, K, J, 6, 4)) == 6257 # Ace-High
@test NLH.rank((A, K, J, 6, 3)) == 6258 # Ace-High
@test NLH.rank((A, K, J, 6, 2)) == 6259 # Ace-High
@test NLH.rank((A, K, J, 5, 4)) == 6260 # Ace-High
@test NLH.rank((A, K, J, 5, 3)) == 6261 # Ace-High
@test NLH.rank((A, K, J, 5, 2)) == 6262 # Ace-High
@test NLH.rank((A, K, J, 4, 3)) == 6263 # Ace-High
@test NLH.rank((A, K, J, 4, 2)) == 6264 # Ace-High
@test NLH.rank((A, K, J, 3, 2)) == 6265 # Ace-High
@test NLH.rank((A, K, T, 9, 8)) == 6266 # Ace-High
@test NLH.rank((A, K, T, 9, 7)) == 6267 # Ace-High
@test NLH.rank((A, K, T, 9, 6)) == 6268 # Ace-High
@test NLH.rank((A, K, T, 9, 5)) == 6269 # Ace-High
@test NLH.rank((A, K, T, 9, 4)) == 6270 # Ace-High
@test NLH.rank((A, K, T, 9, 3)) == 6271 # Ace-High
@test NLH.rank((A, K, T, 9, 2)) == 6272 # Ace-High
@test NLH.rank((A, K, T, 8, 7)) == 6273 # Ace-High
@test NLH.rank((A, K, T, 8, 6)) == 6274 # Ace-High
@test NLH.rank((A, K, T, 8, 5)) == 6275 # Ace-High
@test NLH.rank((A, K, T, 8, 4)) == 6276 # Ace-High
@test NLH.rank((A, K, T, 8, 3)) == 6277 # Ace-High
@test NLH.rank((A, K, T, 8, 2)) == 6278 # Ace-High
@test NLH.rank((A, K, T, 7, 6)) == 6279 # Ace-High
@test NLH.rank((A, K, T, 7, 5)) == 6280 # Ace-High
@test NLH.rank((A, K, T, 7, 4)) == 6281 # Ace-High
@test NLH.rank((A, K, T, 7, 3)) == 6282 # Ace-High
@test NLH.rank((A, K, T, 7, 2)) == 6283 # Ace-High
@test NLH.rank((A, K, T, 6, 5)) == 6284 # Ace-High
@test NLH.rank((A, K, T, 6, 4)) == 6285 # Ace-High
@test NLH.rank((A, K, T, 6, 3)) == 6286 # Ace-High
@test NLH.rank((A, K, T, 6, 2)) == 6287 # Ace-High
@test NLH.rank((A, K, T, 5, 4)) == 6288 # Ace-High
@test NLH.rank((A, K, T, 5, 3)) == 6289 # Ace-High
@test NLH.rank((A, K, T, 5, 2)) == 6290 # Ace-High
@test NLH.rank((A, K, T, 4, 3)) == 6291 # Ace-High
@test NLH.rank((A, K, T, 4, 2)) == 6292 # Ace-High
@test NLH.rank((A, K, T, 3, 2)) == 6293 # Ace-High
@test NLH.rank((A, K, 9, 8, 7)) == 6294 # Ace-High
@test NLH.rank((A, K, 9, 8, 6)) == 6295 # Ace-High
@test NLH.rank((A, K, 9, 8, 5)) == 6296 # Ace-High
@test NLH.rank((A, K, 9, 8, 4)) == 6297 # Ace-High
@test NLH.rank((A, K, 9, 8, 3)) == 6298 # Ace-High
@test NLH.rank((A, K, 9, 8, 2)) == 6299 # Ace-High
@test NLH.rank((A, K, 9, 7, 6)) == 6300 # Ace-High
@test NLH.rank((A, K, 9, 7, 5)) == 6301 # Ace-High
@test NLH.rank((A, K, 9, 7, 4)) == 6302 # Ace-High
@test NLH.rank((A, K, 9, 7, 3)) == 6303 # Ace-High
@test NLH.rank((A, K, 9, 7, 2)) == 6304 # Ace-High
@test NLH.rank((A, K, 9, 6, 5)) == 6305 # Ace-High
@test NLH.rank((A, K, 9, 6, 4)) == 6306 # Ace-High
@test NLH.rank((A, K, 9, 6, 3)) == 6307 # Ace-High
@test NLH.rank((A, K, 9, 6, 2)) == 6308 # Ace-High
@test NLH.rank((A, K, 9, 5, 4)) == 6309 # Ace-High
@test NLH.rank((A, K, 9, 5, 3)) == 6310 # Ace-High
@test NLH.rank((A, K, 9, 5, 2)) == 6311 # Ace-High
@test NLH.rank((A, K, 9, 4, 3)) == 6312 # Ace-High
@test NLH.rank((A, K, 9, 4, 2)) == 6313 # Ace-High
@test NLH.rank((A, K, 9, 3, 2)) == 6314 # Ace-High
@test NLH.rank((A, K, 8, 7, 6)) == 6315 # Ace-High
@test NLH.rank((A, K, 8, 7, 5)) == 6316 # Ace-High
@test NLH.rank((A, K, 8, 7, 4)) == 6317 # Ace-High
@test NLH.rank((A, K, 8, 7, 3)) == 6318 # Ace-High
@test NLH.rank((A, K, 8, 7, 2)) == 6319 # Ace-High
@test NLH.rank((A, K, 8, 6, 5)) == 6320 # Ace-High
@test NLH.rank((A, K, 8, 6, 4)) == 6321 # Ace-High
@test NLH.rank((A, K, 8, 6, 3)) == 6322 # Ace-High
@test NLH.rank((A, K, 8, 6, 2)) == 6323 # Ace-High
@test NLH.rank((A, K, 8, 5, 4)) == 6324 # Ace-High
@test NLH.rank((A, K, 8, 5, 3)) == 6325 # Ace-High
@test NLH.rank((A, K, 8, 5, 2)) == 6326 # Ace-High
@test NLH.rank((A, K, 8, 4, 3)) == 6327 # Ace-High
@test NLH.rank((A, K, 8, 4, 2)) == 6328 # Ace-High
@test NLH.rank((A, K, 8, 3, 2)) == 6329 # Ace-High
@test NLH.rank((A, K, 7, 6, 5)) == 6330 # Ace-High
@test NLH.rank((A, K, 7, 6, 4)) == 6331 # Ace-High
@test NLH.rank((A, K, 7, 6, 3)) == 6332 # Ace-High
@test NLH.rank((A, K, 7, 6, 2)) == 6333 # Ace-High
@test NLH.rank((A, K, 7, 5, 4)) == 6334 # Ace-High
@test NLH.rank((A, K, 7, 5, 3)) == 6335 # Ace-High
@test NLH.rank((A, K, 7, 5, 2)) == 6336 # Ace-High
@test NLH.rank((A, K, 7, 4, 3)) == 6337 # Ace-High
@test NLH.rank((A, K, 7, 4, 2)) == 6338 # Ace-High
@test NLH.rank((A, K, 7, 3, 2)) == 6339 # Ace-High
@test NLH.rank((A, K, 6, 5, 4)) == 6340 # Ace-High
@test NLH.rank((A, K, 6, 5, 3)) == 6341 # Ace-High
@test NLH.rank((A, K, 6, 5, 2)) == 6342 # Ace-High
@test NLH.rank((A, K, 6, 4, 3)) == 6343 # Ace-High
@test NLH.rank((A, K, 6, 4, 2)) == 6344 # Ace-High
@test NLH.rank((A, K, 6, 3, 2)) == 6345 # Ace-High
@test NLH.rank((A, K, 5, 4, 3)) == 6346 # Ace-High
@test NLH.rank((A, K, 5, 4, 2)) == 6347 # Ace-High
@test NLH.rank((A, K, 5, 3, 2)) == 6348 # Ace-High
@test NLH.rank((A, K, 4, 3, 2)) == 6349 # Ace-High
@test NLH.rank((A, Q, J, T, 9)) == 6350 # Ace-High
@test NLH.rank((A, Q, J, T, 8)) == 6351 # Ace-High
@test NLH.rank((A, Q, J, T, 7)) == 6352 # Ace-High
@test NLH.rank((A, Q, J, T, 6)) == 6353 # Ace-High
@test NLH.rank((A, Q, J, T, 5)) == 6354 # Ace-High
@test NLH.rank((A, Q, J, T, 4)) == 6355 # Ace-High
@test NLH.rank((A, Q, J, T, 3)) == 6356 # Ace-High
@test NLH.rank((A, Q, J, T, 2)) == 6357 # Ace-High
@test NLH.rank((A, Q, J, 9, 8)) == 6358 # Ace-High
@test NLH.rank((A, Q, J, 9, 7)) == 6359 # Ace-High
@test NLH.rank((A, Q, J, 9, 6)) == 6360 # Ace-High
@test NLH.rank((A, Q, J, 9, 5)) == 6361 # Ace-High
@test NLH.rank((A, Q, J, 9, 4)) == 6362 # Ace-High
@test NLH.rank((A, Q, J, 9, 3)) == 6363 # Ace-High
@test NLH.rank((A, Q, J, 9, 2)) == 6364 # Ace-High
@test NLH.rank((A, Q, J, 8, 7)) == 6365 # Ace-High
@test NLH.rank((A, Q, J, 8, 6)) == 6366 # Ace-High
@test NLH.rank((A, Q, J, 8, 5)) == 6367 # Ace-High
@test NLH.rank((A, Q, J, 8, 4)) == 6368 # Ace-High
@test NLH.rank((A, Q, J, 8, 3)) == 6369 # Ace-High
@test NLH.rank((A, Q, J, 8, 2)) == 6370 # Ace-High
@test NLH.rank((A, Q, J, 7, 6)) == 6371 # Ace-High
@test NLH.rank((A, Q, J, 7, 5)) == 6372 # Ace-High
@test NLH.rank((A, Q, J, 7, 4)) == 6373 # Ace-High
@test NLH.rank((A, Q, J, 7, 3)) == 6374 # Ace-High
@test NLH.rank((A, Q, J, 7, 2)) == 6375 # Ace-High
@test NLH.rank((A, Q, J, 6, 5)) == 6376 # Ace-High
@test NLH.rank((A, Q, J, 6, 4)) == 6377 # Ace-High
@test NLH.rank((A, Q, J, 6, 3)) == 6378 # Ace-High
@test NLH.rank((A, Q, J, 6, 2)) == 6379 # Ace-High
@test NLH.rank((A, Q, J, 5, 4)) == 6380 # Ace-High
@test NLH.rank((A, Q, J, 5, 3)) == 6381 # Ace-High
@test NLH.rank((A, Q, J, 5, 2)) == 6382 # Ace-High
@test NLH.rank((A, Q, J, 4, 3)) == 6383 # Ace-High
@test NLH.rank((A, Q, J, 4, 2)) == 6384 # Ace-High
@test NLH.rank((A, Q, J, 3, 2)) == 6385 # Ace-High
@test NLH.rank((A, Q, T, 9, 8)) == 6386 # Ace-High
@test NLH.rank((A, Q, T, 9, 7)) == 6387 # Ace-High
@test NLH.rank((A, Q, T, 9, 6)) == 6388 # Ace-High
@test NLH.rank((A, Q, T, 9, 5)) == 6389 # Ace-High
@test NLH.rank((A, Q, T, 9, 4)) == 6390 # Ace-High
@test NLH.rank((A, Q, T, 9, 3)) == 6391 # Ace-High
@test NLH.rank((A, Q, T, 9, 2)) == 6392 # Ace-High
@test NLH.rank((A, Q, T, 8, 7)) == 6393 # Ace-High
@test NLH.rank((A, Q, T, 8, 6)) == 6394 # Ace-High
@test NLH.rank((A, Q, T, 8, 5)) == 6395 # Ace-High
@test NLH.rank((A, Q, T, 8, 4)) == 6396 # Ace-High
@test NLH.rank((A, Q, T, 8, 3)) == 6397 # Ace-High
@test NLH.rank((A, Q, T, 8, 2)) == 6398 # Ace-High
@test NLH.rank((A, Q, T, 7, 6)) == 6399 # Ace-High
@test NLH.rank((A, Q, T, 7, 5)) == 6400 # Ace-High
@test NLH.rank((A, Q, T, 7, 4)) == 6401 # Ace-High
@test NLH.rank((A, Q, T, 7, 3)) == 6402 # Ace-High
@test NLH.rank((A, Q, T, 7, 2)) == 6403 # Ace-High
@test NLH.rank((A, Q, T, 6, 5)) == 6404 # Ace-High
@test NLH.rank((A, Q, T, 6, 4)) == 6405 # Ace-High
@test NLH.rank((A, Q, T, 6, 3)) == 6406 # Ace-High
@test NLH.rank((A, Q, T, 6, 2)) == 6407 # Ace-High
@test NLH.rank((A, Q, T, 5, 4)) == 6408 # Ace-High
@test NLH.rank((A, Q, T, 5, 3)) == 6409 # Ace-High
@test NLH.rank((A, Q, T, 5, 2)) == 6410 # Ace-High
@test NLH.rank((A, Q, T, 4, 3)) == 6411 # Ace-High
@test NLH.rank((A, Q, T, 4, 2)) == 6412 # Ace-High
@test NLH.rank((A, Q, T, 3, 2)) == 6413 # Ace-High
@test NLH.rank((A, Q, 9, 8, 7)) == 6414 # Ace-High
@test NLH.rank((A, Q, 9, 8, 6)) == 6415 # Ace-High
@test NLH.rank((A, Q, 9, 8, 5)) == 6416 # Ace-High
@test NLH.rank((A, Q, 9, 8, 4)) == 6417 # Ace-High
@test NLH.rank((A, Q, 9, 8, 3)) == 6418 # Ace-High
@test NLH.rank((A, Q, 9, 8, 2)) == 6419 # Ace-High
@test NLH.rank((A, Q, 9, 7, 6)) == 6420 # Ace-High
@test NLH.rank((A, Q, 9, 7, 5)) == 6421 # Ace-High
@test NLH.rank((A, Q, 9, 7, 4)) == 6422 # Ace-High
@test NLH.rank((A, Q, 9, 7, 3)) == 6423 # Ace-High
@test NLH.rank((A, Q, 9, 7, 2)) == 6424 # Ace-High
@test NLH.rank((A, Q, 9, 6, 5)) == 6425 # Ace-High
@test NLH.rank((A, Q, 9, 6, 4)) == 6426 # Ace-High
@test NLH.rank((A, Q, 9, 6, 3)) == 6427 # Ace-High
@test NLH.rank((A, Q, 9, 6, 2)) == 6428 # Ace-High
@test NLH.rank((A, Q, 9, 5, 4)) == 6429 # Ace-High
@test NLH.rank((A, Q, 9, 5, 3)) == 6430 # Ace-High
@test NLH.rank((A, Q, 9, 5, 2)) == 6431 # Ace-High
@test NLH.rank((A, Q, 9, 4, 3)) == 6432 # Ace-High
@test NLH.rank((A, Q, 9, 4, 2)) == 6433 # Ace-High
@test NLH.rank((A, Q, 9, 3, 2)) == 6434 # Ace-High
@test NLH.rank((A, Q, 8, 7, 6)) == 6435 # Ace-High
@test NLH.rank((A, Q, 8, 7, 5)) == 6436 # Ace-High
@test NLH.rank((A, Q, 8, 7, 4)) == 6437 # Ace-High
@test NLH.rank((A, Q, 8, 7, 3)) == 6438 # Ace-High
@test NLH.rank((A, Q, 8, 7, 2)) == 6439 # Ace-High
@test NLH.rank((A, Q, 8, 6, 5)) == 6440 # Ace-High
@test NLH.rank((A, Q, 8, 6, 4)) == 6441 # Ace-High
@test NLH.rank((A, Q, 8, 6, 3)) == 6442 # Ace-High
@test NLH.rank((A, Q, 8, 6, 2)) == 6443 # Ace-High
@test NLH.rank((A, Q, 8, 5, 4)) == 6444 # Ace-High
@test NLH.rank((A, Q, 8, 5, 3)) == 6445 # Ace-High
@test NLH.rank((A, Q, 8, 5, 2)) == 6446 # Ace-High
@test NLH.rank((A, Q, 8, 4, 3)) == 6447 # Ace-High
@test NLH.rank((A, Q, 8, 4, 2)) == 6448 # Ace-High
@test NLH.rank((A, Q, 8, 3, 2)) == 6449 # Ace-High
@test NLH.rank((A, Q, 7, 6, 5)) == 6450 # Ace-High
@test NLH.rank((A, Q, 7, 6, 4)) == 6451 # Ace-High
@test NLH.rank((A, Q, 7, 6, 3)) == 6452 # Ace-High
@test NLH.rank((A, Q, 7, 6, 2)) == 6453 # Ace-High
@test NLH.rank((A, Q, 7, 5, 4)) == 6454 # Ace-High
@test NLH.rank((A, Q, 7, 5, 3)) == 6455 # Ace-High
@test NLH.rank((A, Q, 7, 5, 2)) == 6456 # Ace-High
@test NLH.rank((A, Q, 7, 4, 3)) == 6457 # Ace-High
@test NLH.rank((A, Q, 7, 4, 2)) == 6458 # Ace-High
@test NLH.rank((A, Q, 7, 3, 2)) == 6459 # Ace-High
@test NLH.rank((A, Q, 6, 5, 4)) == 6460 # Ace-High
@test NLH.rank((A, Q, 6, 5, 3)) == 6461 # Ace-High
@test NLH.rank((A, Q, 6, 5, 2)) == 6462 # Ace-High
@test NLH.rank((A, Q, 6, 4, 3)) == 6463 # Ace-High
@test NLH.rank((A, Q, 6, 4, 2)) == 6464 # Ace-High
@test NLH.rank((A, Q, 6, 3, 2)) == 6465 # Ace-High
@test NLH.rank((A, Q, 5, 4, 3)) == 6466 # Ace-High
@test NLH.rank((A, Q, 5, 4, 2)) == 6467 # Ace-High
@test NLH.rank((A, Q, 5, 3, 2)) == 6468 # Ace-High
@test NLH.rank((A, Q, 4, 3, 2)) == 6469 # Ace-High
@test NLH.rank((A, J, T, 9, 8)) == 6470 # Ace-High
@test NLH.rank((A, J, T, 9, 7)) == 6471 # Ace-High
@test NLH.rank((A, J, T, 9, 6)) == 6472 # Ace-High
@test NLH.rank((A, J, T, 9, 5)) == 6473 # Ace-High
@test NLH.rank((A, J, T, 9, 4)) == 6474 # Ace-High
@test NLH.rank((A, J, T, 9, 3)) == 6475 # Ace-High
@test NLH.rank((A, J, T, 9, 2)) == 6476 # Ace-High
@test NLH.rank((A, J, T, 8, 7)) == 6477 # Ace-High
@test NLH.rank((A, J, T, 8, 6)) == 6478 # Ace-High
@test NLH.rank((A, J, T, 8, 5)) == 6479 # Ace-High
@test NLH.rank((A, J, T, 8, 4)) == 6480 # Ace-High
@test NLH.rank((A, J, T, 8, 3)) == 6481 # Ace-High
@test NLH.rank((A, J, T, 8, 2)) == 6482 # Ace-High
@test NLH.rank((A, J, T, 7, 6)) == 6483 # Ace-High
@test NLH.rank((A, J, T, 7, 5)) == 6484 # Ace-High
@test NLH.rank((A, J, T, 7, 4)) == 6485 # Ace-High
@test NLH.rank((A, J, T, 7, 3)) == 6486 # Ace-High
@test NLH.rank((A, J, T, 7, 2)) == 6487 # Ace-High
@test NLH.rank((A, J, T, 6, 5)) == 6488 # Ace-High
@test NLH.rank((A, J, T, 6, 4)) == 6489 # Ace-High
@test NLH.rank((A, J, T, 6, 3)) == 6490 # Ace-High
@test NLH.rank((A, J, T, 6, 2)) == 6491 # Ace-High
@test NLH.rank((A, J, T, 5, 4)) == 6492 # Ace-High
@test NLH.rank((A, J, T, 5, 3)) == 6493 # Ace-High
@test NLH.rank((A, J, T, 5, 2)) == 6494 # Ace-High
@test NLH.rank((A, J, T, 4, 3)) == 6495 # Ace-High
@test NLH.rank((A, J, T, 4, 2)) == 6496 # Ace-High
@test NLH.rank((A, J, T, 3, 2)) == 6497 # Ace-High
@test NLH.rank((A, J, 9, 8, 7)) == 6498 # Ace-High
@test NLH.rank((A, J, 9, 8, 6)) == 6499 # Ace-High
@test NLH.rank((A, J, 9, 8, 5)) == 6500 # Ace-High
@test NLH.rank((A, J, 9, 8, 4)) == 6501 # Ace-High
@test NLH.rank((A, J, 9, 8, 3)) == 6502 # Ace-High
@test NLH.rank((A, J, 9, 8, 2)) == 6503 # Ace-High
@test NLH.rank((A, J, 9, 7, 6)) == 6504 # Ace-High
@test NLH.rank((A, J, 9, 7, 5)) == 6505 # Ace-High
@test NLH.rank((A, J, 9, 7, 4)) == 6506 # Ace-High
@test NLH.rank((A, J, 9, 7, 3)) == 6507 # Ace-High
@test NLH.rank((A, J, 9, 7, 2)) == 6508 # Ace-High
@test NLH.rank((A, J, 9, 6, 5)) == 6509 # Ace-High
@test NLH.rank((A, J, 9, 6, 4)) == 6510 # Ace-High
@test NLH.rank((A, J, 9, 6, 3)) == 6511 # Ace-High
@test NLH.rank((A, J, 9, 6, 2)) == 6512 # Ace-High
@test NLH.rank((A, J, 9, 5, 4)) == 6513 # Ace-High
@test NLH.rank((A, J, 9, 5, 3)) == 6514 # Ace-High
@test NLH.rank((A, J, 9, 5, 2)) == 6515 # Ace-High
@test NLH.rank((A, J, 9, 4, 3)) == 6516 # Ace-High
@test NLH.rank((A, J, 9, 4, 2)) == 6517 # Ace-High
@test NLH.rank((A, J, 9, 3, 2)) == 6518 # Ace-High
@test NLH.rank((A, J, 8, 7, 6)) == 6519 # Ace-High
@test NLH.rank((A, J, 8, 7, 5)) == 6520 # Ace-High
@test NLH.rank((A, J, 8, 7, 4)) == 6521 # Ace-High
@test NLH.rank((A, J, 8, 7, 3)) == 6522 # Ace-High
@test NLH.rank((A, J, 8, 7, 2)) == 6523 # Ace-High
@test NLH.rank((A, J, 8, 6, 5)) == 6524 # Ace-High
@test NLH.rank((A, J, 8, 6, 4)) == 6525 # Ace-High
@test NLH.rank((A, J, 8, 6, 3)) == 6526 # Ace-High
@test NLH.rank((A, J, 8, 6, 2)) == 6527 # Ace-High
@test NLH.rank((A, J, 8, 5, 4)) == 6528 # Ace-High
@test NLH.rank((A, J, 8, 5, 3)) == 6529 # Ace-High
@test NLH.rank((A, J, 8, 5, 2)) == 6530 # Ace-High
@test NLH.rank((A, J, 8, 4, 3)) == 6531 # Ace-High
@test NLH.rank((A, J, 8, 4, 2)) == 6532 # Ace-High
@test NLH.rank((A, J, 8, 3, 2)) == 6533 # Ace-High
@test NLH.rank((A, J, 7, 6, 5)) == 6534 # Ace-High
@test NLH.rank((A, J, 7, 6, 4)) == 6535 # Ace-High
@test NLH.rank((A, J, 7, 6, 3)) == 6536 # Ace-High
@test NLH.rank((A, J, 7, 6, 2)) == 6537 # Ace-High
@test NLH.rank((A, J, 7, 5, 4)) == 6538 # Ace-High
@test NLH.rank((A, J, 7, 5, 3)) == 6539 # Ace-High
@test NLH.rank((A, J, 7, 5, 2)) == 6540 # Ace-High
@test NLH.rank((A, J, 7, 4, 3)) == 6541 # Ace-High
@test NLH.rank((A, J, 7, 4, 2)) == 6542 # Ace-High
@test NLH.rank((A, J, 7, 3, 2)) == 6543 # Ace-High
@test NLH.rank((A, J, 6, 5, 4)) == 6544 # Ace-High
@test NLH.rank((A, J, 6, 5, 3)) == 6545 # Ace-High
@test NLH.rank((A, J, 6, 5, 2)) == 6546 # Ace-High
@test NLH.rank((A, J, 6, 4, 3)) == 6547 # Ace-High
@test NLH.rank((A, J, 6, 4, 2)) == 6548 # Ace-High
@test NLH.rank((A, J, 6, 3, 2)) == 6549 # Ace-High
@test NLH.rank((A, J, 5, 4, 3)) == 6550 # Ace-High
@test NLH.rank((A, J, 5, 4, 2)) == 6551 # Ace-High
@test NLH.rank((A, J, 5, 3, 2)) == 6552 # Ace-High
@test NLH.rank((A, J, 4, 3, 2)) == 6553 # Ace-High
@test NLH.rank((A, T, 9, 8, 7)) == 6554 # Ace-High
@test NLH.rank((A, T, 9, 8, 6)) == 6555 # Ace-High
@test NLH.rank((A, T, 9, 8, 5)) == 6556 # Ace-High
@test NLH.rank((A, T, 9, 8, 4)) == 6557 # Ace-High
@test NLH.rank((A, T, 9, 8, 3)) == 6558 # Ace-High
@test NLH.rank((A, T, 9, 8, 2)) == 6559 # Ace-High
@test NLH.rank((A, T, 9, 7, 6)) == 6560 # Ace-High
@test NLH.rank((A, T, 9, 7, 5)) == 6561 # Ace-High
@test NLH.rank((A, T, 9, 7, 4)) == 6562 # Ace-High
@test NLH.rank((A, T, 9, 7, 3)) == 6563 # Ace-High
@test NLH.rank((A, T, 9, 7, 2)) == 6564 # Ace-High
@test NLH.rank((A, T, 9, 6, 5)) == 6565 # Ace-High
@test NLH.rank((A, T, 9, 6, 4)) == 6566 # Ace-High
@test NLH.rank((A, T, 9, 6, 3)) == 6567 # Ace-High
@test NLH.rank((A, T, 9, 6, 2)) == 6568 # Ace-High
@test NLH.rank((A, T, 9, 5, 4)) == 6569 # Ace-High
@test NLH.rank((A, T, 9, 5, 3)) == 6570 # Ace-High
@test NLH.rank((A, T, 9, 5, 2)) == 6571 # Ace-High
@test NLH.rank((A, T, 9, 4, 3)) == 6572 # Ace-High
@test NLH.rank((A, T, 9, 4, 2)) == 6573 # Ace-High
@test NLH.rank((A, T, 9, 3, 2)) == 6574 # Ace-High
@test NLH.rank((A, T, 8, 7, 6)) == 6575 # Ace-High
@test NLH.rank((A, T, 8, 7, 5)) == 6576 # Ace-High
@test NLH.rank((A, T, 8, 7, 4)) == 6577 # Ace-High
@test NLH.rank((A, T, 8, 7, 3)) == 6578 # Ace-High
@test NLH.rank((A, T, 8, 7, 2)) == 6579 # Ace-High
@test NLH.rank((A, T, 8, 6, 5)) == 6580 # Ace-High
@test NLH.rank((A, T, 8, 6, 4)) == 6581 # Ace-High
@test NLH.rank((A, T, 8, 6, 3)) == 6582 # Ace-High
@test NLH.rank((A, T, 8, 6, 2)) == 6583 # Ace-High
@test NLH.rank((A, T, 8, 5, 4)) == 6584 # Ace-High
@test NLH.rank((A, T, 8, 5, 3)) == 6585 # Ace-High
@test NLH.rank((A, T, 8, 5, 2)) == 6586 # Ace-High
@test NLH.rank((A, T, 8, 4, 3)) == 6587 # Ace-High
@test NLH.rank((A, T, 8, 4, 2)) == 6588 # Ace-High
@test NLH.rank((A, T, 8, 3, 2)) == 6589 # Ace-High
@test NLH.rank((A, T, 7, 6, 5)) == 6590 # Ace-High
@test NLH.rank((A, T, 7, 6, 4)) == 6591 # Ace-High
@test NLH.rank((A, T, 7, 6, 3)) == 6592 # Ace-High
@test NLH.rank((A, T, 7, 6, 2)) == 6593 # Ace-High
@test NLH.rank((A, T, 7, 5, 4)) == 6594 # Ace-High
@test NLH.rank((A, T, 7, 5, 3)) == 6595 # Ace-High
@test NLH.rank((A, T, 7, 5, 2)) == 6596 # Ace-High
@test NLH.rank((A, T, 7, 4, 3)) == 6597 # Ace-High
@test NLH.rank((A, T, 7, 4, 2)) == 6598 # Ace-High
@test NLH.rank((A, T, 7, 3, 2)) == 6599 # Ace-High
@test NLH.rank((A, T, 6, 5, 4)) == 6600 # Ace-High
@test NLH.rank((A, T, 6, 5, 3)) == 6601 # Ace-High
@test NLH.rank((A, T, 6, 5, 2)) == 6602 # Ace-High
@test NLH.rank((A, T, 6, 4, 3)) == 6603 # Ace-High
@test NLH.rank((A, T, 6, 4, 2)) == 6604 # Ace-High
@test NLH.rank((A, T, 6, 3, 2)) == 6605 # Ace-High
@test NLH.rank((A, T, 5, 4, 3)) == 6606 # Ace-High
@test NLH.rank((A, T, 5, 4, 2)) == 6607 # Ace-High
@test NLH.rank((A, T, 5, 3, 2)) == 6608 # Ace-High
@test NLH.rank((A, T, 4, 3, 2)) == 6609 # Ace-High
@test NLH.rank((A, 9, 8, 7, 6)) == 6610 # Ace-High
@test NLH.rank((A, 9, 8, 7, 5)) == 6611 # Ace-High
@test NLH.rank((A, 9, 8, 7, 4)) == 6612 # Ace-High
@test NLH.rank((A, 9, 8, 7, 3)) == 6613 # Ace-High
@test NLH.rank((A, 9, 8, 7, 2)) == 6614 # Ace-High
@test NLH.rank((A, 9, 8, 6, 5)) == 6615 # Ace-High
@test NLH.rank((A, 9, 8, 6, 4)) == 6616 # Ace-High
@test NLH.rank((A, 9, 8, 6, 3)) == 6617 # Ace-High
@test NLH.rank((A, 9, 8, 6, 2)) == 6618 # Ace-High
@test NLH.rank((A, 9, 8, 5, 4)) == 6619 # Ace-High
@test NLH.rank((A, 9, 8, 5, 3)) == 6620 # Ace-High
@test NLH.rank((A, 9, 8, 5, 2)) == 6621 # Ace-High
@test NLH.rank((A, 9, 8, 4, 3)) == 6622 # Ace-High
@test NLH.rank((A, 9, 8, 4, 2)) == 6623 # Ace-High
@test NLH.rank((A, 9, 8, 3, 2)) == 6624 # Ace-High
@test NLH.rank((A, 9, 7, 6, 5)) == 6625 # Ace-High
@test NLH.rank((A, 9, 7, 6, 4)) == 6626 # Ace-High
@test NLH.rank((A, 9, 7, 6, 3)) == 6627 # Ace-High
@test NLH.rank((A, 9, 7, 6, 2)) == 6628 # Ace-High
@test NLH.rank((A, 9, 7, 5, 4)) == 6629 # Ace-High
@test NLH.rank((A, 9, 7, 5, 3)) == 6630 # Ace-High
@test NLH.rank((A, 9, 7, 5, 2)) == 6631 # Ace-High
@test NLH.rank((A, 9, 7, 4, 3)) == 6632 # Ace-High
@test NLH.rank((A, 9, 7, 4, 2)) == 6633 # Ace-High
@test NLH.rank((A, 9, 7, 3, 2)) == 6634 # Ace-High
@test NLH.rank((A, 9, 6, 5, 4)) == 6635 # Ace-High
@test NLH.rank((A, 9, 6, 5, 3)) == 6636 # Ace-High
@test NLH.rank((A, 9, 6, 5, 2)) == 6637 # Ace-High
@test NLH.rank((A, 9, 6, 4, 3)) == 6638 # Ace-High
@test NLH.rank((A, 9, 6, 4, 2)) == 6639 # Ace-High
@test NLH.rank((A, 9, 6, 3, 2)) == 6640 # Ace-High
@test NLH.rank((A, 9, 5, 4, 3)) == 6641 # Ace-High
@test NLH.rank((A, 9, 5, 4, 2)) == 6642 # Ace-High
@test NLH.rank((A, 9, 5, 3, 2)) == 6643 # Ace-High
@test NLH.rank((A, 9, 4, 3, 2)) == 6644 # Ace-High
@test NLH.rank((A, 8, 7, 6, 5)) == 6645 # Ace-High
@test NLH.rank((A, 8, 7, 6, 4)) == 6646 # Ace-High
@test NLH.rank((A, 8, 7, 6, 3)) == 6647 # Ace-High
@test NLH.rank((A, 8, 7, 6, 2)) == 6648 # Ace-High
@test NLH.rank((A, 8, 7, 5, 4)) == 6649 # Ace-High
@test NLH.rank((A, 8, 7, 5, 3)) == 6650 # Ace-High
@test NLH.rank((A, 8, 7, 5, 2)) == 6651 # Ace-High
@test NLH.rank((A, 8, 7, 4, 3)) == 6652 # Ace-High
@test NLH.rank((A, 8, 7, 4, 2)) == 6653 # Ace-High
@test NLH.rank((A, 8, 7, 3, 2)) == 6654 # Ace-High
@test NLH.rank((A, 8, 6, 5, 4)) == 6655 # Ace-High
@test NLH.rank((A, 8, 6, 5, 3)) == 6656 # Ace-High
@test NLH.rank((A, 8, 6, 5, 2)) == 6657 # Ace-High
@test NLH.rank((A, 8, 6, 4, 3)) == 6658 # Ace-High
@test NLH.rank((A, 8, 6, 4, 2)) == 6659 # Ace-High
@test NLH.rank((A, 8, 6, 3, 2)) == 6660 # Ace-High
@test NLH.rank((A, 8, 5, 4, 3)) == 6661 # Ace-High
@test NLH.rank((A, 8, 5, 4, 2)) == 6662 # Ace-High
@test NLH.rank((A, 8, 5, 3, 2)) == 6663 # Ace-High
@test NLH.rank((A, 8, 4, 3, 2)) == 6664 # Ace-High
@test NLH.rank((A, 7, 6, 5, 4)) == 6665 # Ace-High
@test NLH.rank((A, 7, 6, 5, 3)) == 6666 # Ace-High
@test NLH.rank((A, 7, 6, 5, 2)) == 6667 # Ace-High
@test NLH.rank((A, 7, 6, 4, 3)) == 6668 # Ace-High
@test NLH.rank((A, 7, 6, 4, 2)) == 6669 # Ace-High
@test NLH.rank((A, 7, 6, 3, 2)) == 6670 # Ace-High
@test NLH.rank((A, 7, 5, 4, 3)) == 6671 # Ace-High
@test NLH.rank((A, 7, 5, 4, 2)) == 6672 # Ace-High
@test NLH.rank((A, 7, 5, 3, 2)) == 6673 # Ace-High
@test NLH.rank((A, 7, 4, 3, 2)) == 6674 # Ace-High
@test NLH.rank((A, 6, 5, 4, 3)) == 6675 # Ace-High
@test NLH.rank((A, 6, 5, 4, 2)) == 6676 # Ace-High
@test NLH.rank((A, 6, 5, 3, 2)) == 6677 # Ace-High
@test NLH.rank((A, 6, 4, 3, 2)) == 6678 # Ace-High
@test NLH.rank((K, Q, J, T, 8)) == 6679 # King-High
@test NLH.rank((K, Q, J, T, 7)) == 6680 # King-High
@test NLH.rank((K, Q, J, T, 6)) == 6681 # King-High
@test NLH.rank((K, Q, J, T, 5)) == 6682 # King-High
@test NLH.rank((K, Q, J, T, 4)) == 6683 # King-High
@test NLH.rank((K, Q, J, T, 3)) == 6684 # King-High
@test NLH.rank((K, Q, J, T, 2)) == 6685 # King-High
@test NLH.rank((K, Q, J, 9, 8)) == 6686 # King-High
@test NLH.rank((K, Q, J, 9, 7)) == 6687 # King-High
@test NLH.rank((K, Q, J, 9, 6)) == 6688 # King-High
@test NLH.rank((K, Q, J, 9, 5)) == 6689 # King-High
@test NLH.rank((K, Q, J, 9, 4)) == 6690 # King-High
@test NLH.rank((K, Q, J, 9, 3)) == 6691 # King-High
@test NLH.rank((K, Q, J, 9, 2)) == 6692 # King-High
@test NLH.rank((K, Q, J, 8, 7)) == 6693 # King-High
@test NLH.rank((K, Q, J, 8, 6)) == 6694 # King-High
@test NLH.rank((K, Q, J, 8, 5)) == 6695 # King-High
@test NLH.rank((K, Q, J, 8, 4)) == 6696 # King-High
@test NLH.rank((K, Q, J, 8, 3)) == 6697 # King-High
@test NLH.rank((K, Q, J, 8, 2)) == 6698 # King-High
@test NLH.rank((K, Q, J, 7, 6)) == 6699 # King-High
@test NLH.rank((K, Q, J, 7, 5)) == 6700 # King-High
@test NLH.rank((K, Q, J, 7, 4)) == 6701 # King-High
@test NLH.rank((K, Q, J, 7, 3)) == 6702 # King-High
@test NLH.rank((K, Q, J, 7, 2)) == 6703 # King-High
@test NLH.rank((K, Q, J, 6, 5)) == 6704 # King-High
@test NLH.rank((K, Q, J, 6, 4)) == 6705 # King-High
@test NLH.rank((K, Q, J, 6, 3)) == 6706 # King-High
@test NLH.rank((K, Q, J, 6, 2)) == 6707 # King-High
@test NLH.rank((K, Q, J, 5, 4)) == 6708 # King-High
@test NLH.rank((K, Q, J, 5, 3)) == 6709 # King-High
@test NLH.rank((K, Q, J, 5, 2)) == 6710 # King-High
@test NLH.rank((K, Q, J, 4, 3)) == 6711 # King-High
@test NLH.rank((K, Q, J, 4, 2)) == 6712 # King-High
@test NLH.rank((K, Q, J, 3, 2)) == 6713 # King-High
@test NLH.rank((K, Q, T, 9, 8)) == 6714 # King-High
@test NLH.rank((K, Q, T, 9, 7)) == 6715 # King-High
@test NLH.rank((K, Q, T, 9, 6)) == 6716 # King-High
@test NLH.rank((K, Q, T, 9, 5)) == 6717 # King-High
@test NLH.rank((K, Q, T, 9, 4)) == 6718 # King-High
@test NLH.rank((K, Q, T, 9, 3)) == 6719 # King-High
@test NLH.rank((K, Q, T, 9, 2)) == 6720 # King-High
@test NLH.rank((K, Q, T, 8, 7)) == 6721 # King-High
@test NLH.rank((K, Q, T, 8, 6)) == 6722 # King-High
@test NLH.rank((K, Q, T, 8, 5)) == 6723 # King-High
@test NLH.rank((K, Q, T, 8, 4)) == 6724 # King-High
@test NLH.rank((K, Q, T, 8, 3)) == 6725 # King-High
@test NLH.rank((K, Q, T, 8, 2)) == 6726 # King-High
@test NLH.rank((K, Q, T, 7, 6)) == 6727 # King-High
@test NLH.rank((K, Q, T, 7, 5)) == 6728 # King-High
@test NLH.rank((K, Q, T, 7, 4)) == 6729 # King-High
@test NLH.rank((K, Q, T, 7, 3)) == 6730 # King-High
@test NLH.rank((K, Q, T, 7, 2)) == 6731 # King-High
@test NLH.rank((K, Q, T, 6, 5)) == 6732 # King-High
@test NLH.rank((K, Q, T, 6, 4)) == 6733 # King-High
@test NLH.rank((K, Q, T, 6, 3)) == 6734 # King-High
@test NLH.rank((K, Q, T, 6, 2)) == 6735 # King-High
@test NLH.rank((K, Q, T, 5, 4)) == 6736 # King-High
@test NLH.rank((K, Q, T, 5, 3)) == 6737 # King-High
@test NLH.rank((K, Q, T, 5, 2)) == 6738 # King-High
@test NLH.rank((K, Q, T, 4, 3)) == 6739 # King-High
@test NLH.rank((K, Q, T, 4, 2)) == 6740 # King-High
@test NLH.rank((K, Q, T, 3, 2)) == 6741 # King-High
@test NLH.rank((K, Q, 9, 8, 7)) == 6742 # King-High
@test NLH.rank((K, Q, 9, 8, 6)) == 6743 # King-High
@test NLH.rank((K, Q, 9, 8, 5)) == 6744 # King-High
@test NLH.rank((K, Q, 9, 8, 4)) == 6745 # King-High
@test NLH.rank((K, Q, 9, 8, 3)) == 6746 # King-High
@test NLH.rank((K, Q, 9, 8, 2)) == 6747 # King-High
@test NLH.rank((K, Q, 9, 7, 6)) == 6748 # King-High
@test NLH.rank((K, Q, 9, 7, 5)) == 6749 # King-High
@test NLH.rank((K, Q, 9, 7, 4)) == 6750 # King-High
@test NLH.rank((K, Q, 9, 7, 3)) == 6751 # King-High
@test NLH.rank((K, Q, 9, 7, 2)) == 6752 # King-High
@test NLH.rank((K, Q, 9, 6, 5)) == 6753 # King-High
@test NLH.rank((K, Q, 9, 6, 4)) == 6754 # King-High
@test NLH.rank((K, Q, 9, 6, 3)) == 6755 # King-High
@test NLH.rank((K, Q, 9, 6, 2)) == 6756 # King-High
@test NLH.rank((K, Q, 9, 5, 4)) == 6757 # King-High
@test NLH.rank((K, Q, 9, 5, 3)) == 6758 # King-High
@test NLH.rank((K, Q, 9, 5, 2)) == 6759 # King-High
@test NLH.rank((K, Q, 9, 4, 3)) == 6760 # King-High
@test NLH.rank((K, Q, 9, 4, 2)) == 6761 # King-High
@test NLH.rank((K, Q, 9, 3, 2)) == 6762 # King-High
@test NLH.rank((K, Q, 8, 7, 6)) == 6763 # King-High
@test NLH.rank((K, Q, 8, 7, 5)) == 6764 # King-High
@test NLH.rank((K, Q, 8, 7, 4)) == 6765 # King-High
@test NLH.rank((K, Q, 8, 7, 3)) == 6766 # King-High
@test NLH.rank((K, Q, 8, 7, 2)) == 6767 # King-High
@test NLH.rank((K, Q, 8, 6, 5)) == 6768 # King-High
@test NLH.rank((K, Q, 8, 6, 4)) == 6769 # King-High
@test NLH.rank((K, Q, 8, 6, 3)) == 6770 # King-High
@test NLH.rank((K, Q, 8, 6, 2)) == 6771 # King-High
@test NLH.rank((K, Q, 8, 5, 4)) == 6772 # King-High
@test NLH.rank((K, Q, 8, 5, 3)) == 6773 # King-High
@test NLH.rank((K, Q, 8, 5, 2)) == 6774 # King-High
@test NLH.rank((K, Q, 8, 4, 3)) == 6775 # King-High
@test NLH.rank((K, Q, 8, 4, 2)) == 6776 # King-High
@test NLH.rank((K, Q, 8, 3, 2)) == 6777 # King-High
@test NLH.rank((K, Q, 7, 6, 5)) == 6778 # King-High
@test NLH.rank((K, Q, 7, 6, 4)) == 6779 # King-High
@test NLH.rank((K, Q, 7, 6, 3)) == 6780 # King-High
@test NLH.rank((K, Q, 7, 6, 2)) == 6781 # King-High
@test NLH.rank((K, Q, 7, 5, 4)) == 6782 # King-High
@test NLH.rank((K, Q, 7, 5, 3)) == 6783 # King-High
@test NLH.rank((K, Q, 7, 5, 2)) == 6784 # King-High
@test NLH.rank((K, Q, 7, 4, 3)) == 6785 # King-High
@test NLH.rank((K, Q, 7, 4, 2)) == 6786 # King-High
@test NLH.rank((K, Q, 7, 3, 2)) == 6787 # King-High
@test NLH.rank((K, Q, 6, 5, 4)) == 6788 # King-High
@test NLH.rank((K, Q, 6, 5, 3)) == 6789 # King-High
@test NLH.rank((K, Q, 6, 5, 2)) == 6790 # King-High
@test NLH.rank((K, Q, 6, 4, 3)) == 6791 # King-High
@test NLH.rank((K, Q, 6, 4, 2)) == 6792 # King-High
@test NLH.rank((K, Q, 6, 3, 2)) == 6793 # King-High
@test NLH.rank((K, Q, 5, 4, 3)) == 6794 # King-High
@test NLH.rank((K, Q, 5, 4, 2)) == 6795 # King-High
@test NLH.rank((K, Q, 5, 3, 2)) == 6796 # King-High
@test NLH.rank((K, Q, 4, 3, 2)) == 6797 # King-High
@test NLH.rank((K, J, T, 9, 8)) == 6798 # King-High
@test NLH.rank((K, J, T, 9, 7)) == 6799 # King-High
@test NLH.rank((K, J, T, 9, 6)) == 6800 # King-High
@test NLH.rank((K, J, T, 9, 5)) == 6801 # King-High
@test NLH.rank((K, J, T, 9, 4)) == 6802 # King-High
@test NLH.rank((K, J, T, 9, 3)) == 6803 # King-High
@test NLH.rank((K, J, T, 9, 2)) == 6804 # King-High
@test NLH.rank((K, J, T, 8, 7)) == 6805 # King-High
@test NLH.rank((K, J, T, 8, 6)) == 6806 # King-High
@test NLH.rank((K, J, T, 8, 5)) == 6807 # King-High
@test NLH.rank((K, J, T, 8, 4)) == 6808 # King-High
@test NLH.rank((K, J, T, 8, 3)) == 6809 # King-High
@test NLH.rank((K, J, T, 8, 2)) == 6810 # King-High
@test NLH.rank((K, J, T, 7, 6)) == 6811 # King-High
@test NLH.rank((K, J, T, 7, 5)) == 6812 # King-High
@test NLH.rank((K, J, T, 7, 4)) == 6813 # King-High
@test NLH.rank((K, J, T, 7, 3)) == 6814 # King-High
@test NLH.rank((K, J, T, 7, 2)) == 6815 # King-High
@test NLH.rank((K, J, T, 6, 5)) == 6816 # King-High
@test NLH.rank((K, J, T, 6, 4)) == 6817 # King-High
@test NLH.rank((K, J, T, 6, 3)) == 6818 # King-High
@test NLH.rank((K, J, T, 6, 2)) == 6819 # King-High
@test NLH.rank((K, J, T, 5, 4)) == 6820 # King-High
@test NLH.rank((K, J, T, 5, 3)) == 6821 # King-High
@test NLH.rank((K, J, T, 5, 2)) == 6822 # King-High
@test NLH.rank((K, J, T, 4, 3)) == 6823 # King-High
@test NLH.rank((K, J, T, 4, 2)) == 6824 # King-High
@test NLH.rank((K, J, T, 3, 2)) == 6825 # King-High
@test NLH.rank((K, J, 9, 8, 7)) == 6826 # King-High
@test NLH.rank((K, J, 9, 8, 6)) == 6827 # King-High
@test NLH.rank((K, J, 9, 8, 5)) == 6828 # King-High
@test NLH.rank((K, J, 9, 8, 4)) == 6829 # King-High
@test NLH.rank((K, J, 9, 8, 3)) == 6830 # King-High
@test NLH.rank((K, J, 9, 8, 2)) == 6831 # King-High
@test NLH.rank((K, J, 9, 7, 6)) == 6832 # King-High
@test NLH.rank((K, J, 9, 7, 5)) == 6833 # King-High
@test NLH.rank((K, J, 9, 7, 4)) == 6834 # King-High
@test NLH.rank((K, J, 9, 7, 3)) == 6835 # King-High
@test NLH.rank((K, J, 9, 7, 2)) == 6836 # King-High
@test NLH.rank((K, J, 9, 6, 5)) == 6837 # King-High
@test NLH.rank((K, J, 9, 6, 4)) == 6838 # King-High
@test NLH.rank((K, J, 9, 6, 3)) == 6839 # King-High
@test NLH.rank((K, J, 9, 6, 2)) == 6840 # King-High
@test NLH.rank((K, J, 9, 5, 4)) == 6841 # King-High
@test NLH.rank((K, J, 9, 5, 3)) == 6842 # King-High
@test NLH.rank((K, J, 9, 5, 2)) == 6843 # King-High
@test NLH.rank((K, J, 9, 4, 3)) == 6844 # King-High
@test NLH.rank((K, J, 9, 4, 2)) == 6845 # King-High
@test NLH.rank((K, J, 9, 3, 2)) == 6846 # King-High
@test NLH.rank((K, J, 8, 7, 6)) == 6847 # King-High
@test NLH.rank((K, J, 8, 7, 5)) == 6848 # King-High
@test NLH.rank((K, J, 8, 7, 4)) == 6849 # King-High
@test NLH.rank((K, J, 8, 7, 3)) == 6850 # King-High
@test NLH.rank((K, J, 8, 7, 2)) == 6851 # King-High
@test NLH.rank((K, J, 8, 6, 5)) == 6852 # King-High
@test NLH.rank((K, J, 8, 6, 4)) == 6853 # King-High
@test NLH.rank((K, J, 8, 6, 3)) == 6854 # King-High
@test NLH.rank((K, J, 8, 6, 2)) == 6855 # King-High
@test NLH.rank((K, J, 8, 5, 4)) == 6856 # King-High
@test NLH.rank((K, J, 8, 5, 3)) == 6857 # King-High
@test NLH.rank((K, J, 8, 5, 2)) == 6858 # King-High
@test NLH.rank((K, J, 8, 4, 3)) == 6859 # King-High
@test NLH.rank((K, J, 8, 4, 2)) == 6860 # King-High
@test NLH.rank((K, J, 8, 3, 2)) == 6861 # King-High
@test NLH.rank((K, J, 7, 6, 5)) == 6862 # King-High
@test NLH.rank((K, J, 7, 6, 4)) == 6863 # King-High
@test NLH.rank((K, J, 7, 6, 3)) == 6864 # King-High
@test NLH.rank((K, J, 7, 6, 2)) == 6865 # King-High
@test NLH.rank((K, J, 7, 5, 4)) == 6866 # King-High
@test NLH.rank((K, J, 7, 5, 3)) == 6867 # King-High
@test NLH.rank((K, J, 7, 5, 2)) == 6868 # King-High
@test NLH.rank((K, J, 7, 4, 3)) == 6869 # King-High
@test NLH.rank((K, J, 7, 4, 2)) == 6870 # King-High
@test NLH.rank((K, J, 7, 3, 2)) == 6871 # King-High
@test NLH.rank((K, J, 6, 5, 4)) == 6872 # King-High
@test NLH.rank((K, J, 6, 5, 3)) == 6873 # King-High
@test NLH.rank((K, J, 6, 5, 2)) == 6874 # King-High
@test NLH.rank((K, J, 6, 4, 3)) == 6875 # King-High
@test NLH.rank((K, J, 6, 4, 2)) == 6876 # King-High
@test NLH.rank((K, J, 6, 3, 2)) == 6877 # King-High
@test NLH.rank((K, J, 5, 4, 3)) == 6878 # King-High
@test NLH.rank((K, J, 5, 4, 2)) == 6879 # King-High
@test NLH.rank((K, J, 5, 3, 2)) == 6880 # King-High
@test NLH.rank((K, J, 4, 3, 2)) == 6881 # King-High
@test NLH.rank((K, T, 9, 8, 7)) == 6882 # King-High
@test NLH.rank((K, T, 9, 8, 6)) == 6883 # King-High
@test NLH.rank((K, T, 9, 8, 5)) == 6884 # King-High
@test NLH.rank((K, T, 9, 8, 4)) == 6885 # King-High
@test NLH.rank((K, T, 9, 8, 3)) == 6886 # King-High
@test NLH.rank((K, T, 9, 8, 2)) == 6887 # King-High
@test NLH.rank((K, T, 9, 7, 6)) == 6888 # King-High
@test NLH.rank((K, T, 9, 7, 5)) == 6889 # King-High
@test NLH.rank((K, T, 9, 7, 4)) == 6890 # King-High
@test NLH.rank((K, T, 9, 7, 3)) == 6891 # King-High
@test NLH.rank((K, T, 9, 7, 2)) == 6892 # King-High
@test NLH.rank((K, T, 9, 6, 5)) == 6893 # King-High
@test NLH.rank((K, T, 9, 6, 4)) == 6894 # King-High
@test NLH.rank((K, T, 9, 6, 3)) == 6895 # King-High
@test NLH.rank((K, T, 9, 6, 2)) == 6896 # King-High
@test NLH.rank((K, T, 9, 5, 4)) == 6897 # King-High
@test NLH.rank((K, T, 9, 5, 3)) == 6898 # King-High
@test NLH.rank((K, T, 9, 5, 2)) == 6899 # King-High
@test NLH.rank((K, T, 9, 4, 3)) == 6900 # King-High
@test NLH.rank((K, T, 9, 4, 2)) == 6901 # King-High
@test NLH.rank((K, T, 9, 3, 2)) == 6902 # King-High
@test NLH.rank((K, T, 8, 7, 6)) == 6903 # King-High
@test NLH.rank((K, T, 8, 7, 5)) == 6904 # King-High
@test NLH.rank((K, T, 8, 7, 4)) == 6905 # King-High
@test NLH.rank((K, T, 8, 7, 3)) == 6906 # King-High
@test NLH.rank((K, T, 8, 7, 2)) == 6907 # King-High
@test NLH.rank((K, T, 8, 6, 5)) == 6908 # King-High
@test NLH.rank((K, T, 8, 6, 4)) == 6909 # King-High
@test NLH.rank((K, T, 8, 6, 3)) == 6910 # King-High
@test NLH.rank((K, T, 8, 6, 2)) == 6911 # King-High
@test NLH.rank((K, T, 8, 5, 4)) == 6912 # King-High
@test NLH.rank((K, T, 8, 5, 3)) == 6913 # King-High
@test NLH.rank((K, T, 8, 5, 2)) == 6914 # King-High
@test NLH.rank((K, T, 8, 4, 3)) == 6915 # King-High
@test NLH.rank((K, T, 8, 4, 2)) == 6916 # King-High
@test NLH.rank((K, T, 8, 3, 2)) == 6917 # King-High
@test NLH.rank((K, T, 7, 6, 5)) == 6918 # King-High
@test NLH.rank((K, T, 7, 6, 4)) == 6919 # King-High
@test NLH.rank((K, T, 7, 6, 3)) == 6920 # King-High
@test NLH.rank((K, T, 7, 6, 2)) == 6921 # King-High
@test NLH.rank((K, T, 7, 5, 4)) == 6922 # King-High
@test NLH.rank((K, T, 7, 5, 3)) == 6923 # King-High
@test NLH.rank((K, T, 7, 5, 2)) == 6924 # King-High
@test NLH.rank((K, T, 7, 4, 3)) == 6925 # King-High
@test NLH.rank((K, T, 7, 4, 2)) == 6926 # King-High
@test NLH.rank((K, T, 7, 3, 2)) == 6927 # King-High
@test NLH.rank((K, T, 6, 5, 4)) == 6928 # King-High
@test NLH.rank((K, T, 6, 5, 3)) == 6929 # King-High
@test NLH.rank((K, T, 6, 5, 2)) == 6930 # King-High
@test NLH.rank((K, T, 6, 4, 3)) == 6931 # King-High
@test NLH.rank((K, T, 6, 4, 2)) == 6932 # King-High
@test NLH.rank((K, T, 6, 3, 2)) == 6933 # King-High
@test NLH.rank((K, T, 5, 4, 3)) == 6934 # King-High
@test NLH.rank((K, T, 5, 4, 2)) == 6935 # King-High
@test NLH.rank((K, T, 5, 3, 2)) == 6936 # King-High
@test NLH.rank((K, T, 4, 3, 2)) == 6937 # King-High
@test NLH.rank((K, 9, 8, 7, 6)) == 6938 # King-High
@test NLH.rank((K, 9, 8, 7, 5)) == 6939 # King-High
@test NLH.rank((K, 9, 8, 7, 4)) == 6940 # King-High
@test NLH.rank((K, 9, 8, 7, 3)) == 6941 # King-High
@test NLH.rank((K, 9, 8, 7, 2)) == 6942 # King-High
@test NLH.rank((K, 9, 8, 6, 5)) == 6943 # King-High
@test NLH.rank((K, 9, 8, 6, 4)) == 6944 # King-High
@test NLH.rank((K, 9, 8, 6, 3)) == 6945 # King-High
@test NLH.rank((K, 9, 8, 6, 2)) == 6946 # King-High
@test NLH.rank((K, 9, 8, 5, 4)) == 6947 # King-High
@test NLH.rank((K, 9, 8, 5, 3)) == 6948 # King-High
@test NLH.rank((K, 9, 8, 5, 2)) == 6949 # King-High
@test NLH.rank((K, 9, 8, 4, 3)) == 6950 # King-High
@test NLH.rank((K, 9, 8, 4, 2)) == 6951 # King-High
@test NLH.rank((K, 9, 8, 3, 2)) == 6952 # King-High
@test NLH.rank((K, 9, 7, 6, 5)) == 6953 # King-High
@test NLH.rank((K, 9, 7, 6, 4)) == 6954 # King-High
@test NLH.rank((K, 9, 7, 6, 3)) == 6955 # King-High
@test NLH.rank((K, 9, 7, 6, 2)) == 6956 # King-High
@test NLH.rank((K, 9, 7, 5, 4)) == 6957 # King-High
@test NLH.rank((K, 9, 7, 5, 3)) == 6958 # King-High
@test NLH.rank((K, 9, 7, 5, 2)) == 6959 # King-High
@test NLH.rank((K, 9, 7, 4, 3)) == 6960 # King-High
@test NLH.rank((K, 9, 7, 4, 2)) == 6961 # King-High
@test NLH.rank((K, 9, 7, 3, 2)) == 6962 # King-High
@test NLH.rank((K, 9, 6, 5, 4)) == 6963 # King-High
@test NLH.rank((K, 9, 6, 5, 3)) == 6964 # King-High
@test NLH.rank((K, 9, 6, 5, 2)) == 6965 # King-High
@test NLH.rank((K, 9, 6, 4, 3)) == 6966 # King-High
@test NLH.rank((K, 9, 6, 4, 2)) == 6967 # King-High
@test NLH.rank((K, 9, 6, 3, 2)) == 6968 # King-High
@test NLH.rank((K, 9, 5, 4, 3)) == 6969 # King-High
@test NLH.rank((K, 9, 5, 4, 2)) == 6970 # King-High
@test NLH.rank((K, 9, 5, 3, 2)) == 6971 # King-High
@test NLH.rank((K, 9, 4, 3, 2)) == 6972 # King-High
@test NLH.rank((K, 8, 7, 6, 5)) == 6973 # King-High
@test NLH.rank((K, 8, 7, 6, 4)) == 6974 # King-High
@test NLH.rank((K, 8, 7, 6, 3)) == 6975 # King-High
@test NLH.rank((K, 8, 7, 6, 2)) == 6976 # King-High
@test NLH.rank((K, 8, 7, 5, 4)) == 6977 # King-High
@test NLH.rank((K, 8, 7, 5, 3)) == 6978 # King-High
@test NLH.rank((K, 8, 7, 5, 2)) == 6979 # King-High
@test NLH.rank((K, 8, 7, 4, 3)) == 6980 # King-High
@test NLH.rank((K, 8, 7, 4, 2)) == 6981 # King-High
@test NLH.rank((K, 8, 7, 3, 2)) == 6982 # King-High
@test NLH.rank((K, 8, 6, 5, 4)) == 6983 # King-High
@test NLH.rank((K, 8, 6, 5, 3)) == 6984 # King-High
@test NLH.rank((K, 8, 6, 5, 2)) == 6985 # King-High
@test NLH.rank((K, 8, 6, 4, 3)) == 6986 # King-High
@test NLH.rank((K, 8, 6, 4, 2)) == 6987 # King-High
@test NLH.rank((K, 8, 6, 3, 2)) == 6988 # King-High
@test NLH.rank((K, 8, 5, 4, 3)) == 6989 # King-High
@test NLH.rank((K, 8, 5, 4, 2)) == 6990 # King-High
@test NLH.rank((K, 8, 5, 3, 2)) == 6991 # King-High
@test NLH.rank((K, 8, 4, 3, 2)) == 6992 # King-High
@test NLH.rank((K, 7, 6, 5, 4)) == 6993 # King-High
@test NLH.rank((K, 7, 6, 5, 3)) == 6994 # King-High
@test NLH.rank((K, 7, 6, 5, 2)) == 6995 # King-High
@test NLH.rank((K, 7, 6, 4, 3)) == 6996 # King-High
@test NLH.rank((K, 7, 6, 4, 2)) == 6997 # King-High
@test NLH.rank((K, 7, 6, 3, 2)) == 6998 # King-High
@test NLH.rank((K, 7, 5, 4, 3)) == 6999 # King-High
@test NLH.rank((K, 7, 5, 4, 2)) == 7000 # King-High
@test NLH.rank((K, 7, 5, 3, 2)) == 7001 # King-High
@test NLH.rank((K, 7, 4, 3, 2)) == 7002 # King-High
@test NLH.rank((K, 6, 5, 4, 3)) == 7003 # King-High
@test NLH.rank((K, 6, 5, 4, 2)) == 7004 # King-High
@test NLH.rank((K, 6, 5, 3, 2)) == 7005 # King-High
@test NLH.rank((K, 6, 4, 3, 2)) == 7006 # King-High
@test NLH.rank((K, 5, 4, 3, 2)) == 7007 # King-High
@test NLH.rank((Q, J, T, 9, 7)) == 7008 # Queen-High
@test NLH.rank((Q, J, T, 9, 6)) == 7009 # Queen-High
@test NLH.rank((Q, J, T, 9, 5)) == 7010 # Queen-High
@test NLH.rank((Q, J, T, 9, 4)) == 7011 # Queen-High
@test NLH.rank((Q, J, T, 9, 3)) == 7012 # Queen-High
@test NLH.rank((Q, J, T, 9, 2)) == 7013 # Queen-High
@test NLH.rank((Q, J, T, 8, 7)) == 7014 # Queen-High
@test NLH.rank((Q, J, T, 8, 6)) == 7015 # Queen-High
@test NLH.rank((Q, J, T, 8, 5)) == 7016 # Queen-High
@test NLH.rank((Q, J, T, 8, 4)) == 7017 # Queen-High
@test NLH.rank((Q, J, T, 8, 3)) == 7018 # Queen-High
@test NLH.rank((Q, J, T, 8, 2)) == 7019 # Queen-High
@test NLH.rank((Q, J, T, 7, 6)) == 7020 # Queen-High
@test NLH.rank((Q, J, T, 7, 5)) == 7021 # Queen-High
@test NLH.rank((Q, J, T, 7, 4)) == 7022 # Queen-High
@test NLH.rank((Q, J, T, 7, 3)) == 7023 # Queen-High
@test NLH.rank((Q, J, T, 7, 2)) == 7024 # Queen-High
@test NLH.rank((Q, J, T, 6, 5)) == 7025 # Queen-High
@test NLH.rank((Q, J, T, 6, 4)) == 7026 # Queen-High
@test NLH.rank((Q, J, T, 6, 3)) == 7027 # Queen-High
@test NLH.rank((Q, J, T, 6, 2)) == 7028 # Queen-High
@test NLH.rank((Q, J, T, 5, 4)) == 7029 # Queen-High
@test NLH.rank((Q, J, T, 5, 3)) == 7030 # Queen-High
@test NLH.rank((Q, J, T, 5, 2)) == 7031 # Queen-High
@test NLH.rank((Q, J, T, 4, 3)) == 7032 # Queen-High
@test NLH.rank((Q, J, T, 4, 2)) == 7033 # Queen-High
@test NLH.rank((Q, J, T, 3, 2)) == 7034 # Queen-High
@test NLH.rank((Q, J, 9, 8, 7)) == 7035 # Queen-High
@test NLH.rank((Q, J, 9, 8, 6)) == 7036 # Queen-High
@test NLH.rank((Q, J, 9, 8, 5)) == 7037 # Queen-High
@test NLH.rank((Q, J, 9, 8, 4)) == 7038 # Queen-High
@test NLH.rank((Q, J, 9, 8, 3)) == 7039 # Queen-High
@test NLH.rank((Q, J, 9, 8, 2)) == 7040 # Queen-High
@test NLH.rank((Q, J, 9, 7, 6)) == 7041 # Queen-High
@test NLH.rank((Q, J, 9, 7, 5)) == 7042 # Queen-High
@test NLH.rank((Q, J, 9, 7, 4)) == 7043 # Queen-High
@test NLH.rank((Q, J, 9, 7, 3)) == 7044 # Queen-High
@test NLH.rank((Q, J, 9, 7, 2)) == 7045 # Queen-High
@test NLH.rank((Q, J, 9, 6, 5)) == 7046 # Queen-High
@test NLH.rank((Q, J, 9, 6, 4)) == 7047 # Queen-High
@test NLH.rank((Q, J, 9, 6, 3)) == 7048 # Queen-High
@test NLH.rank((Q, J, 9, 6, 2)) == 7049 # Queen-High
@test NLH.rank((Q, J, 9, 5, 4)) == 7050 # Queen-High
@test NLH.rank((Q, J, 9, 5, 3)) == 7051 # Queen-High
@test NLH.rank((Q, J, 9, 5, 2)) == 7052 # Queen-High
@test NLH.rank((Q, J, 9, 4, 3)) == 7053 # Queen-High
@test NLH.rank((Q, J, 9, 4, 2)) == 7054 # Queen-High
@test NLH.rank((Q, J, 9, 3, 2)) == 7055 # Queen-High
@test NLH.rank((Q, J, 8, 7, 6)) == 7056 # Queen-High
@test NLH.rank((Q, J, 8, 7, 5)) == 7057 # Queen-High
@test NLH.rank((Q, J, 8, 7, 4)) == 7058 # Queen-High
@test NLH.rank((Q, J, 8, 7, 3)) == 7059 # Queen-High
@test NLH.rank((Q, J, 8, 7, 2)) == 7060 # Queen-High
@test NLH.rank((Q, J, 8, 6, 5)) == 7061 # Queen-High
@test NLH.rank((Q, J, 8, 6, 4)) == 7062 # Queen-High
@test NLH.rank((Q, J, 8, 6, 3)) == 7063 # Queen-High
@test NLH.rank((Q, J, 8, 6, 2)) == 7064 # Queen-High
@test NLH.rank((Q, J, 8, 5, 4)) == 7065 # Queen-High
@test NLH.rank((Q, J, 8, 5, 3)) == 7066 # Queen-High
@test NLH.rank((Q, J, 8, 5, 2)) == 7067 # Queen-High
@test NLH.rank((Q, J, 8, 4, 3)) == 7068 # Queen-High
@test NLH.rank((Q, J, 8, 4, 2)) == 7069 # Queen-High
@test NLH.rank((Q, J, 8, 3, 2)) == 7070 # Queen-High
@test NLH.rank((Q, J, 7, 6, 5)) == 7071 # Queen-High
@test NLH.rank((Q, J, 7, 6, 4)) == 7072 # Queen-High
@test NLH.rank((Q, J, 7, 6, 3)) == 7073 # Queen-High
@test NLH.rank((Q, J, 7, 6, 2)) == 7074 # Queen-High
@test NLH.rank((Q, J, 7, 5, 4)) == 7075 # Queen-High
@test NLH.rank((Q, J, 7, 5, 3)) == 7076 # Queen-High
@test NLH.rank((Q, J, 7, 5, 2)) == 7077 # Queen-High
@test NLH.rank((Q, J, 7, 4, 3)) == 7078 # Queen-High
@test NLH.rank((Q, J, 7, 4, 2)) == 7079 # Queen-High
@test NLH.rank((Q, J, 7, 3, 2)) == 7080 # Queen-High
@test NLH.rank((Q, J, 6, 5, 4)) == 7081 # Queen-High
@test NLH.rank((Q, J, 6, 5, 3)) == 7082 # Queen-High
@test NLH.rank((Q, J, 6, 5, 2)) == 7083 # Queen-High
@test NLH.rank((Q, J, 6, 4, 3)) == 7084 # Queen-High
@test NLH.rank((Q, J, 6, 4, 2)) == 7085 # Queen-High
@test NLH.rank((Q, J, 6, 3, 2)) == 7086 # Queen-High
@test NLH.rank((Q, J, 5, 4, 3)) == 7087 # Queen-High
@test NLH.rank((Q, J, 5, 4, 2)) == 7088 # Queen-High
@test NLH.rank((Q, J, 5, 3, 2)) == 7089 # Queen-High
@test NLH.rank((Q, J, 4, 3, 2)) == 7090 # Queen-High
@test NLH.rank((Q, T, 9, 8, 7)) == 7091 # Queen-High
@test NLH.rank((Q, T, 9, 8, 6)) == 7092 # Queen-High
@test NLH.rank((Q, T, 9, 8, 5)) == 7093 # Queen-High
@test NLH.rank((Q, T, 9, 8, 4)) == 7094 # Queen-High
@test NLH.rank((Q, T, 9, 8, 3)) == 7095 # Queen-High
@test NLH.rank((Q, T, 9, 8, 2)) == 7096 # Queen-High
@test NLH.rank((Q, T, 9, 7, 6)) == 7097 # Queen-High
@test NLH.rank((Q, T, 9, 7, 5)) == 7098 # Queen-High
@test NLH.rank((Q, T, 9, 7, 4)) == 7099 # Queen-High
@test NLH.rank((Q, T, 9, 7, 3)) == 7100 # Queen-High
@test NLH.rank((Q, T, 9, 7, 2)) == 7101 # Queen-High
@test NLH.rank((Q, T, 9, 6, 5)) == 7102 # Queen-High
@test NLH.rank((Q, T, 9, 6, 4)) == 7103 # Queen-High
@test NLH.rank((Q, T, 9, 6, 3)) == 7104 # Queen-High
@test NLH.rank((Q, T, 9, 6, 2)) == 7105 # Queen-High
@test NLH.rank((Q, T, 9, 5, 4)) == 7106 # Queen-High
@test NLH.rank((Q, T, 9, 5, 3)) == 7107 # Queen-High
@test NLH.rank((Q, T, 9, 5, 2)) == 7108 # Queen-High
@test NLH.rank((Q, T, 9, 4, 3)) == 7109 # Queen-High
@test NLH.rank((Q, T, 9, 4, 2)) == 7110 # Queen-High
@test NLH.rank((Q, T, 9, 3, 2)) == 7111 # Queen-High
@test NLH.rank((Q, T, 8, 7, 6)) == 7112 # Queen-High
@test NLH.rank((Q, T, 8, 7, 5)) == 7113 # Queen-High
@test NLH.rank((Q, T, 8, 7, 4)) == 7114 # Queen-High
@test NLH.rank((Q, T, 8, 7, 3)) == 7115 # Queen-High
@test NLH.rank((Q, T, 8, 7, 2)) == 7116 # Queen-High
@test NLH.rank((Q, T, 8, 6, 5)) == 7117 # Queen-High
@test NLH.rank((Q, T, 8, 6, 4)) == 7118 # Queen-High
@test NLH.rank((Q, T, 8, 6, 3)) == 7119 # Queen-High
@test NLH.rank((Q, T, 8, 6, 2)) == 7120 # Queen-High
@test NLH.rank((Q, T, 8, 5, 4)) == 7121 # Queen-High
@test NLH.rank((Q, T, 8, 5, 3)) == 7122 # Queen-High
@test NLH.rank((Q, T, 8, 5, 2)) == 7123 # Queen-High
@test NLH.rank((Q, T, 8, 4, 3)) == 7124 # Queen-High
@test NLH.rank((Q, T, 8, 4, 2)) == 7125 # Queen-High
@test NLH.rank((Q, T, 8, 3, 2)) == 7126 # Queen-High
@test NLH.rank((Q, T, 7, 6, 5)) == 7127 # Queen-High
@test NLH.rank((Q, T, 7, 6, 4)) == 7128 # Queen-High
@test NLH.rank((Q, T, 7, 6, 3)) == 7129 # Queen-High
@test NLH.rank((Q, T, 7, 6, 2)) == 7130 # Queen-High
@test NLH.rank((Q, T, 7, 5, 4)) == 7131 # Queen-High
@test NLH.rank((Q, T, 7, 5, 3)) == 7132 # Queen-High
@test NLH.rank((Q, T, 7, 5, 2)) == 7133 # Queen-High
@test NLH.rank((Q, T, 7, 4, 3)) == 7134 # Queen-High
@test NLH.rank((Q, T, 7, 4, 2)) == 7135 # Queen-High
@test NLH.rank((Q, T, 7, 3, 2)) == 7136 # Queen-High
@test NLH.rank((Q, T, 6, 5, 4)) == 7137 # Queen-High
@test NLH.rank((Q, T, 6, 5, 3)) == 7138 # Queen-High
@test NLH.rank((Q, T, 6, 5, 2)) == 7139 # Queen-High
@test NLH.rank((Q, T, 6, 4, 3)) == 7140 # Queen-High
@test NLH.rank((Q, T, 6, 4, 2)) == 7141 # Queen-High
@test NLH.rank((Q, T, 6, 3, 2)) == 7142 # Queen-High
@test NLH.rank((Q, T, 5, 4, 3)) == 7143 # Queen-High
@test NLH.rank((Q, T, 5, 4, 2)) == 7144 # Queen-High
@test NLH.rank((Q, T, 5, 3, 2)) == 7145 # Queen-High
@test NLH.rank((Q, T, 4, 3, 2)) == 7146 # Queen-High
@test NLH.rank((Q, 9, 8, 7, 6)) == 7147 # Queen-High
@test NLH.rank((Q, 9, 8, 7, 5)) == 7148 # Queen-High
@test NLH.rank((Q, 9, 8, 7, 4)) == 7149 # Queen-High
@test NLH.rank((Q, 9, 8, 7, 3)) == 7150 # Queen-High
@test NLH.rank((Q, 9, 8, 7, 2)) == 7151 # Queen-High
@test NLH.rank((Q, 9, 8, 6, 5)) == 7152 # Queen-High
@test NLH.rank((Q, 9, 8, 6, 4)) == 7153 # Queen-High
@test NLH.rank((Q, 9, 8, 6, 3)) == 7154 # Queen-High
@test NLH.rank((Q, 9, 8, 6, 2)) == 7155 # Queen-High
@test NLH.rank((Q, 9, 8, 5, 4)) == 7156 # Queen-High
@test NLH.rank((Q, 9, 8, 5, 3)) == 7157 # Queen-High
@test NLH.rank((Q, 9, 8, 5, 2)) == 7158 # Queen-High
@test NLH.rank((Q, 9, 8, 4, 3)) == 7159 # Queen-High
@test NLH.rank((Q, 9, 8, 4, 2)) == 7160 # Queen-High
@test NLH.rank((Q, 9, 8, 3, 2)) == 7161 # Queen-High
@test NLH.rank((Q, 9, 7, 6, 5)) == 7162 # Queen-High
@test NLH.rank((Q, 9, 7, 6, 4)) == 7163 # Queen-High
@test NLH.rank((Q, 9, 7, 6, 3)) == 7164 # Queen-High
@test NLH.rank((Q, 9, 7, 6, 2)) == 7165 # Queen-High
@test NLH.rank((Q, 9, 7, 5, 4)) == 7166 # Queen-High
@test NLH.rank((Q, 9, 7, 5, 3)) == 7167 # Queen-High
@test NLH.rank((Q, 9, 7, 5, 2)) == 7168 # Queen-High
@test NLH.rank((Q, 9, 7, 4, 3)) == 7169 # Queen-High
@test NLH.rank((Q, 9, 7, 4, 2)) == 7170 # Queen-High
@test NLH.rank((Q, 9, 7, 3, 2)) == 7171 # Queen-High
@test NLH.rank((Q, 9, 6, 5, 4)) == 7172 # Queen-High
@test NLH.rank((Q, 9, 6, 5, 3)) == 7173 # Queen-High
@test NLH.rank((Q, 9, 6, 5, 2)) == 7174 # Queen-High
@test NLH.rank((Q, 9, 6, 4, 3)) == 7175 # Queen-High
@test NLH.rank((Q, 9, 6, 4, 2)) == 7176 # Queen-High
@test NLH.rank((Q, 9, 6, 3, 2)) == 7177 # Queen-High
@test NLH.rank((Q, 9, 5, 4, 3)) == 7178 # Queen-High
@test NLH.rank((Q, 9, 5, 4, 2)) == 7179 # Queen-High
@test NLH.rank((Q, 9, 5, 3, 2)) == 7180 # Queen-High
@test NLH.rank((Q, 9, 4, 3, 2)) == 7181 # Queen-High
@test NLH.rank((Q, 8, 7, 6, 5)) == 7182 # Queen-High
@test NLH.rank((Q, 8, 7, 6, 4)) == 7183 # Queen-High
@test NLH.rank((Q, 8, 7, 6, 3)) == 7184 # Queen-High
@test NLH.rank((Q, 8, 7, 6, 2)) == 7185 # Queen-High
@test NLH.rank((Q, 8, 7, 5, 4)) == 7186 # Queen-High
@test NLH.rank((Q, 8, 7, 5, 3)) == 7187 # Queen-High
@test NLH.rank((Q, 8, 7, 5, 2)) == 7188 # Queen-High
@test NLH.rank((Q, 8, 7, 4, 3)) == 7189 # Queen-High
@test NLH.rank((Q, 8, 7, 4, 2)) == 7190 # Queen-High
@test NLH.rank((Q, 8, 7, 3, 2)) == 7191 # Queen-High
@test NLH.rank((Q, 8, 6, 5, 4)) == 7192 # Queen-High
@test NLH.rank((Q, 8, 6, 5, 3)) == 7193 # Queen-High
@test NLH.rank((Q, 8, 6, 5, 2)) == 7194 # Queen-High
@test NLH.rank((Q, 8, 6, 4, 3)) == 7195 # Queen-High
@test NLH.rank((Q, 8, 6, 4, 2)) == 7196 # Queen-High
@test NLH.rank((Q, 8, 6, 3, 2)) == 7197 # Queen-High
@test NLH.rank((Q, 8, 5, 4, 3)) == 7198 # Queen-High
@test NLH.rank((Q, 8, 5, 4, 2)) == 7199 # Queen-High
@test NLH.rank((Q, 8, 5, 3, 2)) == 7200 # Queen-High
@test NLH.rank((Q, 8, 4, 3, 2)) == 7201 # Queen-High
@test NLH.rank((Q, 7, 6, 5, 4)) == 7202 # Queen-High
@test NLH.rank((Q, 7, 6, 5, 3)) == 7203 # Queen-High
@test NLH.rank((Q, 7, 6, 5, 2)) == 7204 # Queen-High
@test NLH.rank((Q, 7, 6, 4, 3)) == 7205 # Queen-High
@test NLH.rank((Q, 7, 6, 4, 2)) == 7206 # Queen-High
@test NLH.rank((Q, 7, 6, 3, 2)) == 7207 # Queen-High
@test NLH.rank((Q, 7, 5, 4, 3)) == 7208 # Queen-High
@test NLH.rank((Q, 7, 5, 4, 2)) == 7209 # Queen-High
@test NLH.rank((Q, 7, 5, 3, 2)) == 7210 # Queen-High
@test NLH.rank((Q, 7, 4, 3, 2)) == 7211 # Queen-High
@test NLH.rank((Q, 6, 5, 4, 3)) == 7212 # Queen-High
@test NLH.rank((Q, 6, 5, 4, 2)) == 7213 # Queen-High
@test NLH.rank((Q, 6, 5, 3, 2)) == 7214 # Queen-High
@test NLH.rank((Q, 6, 4, 3, 2)) == 7215 # Queen-High
@test NLH.rank((Q, 5, 4, 3, 2)) == 7216 # Queen-High
@test NLH.rank((J, T, 9, 8, 6)) == 7217 # Jack-High
@test NLH.rank((J, T, 9, 8, 5)) == 7218 # Jack-High
@test NLH.rank((J, T, 9, 8, 4)) == 7219 # Jack-High
@test NLH.rank((J, T, 9, 8, 3)) == 7220 # Jack-High
@test NLH.rank((J, T, 9, 8, 2)) == 7221 # Jack-High
@test NLH.rank((J, T, 9, 7, 6)) == 7222 # Jack-High
@test NLH.rank((J, T, 9, 7, 5)) == 7223 # Jack-High
@test NLH.rank((J, T, 9, 7, 4)) == 7224 # Jack-High
@test NLH.rank((J, T, 9, 7, 3)) == 7225 # Jack-High
@test NLH.rank((J, T, 9, 7, 2)) == 7226 # Jack-High
@test NLH.rank((J, T, 9, 6, 5)) == 7227 # Jack-High
@test NLH.rank((J, T, 9, 6, 4)) == 7228 # Jack-High
@test NLH.rank((J, T, 9, 6, 3)) == 7229 # Jack-High
@test NLH.rank((J, T, 9, 6, 2)) == 7230 # Jack-High
@test NLH.rank((J, T, 9, 5, 4)) == 7231 # Jack-High
@test NLH.rank((J, T, 9, 5, 3)) == 7232 # Jack-High
@test NLH.rank((J, T, 9, 5, 2)) == 7233 # Jack-High
@test NLH.rank((J, T, 9, 4, 3)) == 7234 # Jack-High
@test NLH.rank((J, T, 9, 4, 2)) == 7235 # Jack-High
@test NLH.rank((J, T, 9, 3, 2)) == 7236 # Jack-High
@test NLH.rank((J, T, 8, 7, 6)) == 7237 # Jack-High
@test NLH.rank((J, T, 8, 7, 5)) == 7238 # Jack-High
@test NLH.rank((J, T, 8, 7, 4)) == 7239 # Jack-High
@test NLH.rank((J, T, 8, 7, 3)) == 7240 # Jack-High
@test NLH.rank((J, T, 8, 7, 2)) == 7241 # Jack-High
@test NLH.rank((J, T, 8, 6, 5)) == 7242 # Jack-High
@test NLH.rank((J, T, 8, 6, 4)) == 7243 # Jack-High
@test NLH.rank((J, T, 8, 6, 3)) == 7244 # Jack-High
@test NLH.rank((J, T, 8, 6, 2)) == 7245 # Jack-High
@test NLH.rank((J, T, 8, 5, 4)) == 7246 # Jack-High
@test NLH.rank((J, T, 8, 5, 3)) == 7247 # Jack-High
@test NLH.rank((J, T, 8, 5, 2)) == 7248 # Jack-High
@test NLH.rank((J, T, 8, 4, 3)) == 7249 # Jack-High
@test NLH.rank((J, T, 8, 4, 2)) == 7250 # Jack-High
@test NLH.rank((J, T, 8, 3, 2)) == 7251 # Jack-High
@test NLH.rank((J, T, 7, 6, 5)) == 7252 # Jack-High
@test NLH.rank((J, T, 7, 6, 4)) == 7253 # Jack-High
@test NLH.rank((J, T, 7, 6, 3)) == 7254 # Jack-High
@test NLH.rank((J, T, 7, 6, 2)) == 7255 # Jack-High
@test NLH.rank((J, T, 7, 5, 4)) == 7256 # Jack-High
@test NLH.rank((J, T, 7, 5, 3)) == 7257 # Jack-High
@test NLH.rank((J, T, 7, 5, 2)) == 7258 # Jack-High
@test NLH.rank((J, T, 7, 4, 3)) == 7259 # Jack-High
@test NLH.rank((J, T, 7, 4, 2)) == 7260 # Jack-High
@test NLH.rank((J, T, 7, 3, 2)) == 7261 # Jack-High
@test NLH.rank((J, T, 6, 5, 4)) == 7262 # Jack-High
@test NLH.rank((J, T, 6, 5, 3)) == 7263 # Jack-High
@test NLH.rank((J, T, 6, 5, 2)) == 7264 # Jack-High
@test NLH.rank((J, T, 6, 4, 3)) == 7265 # Jack-High
@test NLH.rank((J, T, 6, 4, 2)) == 7266 # Jack-High
@test NLH.rank((J, T, 6, 3, 2)) == 7267 # Jack-High
@test NLH.rank((J, T, 5, 4, 3)) == 7268 # Jack-High
@test NLH.rank((J, T, 5, 4, 2)) == 7269 # Jack-High
@test NLH.rank((J, T, 5, 3, 2)) == 7270 # Jack-High
@test NLH.rank((J, T, 4, 3, 2)) == 7271 # Jack-High
@test NLH.rank((J, 9, 8, 7, 6)) == 7272 # Jack-High
@test NLH.rank((J, 9, 8, 7, 5)) == 7273 # Jack-High
@test NLH.rank((J, 9, 8, 7, 4)) == 7274 # Jack-High
@test NLH.rank((J, 9, 8, 7, 3)) == 7275 # Jack-High
@test NLH.rank((J, 9, 8, 7, 2)) == 7276 # Jack-High
@test NLH.rank((J, 9, 8, 6, 5)) == 7277 # Jack-High
@test NLH.rank((J, 9, 8, 6, 4)) == 7278 # Jack-High
@test NLH.rank((J, 9, 8, 6, 3)) == 7279 # Jack-High
@test NLH.rank((J, 9, 8, 6, 2)) == 7280 # Jack-High
@test NLH.rank((J, 9, 8, 5, 4)) == 7281 # Jack-High
@test NLH.rank((J, 9, 8, 5, 3)) == 7282 # Jack-High
@test NLH.rank((J, 9, 8, 5, 2)) == 7283 # Jack-High
@test NLH.rank((J, 9, 8, 4, 3)) == 7284 # Jack-High
@test NLH.rank((J, 9, 8, 4, 2)) == 7285 # Jack-High
@test NLH.rank((J, 9, 8, 3, 2)) == 7286 # Jack-High
@test NLH.rank((J, 9, 7, 6, 5)) == 7287 # Jack-High
@test NLH.rank((J, 9, 7, 6, 4)) == 7288 # Jack-High
@test NLH.rank((J, 9, 7, 6, 3)) == 7289 # Jack-High
@test NLH.rank((J, 9, 7, 6, 2)) == 7290 # Jack-High
@test NLH.rank((J, 9, 7, 5, 4)) == 7291 # Jack-High
@test NLH.rank((J, 9, 7, 5, 3)) == 7292 # Jack-High
@test NLH.rank((J, 9, 7, 5, 2)) == 7293 # Jack-High
@test NLH.rank((J, 9, 7, 4, 3)) == 7294 # Jack-High
@test NLH.rank((J, 9, 7, 4, 2)) == 7295 # Jack-High
@test NLH.rank((J, 9, 7, 3, 2)) == 7296 # Jack-High
@test NLH.rank((J, 9, 6, 5, 4)) == 7297 # Jack-High
@test NLH.rank((J, 9, 6, 5, 3)) == 7298 # Jack-High
@test NLH.rank((J, 9, 6, 5, 2)) == 7299 # Jack-High
@test NLH.rank((J, 9, 6, 4, 3)) == 7300 # Jack-High
@test NLH.rank((J, 9, 6, 4, 2)) == 7301 # Jack-High
@test NLH.rank((J, 9, 6, 3, 2)) == 7302 # Jack-High
@test NLH.rank((J, 9, 5, 4, 3)) == 7303 # Jack-High
@test NLH.rank((J, 9, 5, 4, 2)) == 7304 # Jack-High
@test NLH.rank((J, 9, 5, 3, 2)) == 7305 # Jack-High
@test NLH.rank((J, 9, 4, 3, 2)) == 7306 # Jack-High
@test NLH.rank((J, 8, 7, 6, 5)) == 7307 # Jack-High
@test NLH.rank((J, 8, 7, 6, 4)) == 7308 # Jack-High
@test NLH.rank((J, 8, 7, 6, 3)) == 7309 # Jack-High
@test NLH.rank((J, 8, 7, 6, 2)) == 7310 # Jack-High
@test NLH.rank((J, 8, 7, 5, 4)) == 7311 # Jack-High
@test NLH.rank((J, 8, 7, 5, 3)) == 7312 # Jack-High
@test NLH.rank((J, 8, 7, 5, 2)) == 7313 # Jack-High
@test NLH.rank((J, 8, 7, 4, 3)) == 7314 # Jack-High
@test NLH.rank((J, 8, 7, 4, 2)) == 7315 # Jack-High
@test NLH.rank((J, 8, 7, 3, 2)) == 7316 # Jack-High
@test NLH.rank((J, 8, 6, 5, 4)) == 7317 # Jack-High
@test NLH.rank((J, 8, 6, 5, 3)) == 7318 # Jack-High
@test NLH.rank((J, 8, 6, 5, 2)) == 7319 # Jack-High
@test NLH.rank((J, 8, 6, 4, 3)) == 7320 # Jack-High
@test NLH.rank((J, 8, 6, 4, 2)) == 7321 # Jack-High
@test NLH.rank((J, 8, 6, 3, 2)) == 7322 # Jack-High
@test NLH.rank((J, 8, 5, 4, 3)) == 7323 # Jack-High
@test NLH.rank((J, 8, 5, 4, 2)) == 7324 # Jack-High
@test NLH.rank((J, 8, 5, 3, 2)) == 7325 # Jack-High
@test NLH.rank((J, 8, 4, 3, 2)) == 7326 # Jack-High
@test NLH.rank((J, 7, 6, 5, 4)) == 7327 # Jack-High
@test NLH.rank((J, 7, 6, 5, 3)) == 7328 # Jack-High
@test NLH.rank((J, 7, 6, 5, 2)) == 7329 # Jack-High
@test NLH.rank((J, 7, 6, 4, 3)) == 7330 # Jack-High
@test NLH.rank((J, 7, 6, 4, 2)) == 7331 # Jack-High
@test NLH.rank((J, 7, 6, 3, 2)) == 7332 # Jack-High
@test NLH.rank((J, 7, 5, 4, 3)) == 7333 # Jack-High
@test NLH.rank((J, 7, 5, 4, 2)) == 7334 # Jack-High
@test NLH.rank((J, 7, 5, 3, 2)) == 7335 # Jack-High
@test NLH.rank((J, 7, 4, 3, 2)) == 7336 # Jack-High
@test NLH.rank((J, 6, 5, 4, 3)) == 7337 # Jack-High
@test NLH.rank((J, 6, 5, 4, 2)) == 7338 # Jack-High
@test NLH.rank((J, 6, 5, 3, 2)) == 7339 # Jack-High
@test NLH.rank((J, 6, 4, 3, 2)) == 7340 # Jack-High
@test NLH.rank((J, 5, 4, 3, 2)) == 7341 # Jack-High
@test NLH.rank((T, 9, 8, 7, 5)) == 7342 # Ten-High
@test NLH.rank((T, 9, 8, 7, 4)) == 7343 # Ten-High
@test NLH.rank((T, 9, 8, 7, 3)) == 7344 # Ten-High
@test NLH.rank((T, 9, 8, 7, 2)) == 7345 # Ten-High
@test NLH.rank((T, 9, 8, 6, 5)) == 7346 # Ten-High
@test NLH.rank((T, 9, 8, 6, 4)) == 7347 # Ten-High
@test NLH.rank((T, 9, 8, 6, 3)) == 7348 # Ten-High
@test NLH.rank((T, 9, 8, 6, 2)) == 7349 # Ten-High
@test NLH.rank((T, 9, 8, 5, 4)) == 7350 # Ten-High
@test NLH.rank((T, 9, 8, 5, 3)) == 7351 # Ten-High
@test NLH.rank((T, 9, 8, 5, 2)) == 7352 # Ten-High
@test NLH.rank((T, 9, 8, 4, 3)) == 7353 # Ten-High
@test NLH.rank((T, 9, 8, 4, 2)) == 7354 # Ten-High
@test NLH.rank((T, 9, 8, 3, 2)) == 7355 # Ten-High
@test NLH.rank((T, 9, 7, 6, 5)) == 7356 # Ten-High
@test NLH.rank((T, 9, 7, 6, 4)) == 7357 # Ten-High
@test NLH.rank((T, 9, 7, 6, 3)) == 7358 # Ten-High
@test NLH.rank((T, 9, 7, 6, 2)) == 7359 # Ten-High
@test NLH.rank((T, 9, 7, 5, 4)) == 7360 # Ten-High
@test NLH.rank((T, 9, 7, 5, 3)) == 7361 # Ten-High
@test NLH.rank((T, 9, 7, 5, 2)) == 7362 # Ten-High
@test NLH.rank((T, 9, 7, 4, 3)) == 7363 # Ten-High
@test NLH.rank((T, 9, 7, 4, 2)) == 7364 # Ten-High
@test NLH.rank((T, 9, 7, 3, 2)) == 7365 # Ten-High
@test NLH.rank((T, 9, 6, 5, 4)) == 7366 # Ten-High
@test NLH.rank((T, 9, 6, 5, 3)) == 7367 # Ten-High
@test NLH.rank((T, 9, 6, 5, 2)) == 7368 # Ten-High
@test NLH.rank((T, 9, 6, 4, 3)) == 7369 # Ten-High
@test NLH.rank((T, 9, 6, 4, 2)) == 7370 # Ten-High
@test NLH.rank((T, 9, 6, 3, 2)) == 7371 # Ten-High
@test NLH.rank((T, 9, 5, 4, 3)) == 7372 # Ten-High
@test NLH.rank((T, 9, 5, 4, 2)) == 7373 # Ten-High
@test NLH.rank((T, 9, 5, 3, 2)) == 7374 # Ten-High
@test NLH.rank((T, 9, 4, 3, 2)) == 7375 # Ten-High
@test NLH.rank((T, 8, 7, 6, 5)) == 7376 # Ten-High
@test NLH.rank((T, 8, 7, 6, 4)) == 7377 # Ten-High
@test NLH.rank((T, 8, 7, 6, 3)) == 7378 # Ten-High
@test NLH.rank((T, 8, 7, 6, 2)) == 7379 # Ten-High
@test NLH.rank((T, 8, 7, 5, 4)) == 7380 # Ten-High
@test NLH.rank((T, 8, 7, 5, 3)) == 7381 # Ten-High
@test NLH.rank((T, 8, 7, 5, 2)) == 7382 # Ten-High
@test NLH.rank((T, 8, 7, 4, 3)) == 7383 # Ten-High
@test NLH.rank((T, 8, 7, 4, 2)) == 7384 # Ten-High
@test NLH.rank((T, 8, 7, 3, 2)) == 7385 # Ten-High
@test NLH.rank((T, 8, 6, 5, 4)) == 7386 # Ten-High
@test NLH.rank((T, 8, 6, 5, 3)) == 7387 # Ten-High
@test NLH.rank((T, 8, 6, 5, 2)) == 7388 # Ten-High
@test NLH.rank((T, 8, 6, 4, 3)) == 7389 # Ten-High
@test NLH.rank((T, 8, 6, 4, 2)) == 7390 # Ten-High
@test NLH.rank((T, 8, 6, 3, 2)) == 7391 # Ten-High
@test NLH.rank((T, 8, 5, 4, 3)) == 7392 # Ten-High
@test NLH.rank((T, 8, 5, 4, 2)) == 7393 # Ten-High
@test NLH.rank((T, 8, 5, 3, 2)) == 7394 # Ten-High
@test NLH.rank((T, 8, 4, 3, 2)) == 7395 # Ten-High
@test NLH.rank((T, 7, 6, 5, 4)) == 7396 # Ten-High
@test NLH.rank((T, 7, 6, 5, 3)) == 7397 # Ten-High
@test NLH.rank((T, 7, 6, 5, 2)) == 7398 # Ten-High
@test NLH.rank((T, 7, 6, 4, 3)) == 7399 # Ten-High
@test NLH.rank((T, 7, 6, 4, 2)) == 7400 # Ten-High
@test NLH.rank((T, 7, 6, 3, 2)) == 7401 # Ten-High
@test NLH.rank((T, 7, 5, 4, 3)) == 7402 # Ten-High
@test NLH.rank((T, 7, 5, 4, 2)) == 7403 # Ten-High
@test NLH.rank((T, 7, 5, 3, 2)) == 7404 # Ten-High
@test NLH.rank((T, 7, 4, 3, 2)) == 7405 # Ten-High
@test NLH.rank((T, 6, 5, 4, 3)) == 7406 # Ten-High
@test NLH.rank((T, 6, 5, 4, 2)) == 7407 # Ten-High
@test NLH.rank((T, 6, 5, 3, 2)) == 7408 # Ten-High
@test NLH.rank((T, 6, 4, 3, 2)) == 7409 # Ten-High
@test NLH.rank((T, 5, 4, 3, 2)) == 7410 # Ten-High
@test NLH.rank((9, 8, 7, 6, 4)) == 7411 # Nine-High
@test NLH.rank((9, 8, 7, 6, 3)) == 7412 # Nine-High
@test NLH.rank((9, 8, 7, 6, 2)) == 7413 # Nine-High
@test NLH.rank((9, 8, 7, 5, 4)) == 7414 # Nine-High
@test NLH.rank((9, 8, 7, 5, 3)) == 7415 # Nine-High
@test NLH.rank((9, 8, 7, 5, 2)) == 7416 # Nine-High
@test NLH.rank((9, 8, 7, 4, 3)) == 7417 # Nine-High
@test NLH.rank((9, 8, 7, 4, 2)) == 7418 # Nine-High
@test NLH.rank((9, 8, 7, 3, 2)) == 7419 # Nine-High
@test NLH.rank((9, 8, 6, 5, 4)) == 7420 # Nine-High
@test NLH.rank((9, 8, 6, 5, 3)) == 7421 # Nine-High
@test NLH.rank((9, 8, 6, 5, 2)) == 7422 # Nine-High
@test NLH.rank((9, 8, 6, 4, 3)) == 7423 # Nine-High
@test NLH.rank((9, 8, 6, 4, 2)) == 7424 # Nine-High
@test NLH.rank((9, 8, 6, 3, 2)) == 7425 # Nine-High
@test NLH.rank((9, 8, 5, 4, 3)) == 7426 # Nine-High
@test NLH.rank((9, 8, 5, 4, 2)) == 7427 # Nine-High
@test NLH.rank((9, 8, 5, 3, 2)) == 7428 # Nine-High
@test NLH.rank((9, 8, 4, 3, 2)) == 7429 # Nine-High
@test NLH.rank((9, 7, 6, 5, 4)) == 7430 # Nine-High
@test NLH.rank((9, 7, 6, 5, 3)) == 7431 # Nine-High
@test NLH.rank((9, 7, 6, 5, 2)) == 7432 # Nine-High
@test NLH.rank((9, 7, 6, 4, 3)) == 7433 # Nine-High
@test NLH.rank((9, 7, 6, 4, 2)) == 7434 # Nine-High
@test NLH.rank((9, 7, 6, 3, 2)) == 7435 # Nine-High
@test NLH.rank((9, 7, 5, 4, 3)) == 7436 # Nine-High
@test NLH.rank((9, 7, 5, 4, 2)) == 7437 # Nine-High
@test NLH.rank((9, 7, 5, 3, 2)) == 7438 # Nine-High
@test NLH.rank((9, 7, 4, 3, 2)) == 7439 # Nine-High
@test NLH.rank((9, 6, 5, 4, 3)) == 7440 # Nine-High
@test NLH.rank((9, 6, 5, 4, 2)) == 7441 # Nine-High
@test NLH.rank((9, 6, 5, 3, 2)) == 7442 # Nine-High
@test NLH.rank((9, 6, 4, 3, 2)) == 7443 # Nine-High
@test NLH.rank((9, 5, 4, 3, 2)) == 7444 # Nine-High
@test NLH.rank((8, 7, 6, 5, 3)) == 7445 # Eight-High
@test NLH.rank((8, 7, 6, 5, 2)) == 7446 # Eight-High
@test NLH.rank((8, 7, 6, 4, 3)) == 7447 # Eight-High
@test NLH.rank((8, 7, 6, 4, 2)) == 7448 # Eight-High
@test NLH.rank((8, 7, 6, 3, 2)) == 7449 # Eight-High
@test NLH.rank((8, 7, 5, 4, 3)) == 7450 # Eight-High
@test NLH.rank((8, 7, 5, 4, 2)) == 7451 # Eight-High
@test NLH.rank((8, 7, 5, 3, 2)) == 7452 # Eight-High
@test NLH.rank((8, 7, 4, 3, 2)) == 7453 # Eight-High
@test NLH.rank((8, 6, 5, 4, 3)) == 7454 # Eight-High
@test NLH.rank((8, 6, 5, 4, 2)) == 7455 # Eight-High
@test NLH.rank((8, 6, 5, 3, 2)) == 7456 # Eight-High
@test NLH.rank((8, 6, 4, 3, 2)) == 7457 # Eight-High
@test NLH.rank((8, 5, 4, 3, 2)) == 7458 # Eight-High
@test NLH.rank((7, 6, 5, 4, 2)) == 7459 # Seven-High
@test NLH.rank((7, 6, 5, 3, 2)) == 7460 # Seven-High
@test NLH.rank((7, 6, 4, 3, 2)) == 7461 # Seven-High
@test NLH.rank((7, 5, 4, 3, 2)) == 7462 # Seven-High