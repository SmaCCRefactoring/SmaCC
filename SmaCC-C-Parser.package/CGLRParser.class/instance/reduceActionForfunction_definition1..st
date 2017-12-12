generated-reduction actions
reduceActionForfunction_definition1: nodes
	| result |
	result := CGLRFunctionDefinitionNode new.
	result addObjects: (nodes at: 1) to: result specifierses.
	result declarator: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result argumentses.
	result body: (nodes at: 4).
	^ result