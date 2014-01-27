generated
reduceActionForarray_creation_expression3: nodes
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result addNode: (nodes at: 2) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 3).
	^result