generated-reduction actions
reduceActionForlambda_expression1: nodes
	| result |
	result := JavaLambdaExpressionNode new.
	result leftParen: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result parameters.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result rightParen: ((nodes at: 1) at: 4).
	result arrowToken: (nodes at: 2).
	result _value: ((nodes at: 3) at: 1).
	^ result