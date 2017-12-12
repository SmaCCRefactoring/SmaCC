generated-reduction actions
reduceActionForunary_expression6: nodes
	| result |
	result := CGLRUnaryExpressionNode new.
	result sizeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result expr: (nodes at: 4).
	^ result