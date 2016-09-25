private
initialParserState
	| state |
	state := SmaCCParserState
		stateStack: stateStack
		nodeStack: nodeStack
		scannerState: scanner state
		position: scanner position.
	^ state