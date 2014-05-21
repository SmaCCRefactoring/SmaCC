generated-reduction actions
reduceActionForarith_expr2: nodes
	| result |
	result := ASTPlusExprNode new.
	result one: (nodes at: 1).
	result plusToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result