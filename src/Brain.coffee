
module.exports =
	class Brain
		constructor: ->
			@punctuation = "."
		
		getBlocks: (callback)->
			callback null, ["hello", "world"]
		
		getSentence: (callback)->
			@getBlocks (err, blocks)=>
				return callback err if err
				if blocks.length
					sentence = (block.toString() for block in blocks).join(" ") + @punctuation
					sentence = sentence.charAt(0).toUpperCase() + sentence.slice(1)
					sentence = sentence.replace(/\s's/g, "'s")
					sentence = sentence.replace(/\s?-\s?/g, "-")
					callback null, sentence
				else
					callback null, ""
