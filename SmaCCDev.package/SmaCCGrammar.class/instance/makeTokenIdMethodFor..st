accessing
makeTokenIdMethodFor: aString 
	| token |
	token := (scannerDefinition includesTokenNamed: aString) 
				ifTrue: [self terminalSymbolNamed: aString]
				ifFalse: 
					[symbols detect: [:each | each name = aString]
						ifNone: [symbols add: (SmaCCTerminalSymbol name: aString)]].
	token createIdMethod: true