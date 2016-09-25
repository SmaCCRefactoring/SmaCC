compiling
compileMethodsAndVariables
	nodeClassDefinitions do: [ :each | self compileVisitMethodFor: each ].
	self codeGenerator
		compileAcceptNodeMethodFor: self
		rootNode: grammar rootDefinition