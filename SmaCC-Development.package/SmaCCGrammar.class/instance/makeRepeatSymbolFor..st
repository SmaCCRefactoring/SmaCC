accessing
makeRepeatSymbolFor: aSmaCCSymbol
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Repeat: ' , aSmaCCSymbol printString.
	symbol isEmpty
		ifTrue: [ 
			symbol
				addProduction:
						(self newRHS
								reduceActionSource: 'OrderedCollection new';
								yourself);
				addProduction:
						(self newRHS
								add: symbol;
								add: aSmaCCSymbol;
								reduceActionSource: '''1'' add: ''2''; yourself';
								yourself) ].
	^ symbol