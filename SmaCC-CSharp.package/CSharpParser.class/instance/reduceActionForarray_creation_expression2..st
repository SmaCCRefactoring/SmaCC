generated-reduction actions
reduceActionForarray_creation_expression2: nodes
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result arrayInitializer: (nodes at: 3).
	^ result