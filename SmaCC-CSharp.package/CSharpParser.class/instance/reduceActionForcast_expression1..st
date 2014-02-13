generated-reduction actions
reduceActionForcast_expression1: nodes
	| result |
	result := CSCastExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result