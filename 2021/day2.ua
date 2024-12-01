# Experimental!
&fras "day2.txt"
DirectionNames  ← {"forward" "down" "up"}
DirectionValues ← [1_0 0_1 0_¯1]
DirNameToVal    ← ⊡ :DirectionValues ⊗ :DirectionNames □
⊜□⊸≠@\n                     # Parse lines
≡(⊓(DirNameToVal|⋕)°$"_ _") # Turn lines into x and move (0:fw, 1:dwn, 2: up)
×
/+
/×
