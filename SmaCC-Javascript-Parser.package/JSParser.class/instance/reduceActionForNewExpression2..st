generated-reduction actions
reduceActionForNewExpression2: nodes
	| result |
	result := JSNewExpressionNode new.
	result newToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result