generated-reduction actions
reduceActionFordirect_abstract_declarator6: nodes
	| result |
	result := CGLRFunctionDeclaratorNode new.
	result leftParenToken: (nodes at: 1).
	result rightParenToken: (nodes at: 2).
	^ result