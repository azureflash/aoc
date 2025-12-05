# Solving Journal
It's now evening of day 4 and I'm starting on Day 4. I did do a bit of hasty coding last night around midnight out of curiosity, and produced this abomination that matched the answer to the example input:

```uiua
×⊸⊃≥₁<₄×⊙(-1⍜⍉(↘₁↘₋₁)↘₁↘₋₁)⬚0⤙⧈(/+♭)3_3⌕"@"⊜∘⊸≠@\n
```

If I run this code on my input I get an answer of 1444, but before I submit that answer I want to go back over this code. Partitioning by newlines and finding @ signs seems like the right thing to do, at least.

The next thing that came to mind after that is to use a 3x3 stencil, but I could also generate a list of coordinates, multiply by the constant A,2 to get the coordinate of neighbors, and reduce to get a neighbor count that way, neatly avoiding counting the middle or adding borders like with stencil. Let's try that!

Where gives the index of all the 1s, I thought I needed some inverse form of select or pick. Silly me. To get all eight neighbors we need to use A,2 and C,2 joined together. We have an 8x2 and a 71x2 matrix. I'm trying to find how to multiply those two to get a 71x8x2 array of the indices of all 8 neighbors of those 71 paper rolls... Pretty sure I need to fix the neighbor array. I also only need to add them, not multiply. Transposing the neighbors array before fixing it and then adding is the only operation I can find that works, giving a 71x2x8. Does this make sense?

Each row of that array seems to contain the correct coordinates, if you ignore negative ones and if we transpose them again.

I'm still pretty bad at this array stuff, but I've arrived at the conclusion that if I transpose and fix the array of found rolls, then add the neighbors, and orient,2, I get my 71x8x2 array. Fine.

On each row of this array I want to:
- Exclude the negative arrays
  - Calculate greater than or equal to zero
  - Ensure all coordinates in each row satisfies (multiply-reduce each row)
- Pick the values from the array of finds underneath
- Add up the finds, counting neighbors

This should leave me with an array of neighbor counts on top of an array of finds. Oh! I get an error because I need to make sure we don't exceed the length of the array either.

This is getting too complicated. I'm going back to the stencil approach, it feels more intuitive to me. The main issue was to remove the border after the stencil operation... I'm fairly sure there was an elegant way to do this.

1440 isn't even the right answer (too low)... I'm taking a break.

# Solution Review


# Expansion
