# Word Blocks

What if you had blocks with words on them that you could fit together to make sentences, and then press a button to read the sentence out loud?

You'd have a cool toy, that's what.

Don't forget to punctuate your sentences!
The block at the end is the brain,
and the dot is the button you press to speek the sentence.

With a base as simple as a block, [artistic possibilities are endless](BLOCK-IDEAS.md).
Blocks can be painted or made from various materials.
Typography can be adjusted.
Electrical components such as LEDs can be powered with the existing power channel.
Many blocks can be made self-descriptive.

The blocks will be commercially available in sets,
but further customization will be highly encouraged.

We may offer some kind of custom block kit,
however the technology will be open source,
so you will always be able to buy the needed parts yourself if you want.

<!--
We plan to file for an [open patent][].
-->


## How will it work?

Blocks will connect end to end with magnets hidden just inside the wood,
with metal contacts to complete the circuit between blocks.

When you press the button,
the brain block sends a signal to the adjacent connected word block.
The triggered block sends back a word ID to the brain
before triggering the next block.
The brain block receives the words in reverse order,
and waits until it stops receiving words to speek.


### The Circuit

![A circuit of a few blocks chained together](circuit.png)

To run this simulation, open [circuit.txt](./circuit.txt) in [circuitjs][].

In the current design, there is support for only a fixed number of possible words.
If it were built as it is in the above diagram, it would support only 2⁴ = 16 words, but we would not use a multiplexer with so few inputs.
With an 8 bit multiplexer we could get 256 words,
but it's still worth looking into making IDs [be able to be] dynamically sized numbers for forwards compatibility.
After all, the 2³² space of IPv4 addresses more or less [ran out][IPv4 exhaustion].
Maybe it should just send the words encoded in UTF-8.
That would mean the minimum complexity of the blocks would be higher, but it would be conceptually simpler; you wouldn't have to register a block ID with a database for it to be recognized, and brain blocks wouldn't need to maintain an up-to-date version of that database.
At any rate, the prototype will likely use word IDs.

Also, it would be good to leave one or two channels for future use.
(I can think of a few interesting uses.)


### Notes

* If there is a failing connection, you can pinpoint it's location by what word the speech starts on.

* The brain block can also query the chain of words without reading it aloud.

<!--
* There could be "'s" and "s" blocks that overlaps the preceding block (to counteract the word spacing), maybe even flipping over mechanically when connected via a button on the connecting side. I don't know how exactly it would appear when not flipped over onto a block, but maybe instead of flipping it could jump up and slide over. I'm thinking because blocks might not always be the same height. If they were, it could just stick out of the block fixedly. Wait, it could just be on an up/down slider, then it could settle on any block (as reasonably sized as any of the other ideas). It might be more likely to break (maybe), but it's simpler.

* Add specifications of dimensions, fillets, typography, contact placement...

* Create website(s)

* Speech synthesis easter eggs
-->


[circuitjs]: http://www.falstad.com/circuit/circuitjs.html
[IPv4 exhaustion]: https://en.wikipedia.org/wiki/IPv4#Address_space_exhaustion
[open patent]: https://en.wikipedia.org/wiki/Open_patent
