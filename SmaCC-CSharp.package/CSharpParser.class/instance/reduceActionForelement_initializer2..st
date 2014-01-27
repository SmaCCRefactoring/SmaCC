generated
reduceActionForelement_initializer2: nodes
	| result |
	result := CSElementInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^result