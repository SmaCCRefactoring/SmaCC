generated
reduceActionForobject_initializer1: nodes
	| result |
	result := CSObjectInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result identifiers.
	result addTokens: ((nodes at: 2) at: 2) to: result equalTokens.
	result addNodes: ((nodes at: 2) at: 3) to: result values.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^result