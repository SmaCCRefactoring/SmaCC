initialize
addExternallyDefinedVariablesFrom: aSmaCCRHS
	aSmaCCRHS variableDefinitions
		do:
			[:each | 
			| variable |
			variable := self variableNamed: each variableName.
			(each isCollection
				or: [(currentRHS locallyDefinesVariable: each variableName) or: [previousVariables includes: each variableName]])
				ifTrue: [variable isCollection: true]]