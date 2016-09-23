generated-reduction actions
reduceActionForPostfixExpression3: nodes
	| result |
	result := JSPostfixExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result