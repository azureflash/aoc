Looks like it'll be useful to develop functions to modify specified ranges of values. The first step is to turn the given two corners of a rectangle into a list of indices to operate on. I think we can just subtract the two corners and call range on that!

Now what was the pattern to change elements according to their indices? Pick I guess?

Takes me some experimentation to figure out how to make a 2D range inclusive on both sides given two corners of a rectangle. Given the simple example 2_2 4_5, we expect: 2_2 2_3 2_4 2_5 ; 3_2 3_3 3_4 3_5 ; 4_2 4_3 4_4 4_5. That's a range over 3_4 with the lower bound 2_2 added to all level 1 rows. 3_4 is the difference between the two bounds plus one. Putting it all together, we subtract but use off to keep the lower bound as the next argument, add 1, range, then rows add at axis 1. We can just call this Rect.

It's time to think about what we'll turn the input into. Each line has the name of a function we'll apply to a range and the grid, and the lower and upper bounds separated by the word "through". We'll need a function that calculates Rect and then applies a switch to every row, preserving the grid at the bottom.

The fact that the function name can be one or two words makes extracting tricky. I think it's a good time to use a little regex.
