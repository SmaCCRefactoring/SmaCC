generated-reduction actions
reduceActionForreturn_stmt1: nodes
	| result |
	result := PyReturnNode new.
	result returnToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result