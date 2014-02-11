generated-reduction actions
reduceActionFordim_expr1: nodes
	| result |
	result := JavaDimensionExpressionNode new.
	result left: (nodes at: 1).
	result expression: (nodes at: 2).
	result right: (nodes at: 3).
	^ result