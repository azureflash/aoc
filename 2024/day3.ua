~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 3
"xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
Sample ←

# ====== PART 1 ======
Input
# Sample
regex "mul\\((\\d+),(\\d+)\\)"
/+≡/×⋕≡(↘₁)

$part₁
# ====== PART 2 ======
"xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
Sample ←
Input
⬚0regex "mul\\((\\d+),(\\d+)\\)|(do(n\\'t)?\\(\\))"
⊸≡(◇↙₃⊢)
≡⊗:¤["don" "mul" "do("]
▽¬\<-1
≡(↙₂↘₁)
∵⍣⋕
°□/+≡/×
$part₂
