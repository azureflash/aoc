# Experimental!
&fras "/home/azure/Dev/Uiua/aoc/2015/day7.txt"
Parse    ← ⊸⨬(get|⋕)<₁₀/↥⊸-@0
DetectFn ← ⬚5⊢⊚≡(/↥◇⌕){"NOT" "AND" "OR" "LSHIFT" "RSHIFT"}¤
ExecLine ← ⨬(
  ˜insert⍜⋯¬Parse°$"NOT _ -> _"
| ˜insert°⋯₁₆×∩(⋯₁₆Parse)°$"_ AND _ -> _"
| ˜insert°⋯₁₆±+∩(⋯₁₆Parse)°$"_ OR _ -> _"
| ˜insert⍜⋯˜(↻¯)∩Parse°$"_ LSHIFT _ -> _"
| ˜insert⍜⋯˜↻∩Parse°$"_ RSHIFT _ -> _"
| ˜insert?Parse?°$"_ -> _"
)⊸DetectFn

[]
ExecLine "8 AND 2 -> x"

⊃($PartA|$PartB)
