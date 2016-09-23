private
restoreState: aSmaCCParserState
	currentState := aSmaCCParserState.
	nodeStack := aSmaCCParserState nodeStack.
	stateStack := aSmaCCParserState stateStack.
	scanner state: currentState scannerState