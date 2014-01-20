instance creation
error
	ErrorSymbol isNil 
		ifTrue: [ErrorSymbol := SmaCCTerminalSymbol name: 'error'].
	^ErrorSymbol