generated-reduction actions
reduceActionForinvocation_expression1: nodes
	| result |
	result := CSInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result