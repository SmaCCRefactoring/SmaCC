generated-reduction actions
reduceActionForexception_filter1: nodes
	| result |
	result := CSExceptionFilterNode new.
	result whenToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result