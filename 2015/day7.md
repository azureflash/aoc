# Solving Notes
This is going to be a bit trickier to solve in an array language... I need to:

- build something to store and retrieve values
- run a function based on which keyword is found in the line (thankfully there's only one)
- store the result in the main array
- apply that function over all lines

My first thought was to have a length 26 array and turn letters to numbers 0-26, but that got a bit more complicated when I saw the wire names could be 2 letters. Still possible, but at that point just using a hashmap could be just as good. I'll attempt it using maps first.

Most important thing to get working is the method for parsing a line into left and right arguments, process the left, then insert using the right argument.

Oh... another tricky part will be to replace variables on the left with their values. If they're 0-9 use as-is, if they're a-z get the value from the table kind of thing.

In more detail, the problem involves:
- get input lines
- split line into left and right
  - run the appropriate calculation for left side
    - switch/fork based on keyword found
    - replace variables with their values
    - apply the appropriate function
  - insert using index on right side
- apply to all lines

First thing I want to try is an idea to have an array with the 5 possible functions, search for them, and use that with a switch to call the approriate function. But before that I need a function to parse values/variables, as mentioned previously. If we subtract the character zero from the variable, if it's digits, the numerical values will all be below 10, in which case we take the original value as-is. Otherwise, we use the map get function on it.

This seems to work on both cases. That was way easier than I thought!

```uiua
Parse ← ⨬(get|⋕)<₁₀/↥⊸-@0
```

Now I can attack the thing that "pattern matches" on the left side and runs the appropriate calculation (with Parse somewhere along the line). The plan is to have an array with the function names, and use a switch to run code based on which index is found, the last one being the case where we just send a value into a wire. Sure hope there's not a wire named "or"...

It took a while of trying various combinations of find, memberof, backwards, row, etc. before I put together the way to find what boxed substrings are inside another string. Then with where we can feed into a switch.

```uiua
⊚≡(/↥◇⌕) {"NOT" "AND" "OR" "LSHIFT" "RSHIFT"} ¤
```

Next step is to implement all of the functions. Should be easy enough with Uiua's bits function and some under magic!
- NOT: under bits not
- AND: more complicated than it looked, I can't under both bits because there aren't two binary arrays at the end. Also need to adjust both arrays to the same size, although knowing the numbers are 16 bit, we could just use bits,16. That saves a lot of effort.
- OR: same story as with AND but instead of multiplying the bits together we use the or function or, to avoid using the experimental flag, we can do sum and sign?
# Solution Review

# Expansion

- What if there could be more than one instruction per line?
