My old solution starts with a fork that creates masks for linebreaks and 'x'es. Those masks are combined and inverted, and the non-x, non-linebreak partitions are parsed.

Like in 2015-1 it's probably much easier to do partition parse by not memberof. The only other change is reshape with inf_3 instead of ¯1_3 (much more expressive).

With that prep done, we can move on to doing whatever calculation we were doing:

```uiua
/+≡(+⊃(/×↙2⊏⍏.)(×2/+♭×⊃(⊞×)(⊞>.⇡3).))
/+≡(+⊃(/×↙₂⍆|/+×₂≡/×⧅>2))
```

We were doing something to each row containing 3 elements (A x B x C). Judging by my comments I was computing 2ab+2ac+2bc + the product of the smallest two sides. The first part of the fork is the product of the smaller two (a compiler advice tells us to use sort instead, we'll do that).

The bigger half of the fork painstakingly computes 2ab+2ac+2bc using table, but there's a much better way now with tuples.

```uiua
/+≡(+⊃(/×↙₂⍆|/+×₂≡/×⧅>2))
```

Part 2 is still valid, just a little bit of syntactic cleanup
