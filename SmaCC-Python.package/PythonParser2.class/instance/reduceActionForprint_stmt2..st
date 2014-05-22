generated-reduction actions
reduceActionForprint_stmt2: nodes
	| result |
	result := PyPrintNode new.
	result printToken: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result arguments: (nodes at: 3).
	^ result