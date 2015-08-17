private
hasSingleVariableName: aSymbol using: nameSet seen: seen
	(seen includes: aSymbol)
		ifTrue: [ ^ true ].
	seen add: aSymbol.
	aSymbol
		productionsDo: [ :rhs | 
			nameSet addAll: rhs variableNames.
			nameSet size > 1
				ifTrue: [ ^ false ].
			rhs
				unnamedSymbolsDo: [ :sym | 
					(self hasSingleVariableName: sym using: nameSet seen: seen)
						ifFalse: [ ^ false ] ] ].
	^ true