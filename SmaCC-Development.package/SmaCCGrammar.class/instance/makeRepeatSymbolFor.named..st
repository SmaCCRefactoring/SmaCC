accessing
makeRepeatSymbolFor: aSmaCCSymbol named: aString
	| symbol |
	symbol := self nonTerminalSymbolNamed: aSmaCCSymbol printString , '*'.
	symbol isEmpty
		ifTrue: [ symbol
				addProduction:
					(self newRHS
						reduceActionSource: 'OrderedCollection new';
						yourself);
				addProduction:
					(self newRHS
						add: symbol;
						add: aSmaCCSymbol;
						nameLastItem: aString;
						reduceActionSource: '''1'' add: ''2''; yourself';
						yourself) ].
	^ symbol