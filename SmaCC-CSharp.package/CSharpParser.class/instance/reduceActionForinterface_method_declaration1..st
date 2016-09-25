generated-reduction actions
reduceActionForinterface_method_declaration1: nodes
	| result |
	result := CSInterfaceMethodDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result typeParameters: (nodes at: 5).
	result leftParen: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result parameters.
	result addTokens: ((nodes at: 7) at: 2) to: result commas.
	result rightParen: (nodes at: 8).
	result addNodes: (nodes at: 9) to: result constraintClauses.
	result semicolon: (nodes at: 10).
	^ result