private
addRenamedVariableName: aString from: symbol
	"when we add a variable and testing for existence, isCollection is allways false"

	(self hasVariableNamed: aString)
		ifTrue: [ (self variableNamed: aString) isCollection: true ]
		ifFalse: [ | variable |
			variable := self addVariableNamed: aString.
			symbol returnsSingleVariable
				ifTrue: [ symbol
						productionsDo: [ :rhs | 
							rhs variableDefinitions notEmpty
								ifTrue: [ variable
										isCollection:
											(variable isCollection
												or: [ rhs variableDefinitions first isCollection ]) ] ] ] ]