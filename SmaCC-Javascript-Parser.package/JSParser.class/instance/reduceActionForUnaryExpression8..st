generated-reduction actions
reduceActionForUnaryExpression8: nodes
	| result |
	result := JSUnaryExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result