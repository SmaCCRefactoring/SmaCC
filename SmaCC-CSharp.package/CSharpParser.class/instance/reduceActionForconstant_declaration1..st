generated
reduceActionForconstant_declaration1: nodes
	| result |
	result := CSConstantDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result constToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result declarators.
	result addTokens: ((nodes at: 5) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 6).
	^result