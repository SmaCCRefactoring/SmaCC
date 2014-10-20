generated-reduction actions
reduceActionForstatic_constructor_declaration1: nodes
	| result |
	result := CSStaticConstructorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result staticToken: ((nodes at: 2) at: 2).
	result unsafeToken: ((nodes at: 2) at: 3).
	result identifierToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	result block: ((nodes at: 6) at: 1).
	result semicolonToken: ((nodes at: 6) at: 2).
	^ result