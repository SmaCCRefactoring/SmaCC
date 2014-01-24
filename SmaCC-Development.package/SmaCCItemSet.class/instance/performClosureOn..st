private
performClosureOn: aSmaCCLR1Item
	| nextSymbol rest first followers |
	nextSymbol := aSmaCCLR1Item nextSymbol.
	nextSymbol isTerminal
		ifTrue: [ ^ self ].
	rest := aSmaCCLR1Item rest.
	first := rest firstTerminals.
	followers := SmaCCSymbolSet new.
	(first includes: grammar emptySymbol)
		ifTrue: [ 
			first remove: grammar emptySymbol.
			followers baseOn: aSmaCCLR1Item followers ].
	followers addAll: first.
	nextSymbol productionsDo: [ :each | self add: (SmaCCLR1Item rhs: each follow: followers) ]