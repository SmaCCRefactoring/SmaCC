generated
reduceActionForempty_dim_expr1: nodes
	| result |
	result := JavaEmptyDimensionListNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^result