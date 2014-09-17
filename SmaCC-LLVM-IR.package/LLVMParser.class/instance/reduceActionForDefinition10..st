generated-reduction actions
reduceActionForDefinition10: nodes
	| result |
	result := LLVMTargetDefinitionNode new.
	result targetToken: (nodes at: 1).
	result target: (nodes at: 2).
	^ result