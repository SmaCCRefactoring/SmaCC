generated
reduceActionFordelegate_declaration1: nodes
	| result |
	result := CSDelegateDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result delegateToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: ((nodes at: 6) at: 1).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result parameters.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	result addNodes: ((nodes at: 10) at: 1) to: result constraintClauses.
	result semicolon: (nodes at: 11).
	^result