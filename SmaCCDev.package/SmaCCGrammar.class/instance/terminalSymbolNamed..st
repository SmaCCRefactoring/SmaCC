private
terminalSymbolNamed: aString 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols add: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (scannerDefinition tokenNamed: aString);
						yourself)]