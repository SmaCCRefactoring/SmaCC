initialize
addRenamedVariableName: aString from: symbol
	(self hasVariableNamed: aString)
		ifTrue: [ (self variableNamed: aString) isCollection: true ]
		ifFalse: [ 
			| variable |
			variable := self addVariableNamed: aString.
			variable isCollection
				ifFalse: [ 
					symbol returnsSingleVariable
						ifTrue: [ 
							symbol
								productionsDo: [ :rhs | 
									rhs variableDefinitions notEmpty
										ifTrue: [ variable isCollection: (variable isCollection or: [ rhs variableDefinitions first isCollection ]) ] ] ] ] ]