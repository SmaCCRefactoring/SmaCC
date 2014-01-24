private
compileAddToVariable: aSmaCCVariableDefinition from: argument collection: isCollection
	^aSmaCCVariableDefinition isCollection
		ifTrue:
			[| selector var |
			var := rhs nodeType variableDefinitionNamed: aSmaCCVariableDefinition variableName.
			selector := 'add'.
			currentIndex < index ifTrue: [selector := selector , 'First'].
			selector := selector
				, (var isBaseNodeType ifTrue: ['Node'] ifFalse: [var isBaseTokenType ifTrue: ['Token'] ifFalse: ['Object']]).
			isCollection ifTrue: [selector := selector , 's'].
			selector := (selector , ':to:') asSymbol.
			generator
				send: selector
				to: 'result'
				with: argument
				with: (generator send: var getterMethodName to: 'result')]
		ifFalse:
			[generator
				send: aSmaCCVariableDefinition setterMethodName
				to: 'result'
				with: argument]