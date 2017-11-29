accessing
setAllStartingStates
	tryAllStates := true.
	self statesThatShift
		do:
			[ :each | 
			states
				add:
					(SmaCCParserState
						stateStack: (OrderedCollection with: each)
						nodeStack: OrderedCollection new
						scannerState: scanner currentState) ]