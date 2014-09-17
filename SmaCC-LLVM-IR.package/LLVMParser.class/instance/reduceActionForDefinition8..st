generated-reduction actions
reduceActionForDefinition8: nodes
	| result |
	result := LLVMGlobalTypeAssignNode new.
	result assign: (nodes at: 1).
	result externalLinkage: (nodes at: 2).
	result visibility: (nodes at: 3).
	result thread: (nodes at: 4).
	result type: (nodes at: 5).
	result types: (nodes at: 6).
	result addrSpace: (nodes at: 7).
	result _attributes: (nodes at: 8).
	^ result