&fras $"/home/azure/Dev/Uiua/aoc/2025/_.txt" °$"_.ua"⊢&args
˜⊏[0 1 ∞]⊜(⨂".S^")⊸≠@\n
\(
  ⍜▽¯=₁              # Negate cells hit by beams
  ⍜▽(1◌)⌕{"-0"}⊸°⋕   # Replace -0 by beams
  ⍜⊏(1◌)◴♭≡⌞+A₁⊚⊸=¯∞ # Add beams next to hit splitters
)
⊃($PartA
  /+=¯∞♭ # Count number of hit splitters
| $PartB)
