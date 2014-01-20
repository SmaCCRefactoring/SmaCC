private
setStartingStatesIfNone
	states isEmpty
		ifTrue:
			[states
				add:
					(SmaCCParserState
						stateStack: stateStack
						nodeStack: nodeStack
						scannerState: scanner state
						position: scanner position)]