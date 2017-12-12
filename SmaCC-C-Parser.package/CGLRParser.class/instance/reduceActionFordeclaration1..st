generated-reduction actions
reduceActionFordeclaration1: nodes
	| result |
	result := CGLRDeclarationNode new.
	result addObjects: (nodes at: 1) to: result specifiers.
	result semicolonToken: (nodes at: 2).
	^ result