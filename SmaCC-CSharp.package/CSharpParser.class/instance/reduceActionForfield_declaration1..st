generated-reduction actions
reduceActionForfield_declaration1: nodes
	| result |
	result := CSFieldDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result newTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result publicTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result protectedTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result internalTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result privateTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result readonlyTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result volatileTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result unsafeTokens.
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 5).
	^ result