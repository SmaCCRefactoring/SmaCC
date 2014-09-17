generated-reduction actions
reduceActionForModule2: nodes
	| result |
	result := LLVMModuleNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result definitions.
	^ result