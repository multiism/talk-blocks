
dictionary = require "./dictionary"

blocks = []

module.exports =
	class MockBlock
		constructor: (@text)->
			@trigger_signal = value: off
			# @output_signal = value: off
			# @clock_signal = value: off
			@triggered = no
			@id = dictionary.getID(@text)
			@id = 0x0 if @id is -1
			@bits = Array.from @id.toString(2)
			@bits.unshift 0 until @bits.length >= 8
			@bits = @bits.map (bit)-> +(Boolean Number bit)
			# console.log "MockBlock", @text, @bits
			@bit_index = 0
			blocks.push @
		toString: -> @text
		connect: (@previous)->
			# @TODO: refactor
			@previous.clock_signal = @clock_signal
			@previous.output_signal = @output_signal
		update: ->
			# console.log "MockBlock::update", @text, @trigger_signal.value, @triggered, @bits, @bit_index
			@previous?.trigger_signal.value = off
			if @trigger_signal.value
				@triggered = yes
			if @triggered
				bit = @bits[@bit_index]
				if @bit_index >= @bits.length
					# console.log "MockBlock(#{JSON.stringify(@text)}).update: trigger adjacent block (#{if @previous? then JSON.stringify(@previous.text) else "none"})"
					@bit_index = 0
					@triggered = no
					@previous?.trigger_signal.value = on
				else
					# console.log "MockBlock(#{JSON.stringify(@text)}).update: output", "#{JSON.stringify(@bits)}[#{JSON.stringify(@bit_index)}] = #{bit}"
					@output_signal.value or= bit
					@bit_index += 1
			@previous?.update()
			
		# trigger: (output)->
		# 	return if @triggered
		# 	output.emit "block", @text
		# 	@triggered = yes
		# 	setTimeout =>
		# 		@previous?.trigger_signal.value = on
		# 		# setTimeout =>
		# 		@triggered = no
		# 		# , 10 #?
		# 	, 1

# setInterval ->
# 	for block in blocks
# 		if block.trigger_signal.value
# 			block.trigger()
# , 3
