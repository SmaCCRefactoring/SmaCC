generated-reduction actions
reduceActionForpostincrement_expression1: nodes
	| result |
	result := JavaPostIncrementExpressionNode new.
	result expression: (nodes at: 1).
	result plusPlus: (nodes at: 2).
	^ result