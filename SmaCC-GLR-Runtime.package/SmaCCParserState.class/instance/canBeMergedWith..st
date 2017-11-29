testing
canBeMergedWith: aSmaCCParserState
	^ self stateStack = aSmaCCParserState stateStack
		and: [ self scannerState = aSmaCCParserState scannerState ]