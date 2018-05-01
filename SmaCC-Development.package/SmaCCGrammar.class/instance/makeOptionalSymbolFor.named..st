accessing
makeOptionalSymbolFor: aSmaCCSymbol named: aString
	| symbol |
	symbol := self nonTerminalSymbolNamed: aSmaCCSymbol printString , '?'.
	symbol isEmpty
		ifTrue: [ symbol
				addProduction:
					(self newRHS
						reduceActionSource: 'nil';
						yourself);
				addProduction:
					(self newRHS
						add: aSmaCCSymbol;
						nameLastItem: aString;
						reduceActionSource: '''1''';
						yourself) ].
	^ symbol