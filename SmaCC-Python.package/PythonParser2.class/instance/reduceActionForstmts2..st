generated-reduction actions
reduceActionForstmts2: nodes
	| result |
	result := ASTStatementsNode new.
	result addNode: (nodes at: 1) to: result statements.
	^ result