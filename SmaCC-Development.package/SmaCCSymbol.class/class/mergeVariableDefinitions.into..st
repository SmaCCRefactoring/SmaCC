private
mergeVariableDefinitions: collection into: result
	collection
		do:
			[:each | 
			| variable |
			variable := result detect: [:def | def variableName = each variableName] ifNone: [result add: each copy].
			each getterMethodName notNil ifTrue: [variable getterMethodName: each getterMethodName].
			each setterMethodName notNil ifTrue: [variable setterMethodName: each setterMethodName].
			each isCollection ifTrue: [variable isCollection: true]]