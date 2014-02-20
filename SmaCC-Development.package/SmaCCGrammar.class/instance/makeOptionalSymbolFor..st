accessing
makeOptionalSymbolFor: aSmaCCSymbol
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Optional: ' , aSmaCCSymbol printString.
	symbol isEmpty
		ifTrue: [ 
			symbol
				addProduction:
						(self newRHS
								reduceActionSource: 'nil';
								yourself);
				addProduction:
						(self newRHS
								add: aSmaCCSymbol;
								reduceActionSource: '''1''';
								yourself) ].
	^ symbol