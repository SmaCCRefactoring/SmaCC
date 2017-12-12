generated-reduction actions
reduceActionForfunction_definition2: nodes
	| result |
	result := CGLRFunctionDefinitionNode new.
	result addObjects: (nodes at: 1) to: result specifierses.
	result declarator: (nodes at: 2).
	result body: (nodes at: 3).
	^ result