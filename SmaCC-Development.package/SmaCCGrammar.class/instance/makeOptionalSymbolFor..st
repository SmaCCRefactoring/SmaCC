accessing
makeOptionalSymbolFor: aSmaCCSymbol 
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Optional: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							reduceAction: 'nil';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: aSmaCCSymbol;
							reduceAction: '''1''';
							yourself)].
	^symbol