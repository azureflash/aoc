(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2015/day/2/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
  &fras
|&fras) &fe. "day2.txt"
# [a b c] => 2ab+2bc+2ac + prod of smaller two
# table product of abc: we want to add up one triangle
Presents ← ↯¯1_3⊜parse¬⊙.+⊃(⌕@x)(⌕@\n).
# Presents ← [2_3_4 1_1_10]
# Wrapping paper: 2ab+2ac+2bc + prod of smallest 2
# /+≡(+⊃(/×↙2⊏⍏.)(×2/+♭×⊃(⊞×)(⊞>.⇡3).)) Presents

# Ribbons
# 2*(sum of smallest 2) + /*
/+≡(+⊃(×2/+↙2⊏⍏.)(/×))Presents
