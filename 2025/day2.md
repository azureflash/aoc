# Solving Journal
It is evening on Day 2 in the Eastern time zone now. At midnight today I improvised the parsing part. It uses boxes and is probably horrible, but I'll run with it for now. It's a two-level partition operation, the first layer partitions the ranges, the second layer partitions and parses the numbers and then separates them, adds one to the second one, and creates a range out of them, then finally I join and unbox all the numbers.

```uiua
/◇⊂⊜(□⍜-⇡⊙+₁°⊟◇⊜⋕⊸≠@-)¬⊸∊",\n"
```

Now we have to un-parse them to test for repeated patterns. How to test for patterns of any length? I guess by generating all the different rotations of the ID, and then... comparing and looking for matches? Oh, no, we only need to check if the first half equals the second half. For now at least...

If there are any fancy ways of splitting a string in half, I don't remember them. I'm just going to take the length, divide by 2 and round down, and fork take and drop. Then with match, IDs that are repeats are found. Oops, had to add the unparse I left out because I tested directly with a string.

```uiua
/+≡(≍⊃↙↘⌊÷₂⊸⧻°⋕)
```

Running that took about 3 seconds and returns a wrong answer, too low. Why? I'm either missing IDs in my ranges, or I'm missing invalid IDs with my second piece of code. It gives the correct answer on the example input, so I'm not sure what's going on here. There are no duplicates in the parsed list of IDs.

Turns out I mistakenly assumed we were counting the IDs. It says to ADD them. Easy enough, just process the rows with by, then keep to filter by invalid IDs, then take the sum.

Part two introduces the complication I thought was already there in part 1, the sequences can be any length. I experimented in the Uiua pad to find a way to generate all rotations. I came up with this general plan:

- Create a range based on the length
- Rotate by all numbers in the range
- Compare all the rotations together, if matches are found it's invalid

To implement that was fairly straightforward, I just needed to dip fix the original array so row rotate would work. Then I drop the first one (0-rotate, will always match), row match, and count the number of matches. If there's matches, it's invalid. Interestingly, the number of matches gives us the length of the repeating sequence!

```uiua
≠₀/+≡≍↘₁⊸≡↻⊙¤⇡⊸⧻
```

If we substitute just the part that did string splitting and comparing in Part 1 (``≍⊃↙↘⌊÷₂⊸⧻`` to the above), we should take each string, determine if they're invalid, and the rest of the solution works the same to add up the invalid IDs. 

# Solution Review

# Expansion
