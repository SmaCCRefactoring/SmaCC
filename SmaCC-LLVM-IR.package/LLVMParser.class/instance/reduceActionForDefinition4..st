generated-reduction actions
reduceActionForDefinition4: nodes
	| result |
	result := LLVMLocalTypeAssignNode new.
	result assign: (nodes at: 1).
	result typeToken: (nodes at: 2).
	result types: (nodes at: 3).
	^ result