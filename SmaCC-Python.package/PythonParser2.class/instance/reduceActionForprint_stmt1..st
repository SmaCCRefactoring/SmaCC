generated-reduction actions
reduceActionForprint_stmt1: nodes
	| result |
	result := PyPrintNode new.
	result printToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result