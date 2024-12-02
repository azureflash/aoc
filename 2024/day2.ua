~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 2
$ 7 6 4 2 1
$ 1 2 7 8 9
$ 9 7 6 2 1
$ 1 3 2 4 5
$ 8 6 4 4 1
$ 1 3 6 7 9
Sample ←

# ====== PART 1 ======
# Input
Input
Parse ← ⍚⊜⋕⊸≠@ ⊜□⊸≠@\n
Parse
Safe ← ×⊃(
  ⍚(/↧×⊃(≥1|≤3)⌵)
| ⍚(=1⧻◴±)
)⍚(≡/-◫2)
Safe
°□/+

$part₁
# ====== PART 2 ======
Input
Parse

≡⍉⊸×⊸⍚(⊞≠.⇡⧻)
⍚(⍚▽⊸≡≠0)
⍚Safe
⍚/↥
⊙Safe
°□
↥
°□°□/+

$part₂
