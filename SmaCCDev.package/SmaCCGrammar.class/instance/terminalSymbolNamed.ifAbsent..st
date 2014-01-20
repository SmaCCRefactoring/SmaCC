private
terminalSymbolNamed: aString ifAbsent: aBlock 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols add: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (scannerDefinition tokenNamed: aString
									ifAbsentPut: 
										[| node |
										node := self class implicitToken: aString.
										node isNil ifTrue: [^aBlock value].
										node addStates: scannerDefinition nonExcludeStates.
										node]);
						yourself)]