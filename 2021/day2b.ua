# Experimental!
0 # horizontal accumulator
0 # depth accumulator
&fras "day2.txt"
# $ forward 5
# $ down 5
# $ forward 8
# $ up 3
# $ down 8
# $ forward 2
DirectionNames ← {"up" "forward" "down"}
DirNameToIdx   ← ⊗ :DirectionNames □
⊜□⊸≠@\n                     # parse lines
≡(⊓(DirNameToIdx|⋕)°$"_ _") # Turn lines into x and move (0:fw, 1:dwn, 2: up)
⊙(\+⊸×)⤙-1                  # Calculate aim at each step
# Switch consumes the vector of moves
# Functions in switch(up|fw|dwn) consume the vectors of x and aim
# And output increments of height and depth
∧(∩+⊙:⨬(0 0|⊸×|0 0))
×
