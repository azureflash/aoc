# Solving Journal
Part 1 gives us rows of digits, and we have to find the biggest two-digit number we can make on each row, then add them all up. How hard could it be to brute force this?

First we want to parse this into individual digits. Good old partition parse by not, but we parse each (row,0).

Next we join all the digits together two by two with table join. Actually, it might easier to not parse the rows right away and just do partition id. Then we can do self table join parse!

Then max reduce to finish processing the row, and add it all up.

Not the right answer... oh, right, table forms illegal combinations of digits. Tuples with greater would be more appropriate. A tuples approach gives an answer a couple hundreds lower.

Greater than was the wrong function to use with tuple, smaller than formed the correct pairs. With that, the answer was correct!

Now we need to make 12-digit numbers for part 2. I guess we just need to change tuple's subscript?

```
Error: Array of 12605052613280400 4-byte elements would be too large (50420210453.122 MB)
```

Guess not! Good night.

# Solution Review


# Expansion
