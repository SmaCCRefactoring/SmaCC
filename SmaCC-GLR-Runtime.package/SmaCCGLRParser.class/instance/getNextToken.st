public
getNextToken
	currentToken isNil
		ifFalse: [ ^ self ].
	(lastState = currentState scannerState
		and: [ lastPosition = currentState position ])
		ifTrue:
			[ currentToken := lastToken.
			scanner
				setPosition: nextScannerPosition;
				state: nextScannerState.
			currentState
				scannerState: nextScannerState;
				position: nextScannerPosition ]
		ifFalse:
			[ lastPosition := currentState position.
			lastState := currentState scannerState.
			scanner
				state: currentState scannerState;
				setPosition: currentState position.
			lastToken := currentToken := scanner next.
			nextScannerPosition := scanner position.
			nextScannerState := scanner state ].
	currentState
		scannerState: nextScannerState;
		position: nextScannerPosition