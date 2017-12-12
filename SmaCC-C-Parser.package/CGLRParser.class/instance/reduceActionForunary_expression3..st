generated-reduction actions
reduceActionForunary_expression3: nodes
	| result |
	result := CGLRUnaryExpressionNode new.
	result op: (nodes at: 1).
	result expr: (nodes at: 2).
	^ result