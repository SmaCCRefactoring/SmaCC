compiling-parser
setGetterMethodNameTo: aSmaCCVariableDefinition withName: variableName
	aSmaCCVariableDefinition
		getterMethodName: (self methodNameFor: variableName)