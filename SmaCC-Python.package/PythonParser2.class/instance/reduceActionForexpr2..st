generated-reduction actions
reduceActionForexpr2: nodes
	| result |
	result := ASTVBarExprNode new.
	result one: (nodes at: 1).
	result orToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result