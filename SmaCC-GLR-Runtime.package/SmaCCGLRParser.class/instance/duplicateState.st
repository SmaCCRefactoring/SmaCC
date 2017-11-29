private
duplicateState
	| state |
	parseAll ifTrue: [nodeStack := nodeStack collect: [:each | self copyStackObject: each]] ifFalse: [nodeStack := nodeStack copy].
	stateStack := stateStack copy.
	state := currentState copy.
	state stateStack: stateStack nodeStack: nodeStack.
	state scannerState: scanner currentState.
	states add: state.
	^state