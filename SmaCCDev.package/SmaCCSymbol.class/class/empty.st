instance creation
empty
	EmptySymbol isNil 
		ifTrue: [EmptySymbol := SmaCCTerminalSymbol name: 'E O F'].
	^EmptySymbol