generated-reduction actions
reduceActionFordeclaration2: nodes
	| result |
	result := CGLRDeclarationNode new.
	result addObjects: ((nodes at: 1) at: 1) to: result specifiers.
	result addNodes: ((nodes at: 1) at: 2) to: result declarators.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result semicolonToken: (nodes at: 2).
	^ result