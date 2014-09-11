private
calculateSymbolVariables
	variableSymbols := Set new.
	grammar symbols
		do: [ :each | 
			each requiresNodeType
				ifTrue: [ each productionsDo: [ :rhs | rhs unnamedSymbolsDo: [ :sym | self calculateSymbolVariablesFor: sym ] ] ] ].
	variableSymbols := variableSymbols select: [ :each | self hasVariables: each seen: IdentitySet new ].
	variableSymbols inspect