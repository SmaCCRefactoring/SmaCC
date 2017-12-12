generated-reduction actions
reduceActionForfunction_definition4: nodes
	| result |
	result := CGLRFunctionDefinitionNode new.
	result declarator: (nodes at: 1).
	result body: (nodes at: 2).
	^ result