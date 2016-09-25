item creation
newNonTerminalSymbolNamed: aString
	^ (SmaCCNonTerminalSymbol name: aString)
		grammar: self;
		yourself