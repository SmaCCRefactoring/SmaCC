generated-reduction actions
reduceActionFornull_conditional_operations4: nodes
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result