generated
reduceActionForpost_increment_expression1: nodes
	| result |
	result := CSPostExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^result