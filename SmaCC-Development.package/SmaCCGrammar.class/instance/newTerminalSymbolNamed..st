item creation
newTerminalSymbolNamed: aString
	^ (SmaCCTerminalSymbol name: aString)
		grammar: self;
		yourself