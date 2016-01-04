
dictionary = require "./dictionary"

module.exports =
	class MockBlock
		constructor: (@text)->
			@triggered = no
			@id = dictionary.getID(@text)
			if @id is -1 then throw new Error "Not in dictionary: #{JSON.stringify(@text)}"
			@bits = Array.from("00000000#{@id.toString(2)}".slice(-8)).map((char)-> +char)
			@bit_index = 0
		toString: -> @text
		connect: (@adjacent)->
		update: (output_signal, trigger_signal)->
			trigger_adjacent = no
			if trigger_signal.value
				@triggered = yes
			if @triggered
				bit = @bits[@bit_index]
				if @bit_index >= @bits.length
					@bit_index = 0
					@triggered = no
					trigger_adjacent = yes
				else
					output_signal.value or= bit
					@bit_index += 1
			@adjacent?.update output_signal, value: trigger_adjacent
