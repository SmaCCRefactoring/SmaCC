generated-reduction actions
reduceActionForcollection_initializer2: nodes
	| result |
	result := CSCollectionInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result