(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2015/day/3/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
  &fras
|&fras) &fe. "day3.txt"
# Reformulation: compute all visited coordinates
# on the 2D grid and count the unique ones
# 
# What first came to mind:
# For each symbol, update the position
# After updating position, add to a 2D table showing
# how many times each coordinate has been visited
# Count how many coordinates are non-zero
# (problems: handling negative positions, unknown size)
# 
# A more array approach:
# Turn each symbol into a movement vector [x y]
# Perform a scan addition on the movement vectors
#   to make a list of visited coordinates
# Count unique visited coordinates
A ← +1⧻⊝\+⊏:[0_1 1_0 0_¯1 ¯1_0]⊗:[@^ @> @v @<]
Visited ← \+⊏:[0_1 1_0 0_¯1 ¯1_0]⊗:[@^ @> @v @<]

# Part B: separate the instructions into odds and evens
# Avoid counting [0 0] twice by adding it before dedup
# this remove the need to +1 at the end
⧻⊝⊂[0 0]⊂⊃(Visited▽)(Visited▽¬)◿2⇡⧻.
