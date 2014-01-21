item
newStartingSymbolNamed: aString
	^(SmaCCStartingSymbol name: 'B e g i n' , aString)
		grammar: self;
		yourself