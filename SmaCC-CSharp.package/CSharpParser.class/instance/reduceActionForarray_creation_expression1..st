generated
reduceActionForarray_creation_expression1: nodes
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 7).
	^result