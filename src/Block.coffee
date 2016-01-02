
module.exports =
	# used by both the tests as a mock block and by the brain as a block representation
	# maybe it should be used only by the tests; the only data the brain gets is the text of each block
	class Block
		constructor: (@text)->
		toString: -> @text
		# used only by the tests:
		connect: (@previous)->
		trigger: (output)->
			# @TODO: actually model the data stream
			output.emit "block", @text
			setTimeout =>
				@previous?.trigger output
			, 1
