generated-reduction actions
reduceActionForcast_expression1: nodes
	| result |
	result := JavaCastExpressionNode new.
	result addToken: (nodes at: 1) to: result lefts.
	result type: (nodes at: 2).
	result addToken: (nodes at: 3) to: result rights.
	result expression: (nodes at: 4).
	^ result