generated-reduction actions
reduceActionForDefinition2: nodes
	| result |
	result := LLVMFunctionDeclarationNode new.
	result declareToken: (nodes at: 1).
	result prototype: (nodes at: 2).
	^ result