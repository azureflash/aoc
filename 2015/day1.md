I initially solved this to prepare for doing Advent of Code 2024 in Uiua. It pretty much needs to be rewritten.

The first obvious thing to do is to assign parentheses a value of -1 or +1. Parentheses are at code 40 and 41, but we need them to be 2 apart (like 1 and -1) which leads to some annoying arithmetic.

Looks like a simple select is what I need, but I need to filter to have only parentheses. Keep by member of "()" is how to do that. It practically says what it does, very beautiful pattern!

Then classify the parentheses, backwards select with 1 at index 0 and ¯1 at index 1, and we have our array.

For the second part, my solution was to find the index of the first ¯1 and add one to get the position. This was automatically replaced by backwards indexin (indexof was deprecated). Doesn't seem like there's much to do here.
