generated-reduction actions
reduceActionForcast_expression1: nodes
	| result |
	result := JavaCastExpressionNode new.
	result left: (nodes at: 1).
	result type: (nodes at: 2).
	result right: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result