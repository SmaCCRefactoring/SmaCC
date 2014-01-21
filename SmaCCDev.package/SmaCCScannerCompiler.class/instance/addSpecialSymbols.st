private
addSpecialSymbols
	grammar tokens
		keysDo:
			[:each | (codeGenerator scannerActionFor: each) notNil ifTrue: [grammar terminalSymbolNamed: each]]