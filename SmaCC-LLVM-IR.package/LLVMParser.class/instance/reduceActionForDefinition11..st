generated-reduction actions
reduceActionForDefinition11: nodes
	| result |
	result := LLVMLibraryDefinitionNode new.
	result deplibsToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result libraries: (nodes at: 3).
	^ result