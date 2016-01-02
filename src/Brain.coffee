
{EventEmitter} = require "events"
Block = require "./Block"

module.exports =
	class Brain
		constructor: ->
			# @TODO: actually model the data stream
			@output = new EventEmitter
			@block = new Block ".", @output
		
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
			
			# this will be changed for non-testing
			@block.trigger()
		
		getSentence: (callback)->
			@getBlocks (err, blocks)=>
				return callback err if err
				if blocks.length > 1
					sentence = blocks.join(" ")
					sentence = sentence.charAt(0).toUpperCase() + sentence.slice(1)
					sentence = sentence.replace(/\s's/g, "'s")
					sentence = sentence.replace(/\s?-\s?/g, "-")
					sentence = sentence.replace(/\s,/g, ",")
					sentence = sentence.replace(/\s\./g, ".")
					sentence = sentence.replace(/\s\?/g, "?")
					callback null, sentence
				else
					# should this case be here?
					# should it return the empty string or null?
					callback null, ""
