generated
reduceActionForelement_access1: nodes
	| result |
	result := CSElementAccessNode new.
	result baseExpression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^result