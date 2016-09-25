generated-reduction actions
reduceActionForPrimaryExpression1: nodes
	| result |
	result := JSThisExpressionNode new.
	result thisToken: (nodes at: 1).
	^ result