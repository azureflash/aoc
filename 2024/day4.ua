# Experimental!
~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 4
$ MMMSXXMASM
$ MSAMXMSMSA
$ AMXSXMAAMM
$ MSAMASMSMX
$ XMASAMXAMM
$ XXAMMXXAMA
$ SMSMSASXSS
$ SAXAMASAAA
$ MAMMMXMMMM
$ MXMXAXMASX
Sample ←
Parse  ← ⊜∘⊸≠@\n

# ====== PART 1 ======
Input
Parse
# Diag
# (N)egative/(P)ositive, (U)pper/(L)ower diagonals
# N/P : Negative \ and positive / diagonals
# U/L : lower diagonals -> remove top row, antirotate
#       from len (after dropping top row) to 0
# Apply fill for overflow to all of these
# NU: rotate by 0 to n
# NL: antirotate by n to 0
# PU: antirotate by 0 to n
# PL: rotate by n to 0
H             ← ⌕"XMAS"
HRev          ← ⌕"SAMX"
V             ← ⍜⍉(⌕"XMAS")
VRev          ← ⍜⍉(⌕"SAMX")
NUDiagonalize ← ◌⍢(+1 ⊙↻₁⍜⊙⊢⟜⬚@_↻|<:⊙⧻)0
NLDiagonalize ← ◌⍢(-1 ⊙↻₁⍜⊙⊢⟜⬚@_⌝↻|>₀)⊸⧻
PUDiagonalize ← ◌⍢(+1 ⊙↻₁⍜⊙⊢⟜⬚@_⌝↻|<:⊙⧻)0
PLDiagonalize ← ◌⍢(-1 ⊙↻₁⍜⊙⊢⟜⬚@_↻|>₀)⊸⧻
NUDiag        ← V NUDiagonalize
NUDiagRev     ← VRev NUDiagonalize
NLDiag        ← V NLDiagonalize
NLDiagRev     ← VRev NLDiagonalize
PUDiag        ← V PUDiagonalize
PUDiagRev     ← VRev PUDiagonalize
PLDiag        ← V PLDiagonalize
PLDiagRev     ← VRev PLDiagonalize

/+♭⬚0[
  ⊃(H
  | HRev
  | V
  | VRev
  | NUDiag
  | NUDiagRev
  | NLDiag
  | NLDiagRev
  | PUDiag
  | PUDiagRev
  | PLDiag
  | PLDiagRev
  )]

$part₁
# ====== PART 2 ======
Input
Parse
Patt ← [⊸⍉ ⊸≡⇌ ⊸⍉]["M\WM" "\WA\W" "S\WS"]
/+♭≡⌕Patt¤

$part₂
