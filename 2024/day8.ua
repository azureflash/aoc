# Experimental!
~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 8
$ ............
$ ........0...
$ ....#0......
$ .......0....
$ ....0.......
$ ......A.....
$ ............
$ ............
$ ........A...
$ .........A..
$ ............
$ ............
Sample ←
Parse  ← ⊜∘⊸≠@\n

# ====== PART 1 ======
Parse Sample
# List all antenna types present in the map
▽⊸≠@.◴⊸♭
# Get lists of positions of all antennas for each type
⊚◇∵⌕ ⊙¤
# Treat coordinates of all antennas separately
⊜□+1⊃≡⊢≡↘₁
# In each group, for all pairs of antennas (table!), calculate
# the distance between the two, and the antinodes... maybe use vector magic?
°□⊣
▽¬≡/↥:⟜⊞≍◴♭₂⊸⊞-≡/-⊸⧅> 2

# $part₁
# ====== PART 2 ======

# $part₂
