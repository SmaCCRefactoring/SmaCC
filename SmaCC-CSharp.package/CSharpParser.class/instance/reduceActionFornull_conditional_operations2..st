generated-reduction actions
reduceActionFornull_conditional_operations2: nodes
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	^ result