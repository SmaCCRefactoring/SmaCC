generated-reduction actions
reduceActionForenum_declaration1: nodes
	| result |
	result := JavaEnumDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result enumToken: (nodes at: 2).
	result _name: (nodes at: 3).
	result implementsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result left: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result constants.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result semicolon: ((nodes at: 5) at: 4).
	result addNodes: ((nodes at: 5) at: 5) to: result declarations.
	result right: ((nodes at: 5) at: 6).
	^ result