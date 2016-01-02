
assert = require "assert"
Brain = require "./Brain"
Block = require "./Block"

describe "The Brain", ->
	it "should only say 'Hello world.' when 'hello' and 'world' blocks connected", (done)->
		brain = new Brain
		world = new Block "world", brain.output
		brain.block.connect world
		hello = new Block "hello", brain.output
		world.connect hello
		brain.getSentence (err, sentence)->
			throw err if err
			assert.equal sentence, "Hello world."
			done()
