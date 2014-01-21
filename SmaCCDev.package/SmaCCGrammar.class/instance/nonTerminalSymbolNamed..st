private
nonTerminalSymbolNamed: aString
	^self findSymbolNamed: aString ifAbsentAdd: [self newNonTerminalSymbolNamed: aString]