generated-reduction actions
reduceActionForprimary_expr2: nodes
	| result |
	result := ASTPrimaryExprNode new.
	result literal: (nodes at: 1).
	^ result