private
initialParserState
	| state |
	state := SmaCCParserState
		stateStack: stateStack
		nodeStack: nodeStack
		scannerState: scanner currentState.
	^ state