private
performClosureOn: aSmaCCLR1Item 
	| nextSymbol rest first followers |
	nextSymbol := aSmaCCLR1Item nextSymbol.
	nextSymbol isTerminal ifTrue: [^self].
	rest := aSmaCCLR1Item rest.
	first := rest firstTerminals.
	followers := SmaCCSymbolSet new.
	(first includes: SmaCCSymbol empty) 
		ifTrue: 
			[first remove: SmaCCSymbol empty.
			followers baseOn: aSmaCCLR1Item followers].
	followers addAll: first.
	nextSymbol productionsDo: 
			[:each | 
			self add: (SmaCCLR1Item 
						symbol: nextSymbol
						rhs: each
						follow: followers)]