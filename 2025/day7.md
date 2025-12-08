# Solving Journal
## December 7th, 16:30
Time for a return to form after a couple of days of not feeling like working on these, or just improvising the parsing part (which I find the most fun, probably because it's what I have the most experience doing by now).

Day 7 reminds me of Advent of Code 2022's Day 14 in that it's a spatial reasoning problem with stuff encountering obstacles and splitting to the side.

For the first part I thought we were going to count the number of beams at the end, but it looks like we're first counting how many splitters are hit in total. We'll need to mark splitters that were hit so it's easy to count at the end.

This is clearly going to be a scan or a fold operation. Two or three things need to happen every time we go down a row:
- Based on the beams in row n-1, find splitters that are hit in row n
- Carry over any beams that weren't stopped
- Based on the splitters identified previously, identify where beams are in row n

I think we can represent this with 0 for empty space, 1 for the beams, inf for splitters and ¯inf for hit splitters. Looking at the start of the table, I think it might be useful to use ¯0 to represent spaces where beams are about to be. If we do that, we can just negate all the cells in row n based on values 1 in row n-1. Then turn ¯0 into 1 and ¯inf stay like that for the final count.

The only thing left to do after that is to add ones to all the cells that neighbor ¯inf. Find the ¯infs, add the constant A,1 for 1D neighbors, and then replace the values there by 1s. It doesn't look like we need to check for neighboring splitters.

My idea of using ¯0 just became scuffed from realizing that 0 and ¯0 are equal, but I'll just unparse and use string comparison to detect ¯0 and replace them with 1. Other languages have done much worse...

It worked! Now for part 2 we have to count all possible paths the beam can take... I'm wondering if I could just add 1 instead of replacing by 1 every time I add a beam. Then I'd have the sum of all paths leading to each point at the bottom and it would be a simple matter of summing up numbers in the last row.

To answer part 2, I unfortunately need to completely rethink my approach. Instead of being simply 1, the beams will be represented by any non-zero, non-infinity number, and they'll be incremented each split to count the number of possible paths.

1. Where there's beams in the current row and no splitters in the next row, copy the beam numbers. If there us a splitter next, mark whether a beam hit it by negating it. Don't propagate infinities.
  - Args: [0 2 0 3] [0 0 ∞ ∞]
  - Expected: [0 2 ∞ ¯∞]
2. For every splitter in the next row, put the value in the same index of current row to the neighbors. Multiple values for the same index should be added together
  - Args: [0 ∞ 0 ∞ 0] [0 8 0 6 0]
  - ∞ at indices 1 (beam value 8) and 3 (beam value 6)
  - [1_8 3_6]
  - Add A,1 coeffs to the first element of each inf found
  - [-1 1] [1_8 3_6] => [0_8 2_8 2_6 4_6]
  - Partition by value of the first row, add the second rows
  - => [0_8 2_14 4_6]
  
My first attempt at implementing the idea above is a mess, here it is for posterity, but I need to think about it some more.

```uiua
\(
  ⊸⍜▽(0◌)=∞⊸⌵⍜▽¯⊙(↥)¬↥◡∩=₀
  ⨬(
    ⤚(♭₋₁⊞(⍜⊙⊢+)A₁⍉⊟⟜⊏⊚⌕∞)
    /↥≡⌟(⍜(⊡|⋅)⊙˜∘°⊟)⊜(⊂⊓(◴|/+)°⊟⍉)+₁⊸≡⊢⍆
  )=₁⧻⊚⊸⌕∞
)
```

Here's another idea, starting from the processed array from Part 1, using a reduce:
- Carry over the beams
- On row n+1, count the neighbors of used splitters (¯inf), including duplicates

# Solution Review


# Expansion
