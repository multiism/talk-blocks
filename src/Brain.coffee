
dictionary = require "./dictionary"

module.exports =
	class Brain
		constructor: ->
			@output_signal = value: off
			@trigger_signal = value: off
			@clock_signal = value: off
			@punctuation = "."
			@will_trigger = no
			@getting_blocks = no
			@getBlocks_callbacks = []
			@data_bits = []
			@blocks = []
			setInterval =>
				@update()
			, 1
		
		getBlocks: (callback)->
			@getBlocks_callbacks.push callback
			@will_trigger = yes unless @getting_blocks
		
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
		
		connect: (@adjacent)->
		
		update: ->
			@data_bits.push @output_signal.value if @getting_blocks
			if @data_bits.length % 8 is 0 and @data_bits.length > 0
				ones_and_zeros = @data_bits.map (bit)-> +(not not bit)
				has_any_ones = @data_bits.some((bit)-> bit)
				if has_any_ones
					id = parseInt(ones_and_zeros.join(""), 2)
					@blocks.unshift dictionary.fromID(id)
					@data_bits = []
				else
					for callback in @getBlocks_callbacks
						callback null, [@blocks..., @punctuation]
					@getBlocks_callbacks = []
			trigger = @will_trigger
			@getting_blocks = yes if trigger
			@trigger_signal.value = trigger
			@clock_signal.value = not @clock_signal.value
			@output_signal.value = off
			@will_trigger = no
			@adjacent.update @output_signal, @trigger_signal
