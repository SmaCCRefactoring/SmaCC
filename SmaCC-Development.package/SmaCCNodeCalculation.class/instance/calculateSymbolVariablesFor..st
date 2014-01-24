private
calculateSymbolVariablesFor: aSmaCCSymbol
	aSmaCCSymbol isTerminal ifTrue: [^self].
	aSmaCCSymbol requiresNodeType ifTrue: [^self].
	(variableSymbols includes: aSmaCCSymbol) ifTrue: [^self].
	variableSymbols add: aSmaCCSymbol.
	aSmaCCSymbol productionsDo: [:rhs | rhs unnamedSymbolsDo: [:each | self calculateSymbolVariablesFor: each]]