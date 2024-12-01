(
  &tcpc "adventofcode.com:443"
  +@\0↙128↘-128⊢⇌⊚⌕-@\0".adventofcode.com".&frab "C:\\Users\\azure\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\yd8d9ixf.default-release\\cookies.sqlite"
  &httpsw ⊂ "GET /2023/day/1/input HTTP/1.0\nCookie: session="
  ↘+4⊗"\r\n\r\n"◫4.
  &fwa ,
  &fras
| &fras
) &fe. "day1.txt"
Input ← ⊜□≠, @\n
A ← /+≡(parse⊂⊃(⊢)(⊢⇌)▽∊ : +@0⇡10 .⊔)
DigitWords ← {@0 @1 @2 @3 @4 @5 @6 @7 @8 @9 "zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"}
WordToChar ← +@0 ⊗ :DigitWords □
BoxStringToValue ← parse⊂∩(+@0◿10⊢⇌)⊃(⊢)(⊢⇌)⍜(≡⇌)(⊏⍏).⊚⊞(⊐⌕)DigitWords
/+≡(BoxStringToValue ⍜⊔(⬚@ ⊂ "     ")) Input
