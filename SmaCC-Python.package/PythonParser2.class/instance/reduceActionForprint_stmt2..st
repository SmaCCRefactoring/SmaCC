generated-reduction actions
reduceActionForprint_stmt2: nodes
	| result |
	result := PyPrintNode new.
	result printToken: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result tests.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	^ result