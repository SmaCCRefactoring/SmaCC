generated-reduction actions
reduceActionForlocal_constant_declaration1: nodes
	| result |
	result := CSLocalConstantDeclarationNode new.
	result constToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result declarators.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	^ result