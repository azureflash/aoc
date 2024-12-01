(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2023/day/2/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
  &fras
| &fras
) &fe. "day2.txt"
⊜□≠, @\n
.

# Part one: remove impossible games of each color
# then sum up the game numbers
⊐≡(▽≤12/↥ ≡(parse ?⍜⇌(↘4)) regex "\\d+ red" ⊔).
⊐≡(▽≤13/↥ ≡(parse ⍜⇌(↘6)) regex "\\d+ green" ⊔).
⊐≡(▽≤14/↥ ≡(parse ⍜⇌(↘5)) regex "\\d+ blue" ⊔).
⊐≡(≡(parse ↘5) regex "Game \\d+" ⊔)
⬚0/+
:

# Part two: calculate min of each color for all games
# then multiply R*G*B and sum
dump∘
⊃(
  ⊐≡(/↥ ≡(parse ⍜⇌(↘4)) regex "\\d+ red" ⊔)
| ⊐≡(/↥ ≡(parse ⍜⇌(↘6)) regex "\\d+ green" ⊔)
| ⊐≡(/↥ ≡(parse ⍜⇌(↘5)) regex "\\d+ blue" ⊔)
)
/+××
