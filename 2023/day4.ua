(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2023/day/4/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
  &fras
| &fras
) &fe. "day4.txt"

# Part 1
# Parse all numbers
# Reshape into rows of 36 numbers
# 1 card id, 10 winning numbers, 25 own numbers
# Drop the card ids
# That's our Cards array!
Cards ← ≡↘1↯¯1_36⊜(parse)×⊃(≥@0)(≤@9).
Cards.
# Count how many winning numbers are in the own numbers
≡(/+<25⊗⊃(↙10)(⍜⇌(↙25)))
/+.≡(ⁿ:2↥0-1).
:
# Part 2
# We start with the list of card points on top of the stack
# For each card, we have to add indices n..n+w
# where n is the current index and 
# w is the number of cards won on that row
# Then select the points value of all the cards won
# from the original array and sum up
⧻∧(⊂+⇡⊃(⊢⇌)(⊢)) :[] ⍉⊟ ⇡⧻ ..
# Eliminate indices over 212 (there are 213 cards)
# For the indexing to work we should keep the zeroes
# Wait no we just need to count the cards won! Length instead of /+
# First attempted answer 7028 too low... not sure why
# Second attempted answer 21127 too low... ??
# I might just not have counted the original 213? Nope