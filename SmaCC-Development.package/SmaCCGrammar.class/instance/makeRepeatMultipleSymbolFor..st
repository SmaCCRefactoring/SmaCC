accessing
makeRepeatMultipleSymbolFor: aSmaCCSymbol
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Repeat Multiple: ' , aSmaCCSymbol printString.
	symbol isEmpty
		ifTrue: [ 
			symbol
				addProduction:
						(self newRHS
								add: aSmaCCSymbol;
								reduceActionSource: 'OrderedCollection with: ''1''';
								yourself);
				addProduction:
						(self newRHS
								add: symbol;
								add: aSmaCCSymbol;
								reduceActionSource: '''1'' add: ''2''; yourself';
								yourself) ].
	^ symbol