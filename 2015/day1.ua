# Experimental!
&fras "/home/azure/Dev/Uiua/aoc/2015/day1.txt"
# Make array where ( is worth 1 and ) is worth ¯1, add together and scan add
\+ ˜⊏ 1_¯1 ⊛ ▽⊸∊"()"

# Final floor: pick last element
a ← ⊣
# Index of first basement visit (add 1 because we want position not index)
b ← +1˜⨂¯1
# Fork of both solutions to show only answers
⊃($PartA a|$PartB b)
