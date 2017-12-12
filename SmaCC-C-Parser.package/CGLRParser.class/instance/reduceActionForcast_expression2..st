generated-reduction actions
reduceActionForcast_expression2: nodes
	| result |
	result := CGLRCastExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	result expr: (nodes at: 4).
	^ result