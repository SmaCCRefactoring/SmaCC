generated
reduceActionForassignment1: nodes
	| result |
	result := CSAssignmentNode new.
	result lhs: (nodes at: 1).
	result operator: (nodes at: 2).
	result rhs: (nodes at: 3).
	^result