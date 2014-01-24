private
duplicateState
	| state |
	nodeStack := nodeStack copy.
	stateStack := stateStack copy.
	state := currentState copy.
	state stateStack: stateStack nodeStack: nodeStack.
	state position: scanner position.
	state scannerState: scanner state.
	states add: state.
	^state