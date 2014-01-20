private
nonTerminalSymbolNamed: aString 
	^symbols detect: [:each | each name = aString]
		ifNone: [self addSymbol: (SmaCCNonTerminalSymbol name: aString)]