# Word Blocks

What if you had some blocks with words on them that you could fit together to make sentences, and then press a button to read the sentence out loud?

That would be a cool toy.

The button is the period at the end of the sentence,
on a block that you connect like any other.

With a base as simple as a block, artistic possibilities are endless.
* :rainbow: Color words can be painted their colors
* :sunny: A "sun" block could have a picture of the sun
* :maple_leaf: A "leaf" block could be painted or could have leaves actually embedded under a coat of finish
* :palm_tree: A "palm" block could be made out of palm wood (although the word can of course also refer to the palm of a hand)
* :white_large_square: A "clear" block could be made of clear plastic
* :droplet: a "water" block could be the same, with the insides waterproof and filled with water part way or all the way but mixed with particles to show the fluidity
* :large_orange_diamond: An "amber" block could be [molded out of amber resin][amber molding]
* :eyes: "eyes" could have googly eyes attached ("watched", "saw")
* :sparkles: "starry", "stars", or "night" could be painted, or...* they could made to light up with [fiber optics][]!
* "light" or "glow" blocks could be made with transparent diffused plastic with LEDs inside
* I could imagine a "slinky" block, but that wouldn't be that useful of a word... relative to how fun the block itself could be
* I can imagine an artistic cuboidal "whale" block with a spout
* :spades: "spades", "clubs", "diamonds" and "hearts" could be plastered with playing cards
* "stuffed" or "plushie" could be plushie cuboids (like [this][https://41.media.tumblr.com/6f159d0c5b6feb3828f7cc37b6cf8d26/tumblr_nig99w6JsS1rn4rymo1_500.jpg] but not necessarily animalian)
* Many words can be expressive with typographical stylizations, e.g. "faint", "sloppy", "bold", "ransom", "fast"/"run"
* A quadrant of "quarter" could be inverted or highlighted
* :bell: "bells" could contain bells
* :hotsprings: "smell" could have wavy markings and/or could be scented
* :cow2: "cow" could have a cow pattern (or be a plushie)
* "crib" could be a miniature crib, with the word set at the bottom or possibly atop some adorable bedding
* :closed_lock_with_key: "lock" could be a locked container and "key" could have the key on a string
* "bus" could be a miniature bus
* :white_square_button: "internal" could have the word on the inside, at the bottom of a clear plastic block with the wiring moved away from the center, or better yet with a smaller opaque block inside
* "checkered", "crown", "book", "traffic", "bread", "laser", "heavy"...


The blocks will be commercially available in sets,
but further customization will be highly encouraged.

We may offer some kind of custom block kit,
however the technology will be open source,
so you will always be able to buy the needed parts yourself if you want.

<!--
We will try to file for an [open patent][].
Patent not yet pending.
-->


## How will it work?

Blocks will connect end to end with magnets hidden just inside the wood,
and with metal contacts to complete the circuit between blocks.

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
Most likely the prototype will use 

Also, it would be good to leave one or two channels for future use.
(I can think of a few interesting uses.)


### Notes

* If there is a failing connection, you can pinpoint it's location by what word the speech starts on.

* The brain block can also query the chain of words without reading it aloud.

<!--
* Custom block suggestions should be moved to a new file, there's so many of them. An overview of the possisbilities can stay here (i.e. paint, materials, typography, electronics, and misc. autological blocks)

* There could be "'s" and "s" blocks that overlaps the preceding block (to counteract the word spacing), maybe even flipping over mechanically when connected via a button on the connecting side. I don't know how exactly it would appear when not flipped over onto a block, but maybe instead of flipping it could jump up and slide over. I'm thinking because blocks might not always be the same height. If they were, it could just stick out of the block fixedly. Wait, it could just be on an up/down slider, then it could settle on any block (as reasonably sized as any of the other ideas). It might be more likely to break (maybe), but it's simpler.

* Add specifications of dimensions, fillets, typography, contact placement...

* Create website(s)

* Speech synthesis easter eggs
-->


[circuitjs]: http://www.falstad.com/circuit/circuitjs.html
[amber molding]: http://www.resinobsession.com/resin-tutorials/amber-resin-tutorial
[fiber optics]:  http://www.instructables.com/id/Star-Map/
[IPv4 exhaustion]: https://en.wikipedia.org/wiki/IPv4#Address_space_exhaustion
[open patent]: https://en.wikipedia.org/wiki/Open_patent
