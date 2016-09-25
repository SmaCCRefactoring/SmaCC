reduction table
connectChild
	| variableDefinition argument symbol isCollection |
	variableDefinition := rhs nodeType
		variableDefinitionNamed: variableName.
	argument := generator
		cast: (generator argumentIndex: currentIndex)
		to: variableDefinition baseType name.
	isCollection := false.
	symbol := rhs at: currentIndex.
	symbol returnsSingleVariable
		ifTrue: [ isCollection := symbol isCollection: symbol variableName ].
	^ self
		compileAddToVariable: variableDefinition
		from: argument
		collection: isCollection