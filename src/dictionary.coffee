
dictionary = [
	# A comprehensive list of all the words and symbols that you will ever be able to use.
	# Just kidding, this ain't the way to go.
	"."
	"!"
	"?"
	","
	";"
	"hello"
	"world"
	"Mary"
	"had"
	"a"
	"little"
	"lamb"
	"its"
	"fleece"
	"was"
	"white"
	"as"
	"some"
	"snow"
	"patch"
	"that"
	"that's"
	"been"
	"greyed"
	"from"
	"the"
	"exhaust"
	"of"
	"many"
	"passing"
	"vehicles"
]

exports.fromID = (id)-> dictionary[id]
exports.getID = (word)-> dictionary.indexOf(word)
