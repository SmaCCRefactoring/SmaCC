generated-reduction actions
reduceActionFordirect_declarator7: nodes
	| result |
	result := CGLRFunctionDeclaratorNode new.
	result declarator: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result identifiers.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result