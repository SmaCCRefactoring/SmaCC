generated-reduction actions
reduceActionForDefinition6: nodes
	| result |
	result := LLVMGlobalConstAssignNode new.
	result assign: (nodes at: 1).
	result visibility: (nodes at: 2).
	result thread: (nodes at: 3).
	result type: (nodes at: 4).
	result constant: (nodes at: 5).
	result addrSpace: (nodes at: 6).
	result _attributes: (nodes at: 7).
	^ result