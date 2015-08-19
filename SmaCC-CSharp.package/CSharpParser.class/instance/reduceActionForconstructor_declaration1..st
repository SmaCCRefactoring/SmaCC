generated-reduction actions
reduceActionForconstructor_declaration1: nodes
	| result |
	result := CSConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result identifierToken: ((nodes at: 3) at: 1).
	result leftParenToken: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result parameters.
	result addTokens: ((nodes at: 3) at: 4) to: result commas.
	result rightParenToken: ((nodes at: 3) at: 5).
	result initializer: ((nodes at: 3) at: 6).
	result block: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result