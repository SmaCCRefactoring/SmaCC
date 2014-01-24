accessing
makeTokenIdMethodFor: aString
	| token |
	token := (scannerDefinition includesTokenNamed: aString)
		ifTrue: [self terminalSymbolNamed: aString]
		ifFalse: [self findSymbolNamed: aString ifAbsentAdd: [self newTerminalSymbolNamed: aString]].
	token createIdMethod: true