generated-reduction actions
reduceActionForfield_declaration1: nodes
	| result |
	result := CSFieldDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 5).
	^ result