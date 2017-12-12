generated-reduction actions
reduceActionForstruct_declaration1: nodes
	| result |
	result := CGLRStructDeclarationNode new.
	result addObjects: ((nodes at: 1) at: 1) to: result specifiers.
	result addTokens: ((nodes at: 1) at: 2) to: result qualifiers.
	result addNodes: ((nodes at: 2) at: 1) to: result declarators.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 3).
	^ result