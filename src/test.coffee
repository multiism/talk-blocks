
assert = require "assert"
Brain = require "./Brain"
Block = require "./Block"

describe "The Brain", ->
	it "should say 'Hello world.' when 'hello' and 'world' blocks connected", (done)->
		brain = new Brain
		world = new Block "world"
		brain.block.connect world
		hello = new Block "hello"
		world.connect hello
		brain.getSentence (err, sentence)->
			throw err if err
			assert.equal sentence, "Hello world."
			done()
	it "should not just give up part way through a long sentence", (done)->
		goal_sentence = "Mary had a little lamb, little lamb, little lamb, Mary had a little lamb, its fleece was white as"
		goal_sentence += " snow as white as a fleece as white as some snow as white a fleece that was as white as a patch of" for [0..5]
		goal_sentence += " snow that's been greyed from the exhaust of many passing vehicles"
		blocks = (new Block(text) for text in goal_sentence.replace(/\s?,\s?/g, " , ").split(" "))
		brain = new Brain
		last = brain.block
		for block in blocks by -1
			last.connect block
			last = block
		brain.getSentence (err, sentence)->
			throw err if err
			assert.equal sentence, goal_sentence + "."
			done()
