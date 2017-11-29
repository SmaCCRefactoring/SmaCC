instance creation
stateStack: stateStack nodeStack: nodeStack scannerState: aSmaCCScannerState
	^ self new
		stateStack: stateStack nodeStack: nodeStack;
		scannerState: aSmaCCScannerState;
		yourself