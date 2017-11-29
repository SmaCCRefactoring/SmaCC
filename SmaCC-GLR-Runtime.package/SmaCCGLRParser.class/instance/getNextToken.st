private
getNextToken
	currentToken isNil
		ifFalse: [ ^ self ].
	lastState = currentState scannerState
		ifTrue: [ currentToken := lastToken.
			scanner restoreState: nextScannerState.
			currentState scannerState: nextScannerState ]
		ifFalse: [ lastState := currentState scannerState.
			scanner restoreState: currentState scannerState.
			lastToken := currentToken := scanner next.
			nextScannerState := scanner currentState ].
	currentState scannerState: nextScannerState