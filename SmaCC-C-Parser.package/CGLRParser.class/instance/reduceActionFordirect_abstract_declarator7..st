generated-reduction actions
reduceActionFordirect_abstract_declarator7: nodes
	| result |
	result := CGLRFunctionDeclaratorNode new.
	result leftParenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result ellipsis: ((nodes at: 2) at: 3).
	result rightParenToken: (nodes at: 3).
	^ result