~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2021 5

# ====== PART 1 ======
Part₁ ← ∘
# Generate a line of 1s given "x1,y1 -> x2,y2"
GenerateCoords ← ⊙◌+¤:⍉⬚0⊟∩⇡+1°⊟◡-°⊟↯2_2⋕{°$"_,_ -> _,_"}
# Generate the list of coords for all coords
$ 0,9 -> 5,9
$ 8,0 -> 0,8
$ 9,4 -> 3,4
$ 2,2 -> 2,1
$ 7,0 -> 7,4
$ 6,4 -> 2,0
$ 0,9 -> 2,9
$ 3,4 -> 1,4
$ 0,0 -> 8,8
$ 5,5 -> 8,2
# Split lines
⊜□⊸≠@\n
# Only consider lines where x1=y1 or x2=y2
# Split coords
▽=0≡/×⍉-⊃↘₂↙₂⍉⋕⊸⍚{°$"_,_ -> _,_"}
⍚GenerateCoords
⬚0⍚/+≡⍚°⊚
# ====== TESTS =======
# ⍤⤙≍ "testsol1" Part₁ "testcase1"

# ======== RUNNING ========
# $"Part one solution is: '_'" Part₁ Input
