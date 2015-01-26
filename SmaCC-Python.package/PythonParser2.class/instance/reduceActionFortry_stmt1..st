generated-reduction actions
reduceActionFortry_stmt1: nodes
	| result |
	result := PyTryNode new.
	result tryToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result colonTokens.
	result addNode: (nodes at: 3) to: result suites.
	result addNodes: ((nodes at: 4) at: 1) to: result clauses.
	result addTokens: ((nodes at: 4) at: 2) to: result colonTokens.
	result addNodes: ((nodes at: 4) at: 3) to: result suites.
	result else: (nodes at: 5).
	result finally: (nodes at: 6).
	^ result