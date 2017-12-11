generated-reduction actions
reduceActionForassignment_expression2: nodes
	| result |
	result := CGLRAssignmentNode new.
	result lvalue: (nodes at: 1).
	result op: (nodes at: 2).
	result rvalue: (nodes at: 3).
	^ result