generated-reduction actions
reduceActionForclass_declaration1: nodes
	| result |
	result := CSClassDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result partialToken: ((nodes at: 3) at: 1).
	result classToken: (nodes at: 4).
	result _name: (nodes at: 5).
	result typeParameters: ((nodes at: 6) at: 1).
	result colonToken: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result commaToken: ((nodes at: 7) at: 4).
	result addNodes: ((nodes at: 8) at: 1) to: result constraintClauses.
	result leftBraceToken: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 9) at: 3).
	result semicolon: ((nodes at: 10) at: 1).
	^ result