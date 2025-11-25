×0°△1000_1000
Rect ← ≡₁+⇡+₁⤚-
&fras "/home/azure/Dev/Uiua/aoc/2015/day6.txt"
⊜(≡₁↘₁ regex "(.*) (\\d+,\\d+) through (\\d+,\\d+)")⊸≠@\n
◌⍢(
  ⍜⇌°⊂⌟
  ⊙(
    °⊟₃⊢
    ⊙(Rect∩(◇⊜⋕⊸≠@,))
    ⊢⊚˜⌕{"turn on" "turn off" "toggle"}
    # ⍜(⊙⊡|⨬(↥1|↧0|¬))
    ⍜(⊙⊡|⨬(+1|↥0-1|+2))
  )
| >0⧻)
/+♭
