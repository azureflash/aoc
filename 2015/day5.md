# Solving Journal
This problem comes with neatly divided sub-problems, let's solve those first.

The first property can be tested by looking for membership of "aeiou" inside the string. With backwards memberof we can keep the constant vowels argument close to the memberof function and have the string as the second argument. Then we just take the ~~length~~ sum reduction and test if it's 3 or more. We'll call this property "Voweled".

```uiua
Voweled ← ≥₃⧻˜∊"aeiou"
```

Then we need to look for a letter that is repeated twice. Sounds like a job for a scan equal. Equal returns a number though and comparing number with character doesn't work. Maybe classify? No, that also causes a confusion between boolean 0 and data 0. Stencil would be more elegant. Stencil equal, then max reduce to return true if there's a repeat anywhere. Let's called this property "Paired".

```uiua
Paired  ← /↥⧈=
```

Finally, we need to test for the absence of specific pairs. Sounds like a mix of previous solution, test for membership in the windows produced by stencil. Those forbidden letter pairs feel kind of common (first letters of the alphabet and math variables) so we'll call this property "Original". Once we have the number of forbidden pairs found in the string, if it's equal to zero, the string is "Original".

```uiua
Original ← =₀/+˜∊⊙⧈₂∘["ab" "cd" "pq" "xy"]
```

All three properties need to be present, so we just need to test them all with a fork and then combine with a logical AND. Use partition by not line break to run that fork on all strings. Take the product of all three arrays by calling it twice. The sum of that is how many nice strings there are.

Got a wrong answer... Oh! I misunderstood the first rule, it doesn't need 3 distinct vowels, just 3 vowels total. Just need to un-backwards the membership test.

Part two throws away the old rules and introduces new ones.

The first requires the same letter pair to show up twice in the string without overlap. Stencil could allow overlap but a stencil with non-overlapping windows could make us miss some pairs. Maybe there's a rule after we compare all the stencil pairs that could filter out overlaps? Also we need to use match instead of equal (which would give of an array of all matching single letters). Stencil gives us a list of pairs, table match gives us an array of matching pairs.

In that table, if we first zero out the diagonal, finding a 1 surrounded by zeroes corresponds to a matched pair whose pair isn't an overlapping neighbor. So we can use stencil again, but this time a 3x3 stencil, and in that NxN array of 3x3 letter pair with its neighbors, we search for the "eye" pattern (1 in the middle and zeroes all around).

Zeroing out the diagonal involves making a range from the length, using table not equal, and taking the min (OR) between the two tables.

That took some doing... feels like I overfocused on stencils and tables, wonder if there's a simpler way.

```uiua
Twinned ← /↥♭⧈(≍[0_0_0 0_1_0 0_0_0]) 3_3 ↧˙⊞≠⇡⊸⧻˙⊞≍⧈∘ 2
```

A letter that repeats itself with another letter between them... that's a funny way to say a 3-long palindrome! Size 3 stencils, if any of them is equal to its reverse, the property is satisfied.

```uiua
Mirrored ← /↥≡(≍⊸⇌)⧈₃∘
```

First answer attempt was wrong. I thought about adding a fill 0 to the stencil to find pairs that are on the edge. With the fill it finds 18 more strings but the answer is still wrong...

After some testing it turns out that multiple pairs can "shadow" each other in the match table. This approach is no good, maybe stencil and tuples would work better? Tuples smaller than and removing the first couple for every consecutive pair of letter seems better! My first thought was to remove the first combination for each first argument with some kind of partition by the first element of every row...

But then I thought of using the fact that tuple's function works on indices of the elements, so if I offset the comparison by one I can get combinations of elements that aren't themselves or neighbors!

```uiua
⧅(<-₁)
```

This is very cool!

Once we have that list of combinations, if we find ones that are equal, the "Twinned" property is fulfilled. And that gives the correct answer!

```uiua
Twinned  ← /↥≡/≍⧅(<-₁)2⧈∘2
```
