accessing
setStartSymbolIfNone: aSmaCCSymbol
	| startSymbol |
	self startSymbol notNil
		ifTrue: [ ^ self ].
	startSymbol := self newStartingSymbolNamed: ''.
	self addSymbol: startSymbol.
	startSymbol
		addProduction:
			(self newRHS
				add: aSmaCCSymbol;
				yourself)