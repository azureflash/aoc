(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2023/day/3/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
| &fras
) &fe. "day3.txt"
# Part 1
# 1. Mask of digits and symbols
# 2. Build a mask of digits next to symbols
# 3. Build a mask of digits that are in a 
#    group with symbol-neighboring digits ?
↯⊂. ⊙(▽≠@\n.) ⊗@\n.
↥×⊃(≠@.|<@0|>@9).
⍥↥7⊃(↻1_¯1|↻¯1_1|↻¯1_¯1|↻1_1|↻¯1_0|↻1_0|↻0_1|↻0_¯1)
⊙(×⊃(≤@9)(≥@0).)
∩♭
⊙(⊜□⊙♭)
# TODO: Can I do a (scan max of symbol neighbor table) operation for each number partition?
# idea: keep the neighbor mask table based on numbers mask