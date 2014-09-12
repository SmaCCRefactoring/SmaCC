private
connectChild
	"Connect child. What does this do?"

	| variableDefinition argument |
	variableDefinition := rhs nodeType variableDefinitionNamed: variableName.
	argument := generator cast: (generator argumentIndex: currentIndex) to: variableDefinition baseType name.
	^ self compileAddToVariable: variableDefinition from: argument collection: false