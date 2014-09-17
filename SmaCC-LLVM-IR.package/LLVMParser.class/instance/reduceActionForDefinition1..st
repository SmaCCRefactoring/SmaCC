generated-reduction actions
reduceActionForDefinition1: nodes
	| result |
	result := LLVMFunctionDefinitionNode new.
	result defineToken: (nodes at: 1).
	result function: (nodes at: 2).
	^ result