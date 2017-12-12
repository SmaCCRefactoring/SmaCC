generated-reduction actions
reduceActionFordirect_declarator8: nodes
	| result |
	result := CGLRFunctionDeclaratorNode new.
	result declarator: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result