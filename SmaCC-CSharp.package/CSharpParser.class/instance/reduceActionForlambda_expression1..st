generated
reduceActionForlambda_expression1: nodes
	| result |
	result := CSLambdaExpressionNode new.
	result signature: (nodes at: 1).
	result equalGreaterThanToken: (nodes at: 2).
	result body: (nodes at: 3).
	^result