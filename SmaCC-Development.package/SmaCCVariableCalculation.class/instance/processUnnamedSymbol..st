private
processUnnamedSymbol: aSmaCCSymbol
	aSmaCCSymbol
		productionsDo:
			[ :rhs | 
			(self shouldAddVariablesFrom: rhs)
				ifTrue: [ self addExternallyDefinedVariablesFrom: rhs ] ]