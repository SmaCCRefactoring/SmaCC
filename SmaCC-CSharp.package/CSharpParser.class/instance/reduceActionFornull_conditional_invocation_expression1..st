generated-reduction actions
reduceActionFornull_conditional_invocation_expression1: nodes
	| result |
	result := CSNullConditionalInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result