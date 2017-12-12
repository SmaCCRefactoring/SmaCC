generated-reduction actions
reduceActionFordirect_declarator6: nodes
	| result |
	result := CGLRFunctionDeclaratorNode new.
	result declarator: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result parameters.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result ellipsis: ((nodes at: 3) at: 3).
	result rightParenToken: (nodes at: 4).
	^ result