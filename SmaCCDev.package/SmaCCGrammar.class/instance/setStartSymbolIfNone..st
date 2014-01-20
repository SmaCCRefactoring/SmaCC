accessing
setStartSymbolIfNone: aSmaCCSymbol 
	| startSymbol |
	self startSymbol notNil ifTrue: [^self].
	startSymbol := SmaCCStartingSymbol name: 'B e g i n'.
	self addSymbol: startSymbol.
	startSymbol addProduction: ((SmaCCRHS new)
				add: aSmaCCSymbol;
				yourself)