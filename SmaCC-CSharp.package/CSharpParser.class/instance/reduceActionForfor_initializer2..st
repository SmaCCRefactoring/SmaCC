generated-reduction actions
reduceActionForfor_initializer2: nodes
	| result |
	result := CSStatementListNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result expressions.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	^ result