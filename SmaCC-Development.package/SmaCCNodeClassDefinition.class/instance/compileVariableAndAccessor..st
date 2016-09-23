compiling
compileVariableAndAccessor: aSmaCCVariableDefinition
	aSmaCCVariableDefinition
		baseType: (self baseTypeOf: aSmaCCVariableDefinition variableName).
	aSmaCCVariableDefinition
		isAlwaysAssigned: (self isAlwaysAssigned: aSmaCCVariableDefinition variableName).
	self addVariable: aSmaCCVariableDefinition.
	self compileGetterAndSetter: aSmaCCVariableDefinition