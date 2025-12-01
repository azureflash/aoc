# Solving Journal
Taking a quick peek at the problem before going to bed. It talks about a password entered on a dial combination lock. Puzzle input has a list of patterns with L or R for left or right, and a number 0-99. Feels like we'll just be adding these with L/R giving a sign, typical puzzle 1 thing. The dial starts at 50. The fact that it loops around adds a little bit more than just adding. We're being asked how many times the dial points zero while entering the combination.

I think we can build an array starting at 50 and cumulatively applying each rotation.

1. Turn all the rotations into numbers, with L being negative and R being positive
1. Prepend 50 to the array
1. Scan through the array while adding
1. Apply mod 100 to see where the dial would line up with 0

I implemented the idea above quickly just so I can see part 2, fiddled with a few things (turning the L/R into a sign took some doing) but I got the answer right first try!
```uiua
CodeToRot ← ×⊃(⊢-1⊚="L_R"|⋅⋕)°⊂
/+=0◿₁₀₀\+⊂ 50⊜(CodeToRot)⊸≠@\n
```

In part 2 we need to count the number of times we cross 0 even during a single rotation. I think I'll sleep on that one! Might have to look at some simple examples to understand how to count the number of zero-crossings. Probably involves calculating the gaps between each rotations and dividing by 100?

# Solution Review


# Expansion
