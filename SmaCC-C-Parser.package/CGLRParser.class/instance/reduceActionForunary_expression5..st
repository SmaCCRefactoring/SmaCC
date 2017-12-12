generated-reduction actions
reduceActionForunary_expression5: nodes
	| result |
	result := CGLRUnaryExpressionNode new.
	result sizeofToken: (nodes at: 1).
	result expr: (nodes at: 2).
	^ result