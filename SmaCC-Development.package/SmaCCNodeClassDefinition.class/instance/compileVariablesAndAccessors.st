compiling
compileVariablesAndAccessors
	self variableDefinitions
		do: [ :each | self compileVariableAndAccessor: each ].
	self extraAttributes
		do: [ :each | self compileVariableAndAccessor: each ]