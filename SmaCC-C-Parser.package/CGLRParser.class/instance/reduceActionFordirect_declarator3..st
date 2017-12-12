generated-reduction actions
reduceActionFordirect_declarator3: nodes
	| result |
	result := CGLRFunctionPointerDeclaratorNode new.
	result leftParenToken: (nodes at: 1).
	result declarator: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result