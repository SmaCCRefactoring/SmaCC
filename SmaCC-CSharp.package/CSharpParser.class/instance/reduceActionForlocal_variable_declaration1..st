generated-reduction actions
reduceActionForlocal_variable_declaration1: nodes
	| result |
	result := CSLocalVariableDeclarationNode new.
	result type: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result declarators.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result