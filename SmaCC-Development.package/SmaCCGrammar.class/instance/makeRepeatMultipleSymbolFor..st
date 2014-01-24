accessing
makeRepeatMultipleSymbolFor: aSmaCCSymbol 
	| symbol |
	symbol := self 
				nonTerminalSymbolNamed: 'Repeat Multiple: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							add: aSmaCCSymbol;
							reduceAction: 'OrderedCollection with: ''1''';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: symbol;
							add: aSmaCCSymbol;
							reduceAction: '''1'' add: ''2''; yourself';
							yourself)].
	^symbol