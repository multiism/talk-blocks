
{EventEmitter} = require "events"
Block = require "./Block"

module.exports =
	class Brain
		constructor: ->
			# @TODO: actually model the data stream
			@output = new EventEmitter
			@block = new Block "."
		
		getBlocks: (callback)->
			# @TODO: if already getting blocks, just wait for and use those results
			
			blocks = []
			tid = -1
			do eventually_call_back = =>
				clearTimeout tid
				tid = setTimeout =>
					callback null, blocks
				, 100
			
			# @TODO: actually model the data stream
			@output.on "block", (text)->
				blocks.unshift new Block text
				eventually_call_back()
			
			# this will be changed for non-testing
			@block.trigger @output
		
		getSentence: (callback)->
			@getBlocks (err, blocks)=>
				return callback err if err
				sentence = blocks.join(" ")
				sentence = sentence.charAt(0).toUpperCase() + sentence.slice(1)
				sentence = sentence.replace(/\s's/g, "'s")
				sentence = sentence.replace(/\s?-\s?/g, "-")
				sentence = sentence.replace(/\s,/g, ",")
				sentence = sentence.replace(/\s\./g, ".")
				sentence = sentence.replace(/\s\?/g, "?")
				callback null, sentence
