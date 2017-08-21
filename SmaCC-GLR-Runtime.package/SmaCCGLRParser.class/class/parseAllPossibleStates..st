parsing
parseAllPossibleStates: aString
	"Returns all possible parse nodes that can be created from aString starting from any place in the parser."

	| parser |
	parser := self on: (ReadStream on: aString).
	parser
		parseAll: true;
		setAllStartingStates.
	^ parser parse asSet asOrderedCollection 