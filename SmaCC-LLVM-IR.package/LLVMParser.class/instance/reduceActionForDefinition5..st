generated-reduction actions
reduceActionForDefinition5: nodes
	| result |
	result := LLVMLocalVoidAssignNode new.
	result assign: (nodes at: 1).
	result typeToken: (nodes at: 2).
	result voidToken: (nodes at: 3).
	^ result