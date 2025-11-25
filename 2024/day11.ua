~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 11

Sample ← "125 17"
Parse  ← ⊜⋕⊸≠@ 

# ====== PART 1 ======
Parse Input
SplitEven ← ⍜°⋕(⊟⊃↙↘÷2⊸⧻)
ByLen     ← ⨬(×₂₀₂₄|SplitEven)=0◿2⧻⊸°⋕
Stoner    ← ⨬(ByLen|⋅1)⊸=0
Blink     ← /◇⊂⍚memoStoner
# ⍜now(⧻⍥Blink25)
199982◌
$part₁
# ====== PART 2 ======
Parse Input
⧻⍥Blink75
$part₂
