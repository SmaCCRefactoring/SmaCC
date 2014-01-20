private
reportLastMatch
	"The scanner has found the end of a token and must report it"

	| string token |
	self checkForValidMatch.
	self resetOutputToLastMatch.
	stream position: matchEnd.
	string := outputStream contents.
	self checkForKeyword: string.
	token := matchActions isSymbol 
				ifTrue: [self perform: matchActions]
				ifFalse: [self createTokenFor: string].
	matchActions := nil.
	^token