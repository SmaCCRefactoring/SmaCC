private
canBeMergedWith: aSmaCCParserState
	^self stateStack = aSmaCCParserState stateStack
		and: [self position = aSmaCCParserState position and: [self scannerState = aSmaCCParserState scannerState]]