generated-reduction actions
reduceActionForstring_type1: nodes
	| result |
	result := ASTStringTypeNode new.
	result stringToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result positiveIntConst: (nodes at: 3).
	result greaterThanToken: (nodes at: 4).
	^ result