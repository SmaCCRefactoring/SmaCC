generated-reduction actions
reduceActionForobject_creation_expression2: nodes
	| result |
	result := CSObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	^ result