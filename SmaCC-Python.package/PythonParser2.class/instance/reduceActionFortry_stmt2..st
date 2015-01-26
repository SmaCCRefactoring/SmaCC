generated-reduction actions
reduceActionFortry_stmt2: nodes
	| result |
	result := PyTryNode new.
	result tryToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result colonTokens.
	result addNode: (nodes at: 3) to: result suites.
	result finallyToken: (nodes at: 4).
	result addToken: (nodes at: 5) to: result colonTokens.
	result finally: (nodes at: 6).
	^ result