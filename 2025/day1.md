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

It is afternoon the next day, and I've been trying not to think about it too much! I want to build a small test with all the edge cases I can think of:
- Left rotation that doesn't cross 0
- Right rotation that doesn't cross 0
- Left rotation that stops at 0 immediately
- Right rotation that stops at 0 immediately
- Left rotation that passes 0 once
- Right rotation that passes 0 once
- Left rotation that passes 0 twice
- Right rotation that passes 0 twice
- A rotation of 100
- Multiple rotations in the same direction
- Passing 0 without stopping on it
- Passing 0 and stopping on it
- Starting at 0, stopping on 0 without passing
- Starting at 0, passing 0 and not stopping on it

Starting at 50:
- L25 to end up at 25
- R50 to end up at 75
- L75 to end up at 0
- R100 to end up at 0 again without passing it
- L200 to pass 0 and stop at 0
- L150 to pass 0 once and not stop at 0
- L300 to pass 0 twice, still not stopped at 0
- R250 to pass 0 twice and stop at 0

We get the code array [-25 50 -75 100 -200 -150 -300 250]. Prepending 50 and doing a scan-add to compute the positions we visit (like in Part 1) gives us [50 25 75 0 100 ¯100 ¯250 ¯550 ¯300]. Thus, we've stopped at 0 four times, and we've crossed 0 without stopping once with L200, once with L150, three times with L300, and twice with R250.

My intuition is that we can just calculate how many positions we travel between each move by taking the difference between each element in the position array. This is the default behavior of stencil, which gives us sliding windows in arrays. Once we have that, can't we just take the absolute value and round down, and that's the number of time we crossed zero? Trying that with the test case above.

```uiua
⌊÷₁₀₀⌵⧈-
```

This gives us [0 0 0 1 2 1 3 2]. Looking at it again, stencil subtract just gives us back the original array without the starting point. It's not that simple because whether we cross zero depends not just on the move itself but also on where the move is started from. I have a feeling that combining the array of instructions and the array of positions we calculate could give us all the information needed, but how to use that information?

Let's think about how the two arrays would fit together. The first one is 8 elements long and the second one has 9, because of the starting point. We start at 50, apply the first move (from the first array), we end up at the next element in the second array. So appending a zero in the first array would make sense.

```
╭─                                         
╷  50 25  75   0  100 ¯100 ¯250 ¯550 ¯300  
  ¯25 50 ¯75 100 ¯200 ¯150 ¯300  250    0  
                                          ╯
```

This table tells us _from 50, we moved -25 steps_ and so on. The first few are obvious, but how do we calculate how many times we cross 0 when we say _from -250, we moved -300 steps_? I think it would make sense to unfold that range and see how many positions in the travel are 0 mod 100. So for each pair of values:
- we create a range, including one end (to not count zeroes we stopped at twice)
- test for mod 0 mod 100
- sum reduce to count the matches

All put together, my first attempt for part 2 only, without the parsing, looks like this:
```
/+≡(/+=₀◿₁₀₀+⇡°⊟)⍉˜⊟⊙⍜⇌(⊂0)\+⊸⊂50
```

And it yields an incorrect answer, too low. I'm going to have to go through some examples again with a fine comb... later.

Here I am again, late evening day 2, after finishing both parts of day 2. My solution for d1p2 works for the given example, frustratingly enough... I'm going to try the approach of breaking my code with the smallest possible list of instructions.

I thought to add an instruction at the end of the example to see if I can make my code fail using various ways. The first thing I tried is adding R68 at the end, making it stop on a zero. And course, it fails, the count doesn't increase. Womp womp! Time to step through with args to see what doesn't make sense.

Looks like I'd added a bunch of inversions and additions that made no sense and the ranges were wrong in many instances.

Now the ranges look correct, but it counts one too many. One inconsistency I noticed with the way I make ranges now, if the first number is positive, the start of the range is excluded, but if it's negative, the end of the range is excluded.

Under negate range builds the range [a,b), I think I've been giving it a and n. I should compute b before using this pattern. On add does this in all cases.

The solution I came up with:
- Couple the positions and moves backwards to have the number of elements in the range first
- Split out the sign of the move with on sign
- Take the absolute value and create the range
- Multiply to apply the sign of the move
- Add the starting point

This seems to generate including the starting point and excluding the ending point consistently every time, as originally desired. The answer this generates is 1 more than the first try, and is correct. Whew!

# Solution Review


# Expansion
