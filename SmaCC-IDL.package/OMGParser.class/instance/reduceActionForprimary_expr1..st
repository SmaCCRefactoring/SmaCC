generated-reduction actions
reduceActionForprimary_expr1: nodes
	| result |
	result := ASTPrimaryExprNode new.
	result scopedName: (nodes at: 1).
	^ result