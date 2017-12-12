generated-reduction actions
reduceActionForfunction_definition3: nodes
	| result |
	result := CGLRFunctionDefinitionNode new.
	result declarator: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result argumentses.
	result body: (nodes at: 3).
	^ result