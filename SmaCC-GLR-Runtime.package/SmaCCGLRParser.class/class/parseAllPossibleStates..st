parsing
parseAllPossibleStates: aString
	| parser |
	parser := self on: (ReadStream on: aString).
	parser
		parseAll: true;
		setAllStartingStates.
	^ parser parse