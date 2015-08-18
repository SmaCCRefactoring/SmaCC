private
duplicateState
	| state |
	parseAll
		ifTrue: [ nodeStack := nodeStack collect: [ :each | each copy ] ]
		ifFalse: [ nodeStack := nodeStack copy ].
	stateStack := stateStack copy.
	state := currentState copy.
	state stateStack: stateStack nodeStack: nodeStack.
	state position: scanner position.
	state scannerState: scanner state.
	states add: state.
	^ state