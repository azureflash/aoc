# TODO: automatically get year, day and cookie token
?(↘+4⊗"\r\n\r\n"◫4. &fras)(
  &tcpc "adventofcode.com:443"
  &httpsw $ GET /2015/day/1/input HTTP/1.0
          $ Cookie: 
  &fwa ∶
) &fe. "day1.txt"
# Make array where ( is worth 1 and ) is worth ¯1, add together and scan add
\++⊃(=@()(¯=@))
# Final floor: pick last element
a ← ⊡-1⧻.
# Index of first basement visit (add 1 because we want position not index)
b ← +1⊗¯1
# Fork of both solutions to show only answers
⊃a b
