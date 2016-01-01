
assert = require "assert"
Brain = require "./Brain"

describe "The Brain", ->
	it "should only say 'Hello world.' when connectivity has not been implemented yet", (done)->
		brain = new Brain
		brain.getSentence (err, sentence)->
			throw err if err
			assert.equal sentence, "Hello world."
			done()
