
module.exports =
	# used by both the tests as a mock block and by the brain as a block representation
	# maybe it should be used only by the tests; the only data the brain gets is the text of each block
	class Block
		constructor: (@text, @output)->
			# @output is used only by the tests
		connect: (@previous)->
		toString: -> @text
		# trigger is used only by the tests
		trigger: ->
			# @TODO: actually model the data stream
			# console.log "triggered", @text
			@output.emit "block", @text
			setTimeout =>
				# console.log "trigger next", @previous?.text
				@previous?.trigger()
			, 15
