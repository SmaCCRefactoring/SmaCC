accessing
makeRepeatSymbolFor: aSmaCCSymbol 
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Repeat: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							reduceAction: 'OrderedCollection new';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: symbol;
							add: aSmaCCSymbol;
							reduceAction: '''1'' add: ''2''; yourself';
							yourself)].
	^symbol