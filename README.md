# Word Blocks

What if you had blocks with words on them that you could fit together to make sentences, and then press a button to read the sentence out loud?

You'd have a cool toy, that's what.

Don't forget to punctuate your sentences!
The block at the end is the brain,
and the dot is the button you press to speak the sentence.

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
and waits until it stops receiving words to speak.


### The Circuit

![A circuit of a few blocks chained together](circuit.png)

To run this simulation, open [circuit.txt](./circuit.txt) (Raw, select all, copy) in [circuitjs][] (File > Import from Text, paste, OK).
Use <kbd>Alt</kbd>+Drag to pan around.
You can click on the "button".

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

The circle in the upper right of the diagram is where the data is read from.
The whole right side area represents the brain block.
It will use a [Raspberry Pi][] at least for the prototype.


### The Code

Located in [`src/`](src/) is the code for the brain along with some tests.
It implements a fixed "database" of words, implemented [lamely][] as a simple array.


### Notes

* If there is a failing connection, you can pinpoint its location by what word the speech starts on.

* The brain block can also query the chain of words without reading it aloud.

* In the simulation, the clock is not controlled and the button is directly in the circuit, making it unreliable, but as implemented in the code, the real thing will send a trigger signal syncronized with the clock.

<!--
* There could be prefix/postfix blocks that overlap the preceding block (to counteract the word spacing), maybe even flipping over mechanically when connected via a button on the connecting side.
  I don't know how exactly it would appear when not flipped over onto a block, but maybe instead of flipping it could jump up and slide over. I'm thinking because blocks might not always be the same height.
  If they were, it could just stick out of the block fixedly.
  Wait, it could just be on an up/down slider, then it could settle on any block (as reasonably sized as any of the other ideas). It might be more likely to break (maybe), but it's simpler.
  Or maybe it can just be fixedly sticking out.
  Or maybe we can just sacrifice equal left/right padding on the blocks.
  But if we want to do both postfixes AND postfixes, I don't think that would work.

* Add specifications of dimensions, fillets, typography, contact placement...

* Maybe specify different levels of compliance with the standard,
  i.e. level 1 being connecting to other blocks (primarily the height at which the connector should be, but also the details of the connector's contacts),
  and on another level (there *can* be just 2) the block would have the dimensions to fit with prefix/postfix blocks
  and joiners and splitters (which will have a fixed distance, although they could theoretically be adjustable, and the fixed should probably have some margin anyways so the limit to the dimension would actually be bigger than the recommended size of the blocks)
  and other possible special blocks

* Speech synthesis easter eggs
-->


[lamely]: http://c2.com/cgi/wiki?DoTheSimplestThingThatCouldPossiblyWork
[Raspberry Pi]: https://www.raspberrypi.org/
[circuitjs]: http://www.falstad.com/circuit/circuitjs.html
[IPv4 exhaustion]: https://en.wikipedia.org/wiki/IPv4#Address_space_exhaustion
[open patent]: https://en.wikipedia.org/wiki/Open_patent
