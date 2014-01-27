generated
reduceActionForanonymous_object_creation_expression1: nodes
	| result |
	result := CSAnonymousObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result leftBraceToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result declarators.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result rightBraceToken: ((nodes at: 2) at: 4).
	^result