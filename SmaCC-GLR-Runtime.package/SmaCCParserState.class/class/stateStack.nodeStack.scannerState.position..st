instance creation
stateStack: stateStack nodeStack: nodeStack scannerState: aSymbol position: anInteger
	^ self new
		stateStack: stateStack nodeStack: nodeStack;
		scannerState: aSymbol;
		position: anInteger;
		yourself