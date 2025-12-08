$ 3-5
$ 10-14
$ 16-20
$ 12-18
$ 
$ 1
$ 5
$ 8
$ 11
$ 17
$ 32
&fras $"/home/azure/Dev/Uiua/aoc/2025/_.txt" °$"_.ua"⊢&args◌

°⊟⇌⊜□¬⊸⦷"\n\n"      # Split the halves
◇⊜⋕⊸≠@\n            # Bottom half (top arg) is a list of ingredient IDs
⊙(↯∞_2⊜⋕¬⊸∊"-\n"°□) # Upper half (bottom arg) is mins and maxes

⊃($PartA ⧻▽≡/↥⤚≡⌟(≡(×⊓⌞(≤|≥)⊙⍜⍉°⊟)) # Count fresh ingredients
| ≥⬚0↻₁⊸⍜⍉(⊃⊢⊣)⍆                    # Get rid of ingredient list and find overlaps
  ⊂⊃(⊜(⍜⍉(⊂⊃(/↧⊢|/↥⊣)))|▽¬)         # fuse overlaps
  $PartB /++₁-⍜⍉°⊟                  # Count size of ranges
)
