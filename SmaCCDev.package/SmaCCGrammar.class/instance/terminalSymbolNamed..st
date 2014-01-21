private
terminalSymbolNamed: aString
	^self
		findSymbolNamed: aString
		ifAbsentAdd:
			[(self newTerminalSymbolNamed: aString)
				regularExpression: (scannerDefinition tokenNamed: aString);
				yourself]