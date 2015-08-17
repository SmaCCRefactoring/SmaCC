private
setupVariableDependentsFor: aSmaCCRHS
	aSmaCCRHS
		variablesAndSymbolsDo: [ :variable :symbol | 
			(variable isNil or: [ symbol returnsSingleVariable ])
				ifTrue: [ symbol productionsDo: [ :rhs | self addDependent: aSmaCCRHS to: rhs ] ] ]