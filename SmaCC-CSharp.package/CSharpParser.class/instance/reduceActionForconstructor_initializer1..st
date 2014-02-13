generated-reduction actions
reduceActionForconstructor_initializer1: nodes
	| result |
	result := CSConstructorInitializerNode new.
	result colonToken: (nodes at: 1).
	result baseToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result