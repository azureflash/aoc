After thinking about some less array-like ways of solving this, I had the idea of using select to convert all the symbols to vectors representing x-y coordinate changes

To answer the first part, we scan through the table of moves to calculate the coordinates, and the answer is the number of unique coordinates. The way this was done before is with:

```uiua
⊏:[0_1 1_0 0_¯1 ¯1_0]˜⨂:[@^ @> @v @<]
```

We can convert the arrows array notation to a string. In the new version we start by keeping only arrows to filter out newlines with keep and memberof. We use on and by together to keep the arrows and the puzzle input. Then we use the new indexin to directly label each type of arrow with an index that we can select with. Not that much shorter, but a lot easier to follow without a bunch of shuffling arguments around.

```uiua
˜⊏[0_1 1_0 0_¯1 ¯1_0]⨂⊙▽⟜⊸∊"^>v<"
```

With that preparation done, to answer part 1, we scan add the coordinates together, deduplicate and count how many moves we've made. We need to add 1 to account for the starting house.

Trying something again: using by on the entire first part to keep the puzzle input, then dipping for part 2, and using bracket to label both answers.

```uiua
⧻⊝⊂[0 0]⊂⊃(Visited▽)(Visited▽¬)◿2⇡⧻.
```

To answer part 2, the old solution manually generates a mask for odd and even instructions and a fork to separate them. Is there another way? Maybe a reshape and a transpose so that each row is each Santa's commands? We have a 8192x2, we expect a 2x4096x2. Could it be as easy as a reshape 2_inf_2? Nope, that just splits the list into two halves front and back. Reshape under transpose? Deshape before reshape? Orient?

For the first 10 for each Santa, we expect:
- First 20 inputs: ^><^>>>^<^v<v^^vv^><
- Santa (odds): ^<>><vv^v> => 0_1 ¯1_0 1_0 1_0 ¯1_0 0_¯1 0_¯1 0_1 0_¯1 1_0
- Robo (evens): >^>^^<^v^< => 1_0 0_1 1_0 0_1 0_1 ¯1_0 0_1 0_¯1 0_1 ¯1_0

I want to take an array like [a_b c_d e_f g_h] (4x2, Moves x Dims) and turn it into a 2x2x2 (Santa x Moves x Dims). A 2_inf_2 reshape just creates (Halves x Moves x Dims). After some fiddling, looks like the solution is to reshape ~~2_inf_2~~ inf_2_2 and then orient,1. Each row of that array is one Santa's move list.

Sum scan one level down (rows,2 scan sum), flatten the top level (deshape,2 or deshape,¯1), and then deduplicate and take the length plus one like before.

Uiua discord pointed out two improvements:

- The table [0_1 1_0 0_¯1 ¯1_0] comes up often so it's a built-in constant called A,2
- ⊙▽⟜⊸∊ can be expressed as ⟜(▽⊸∊) meaning "filter ON these arguments"
