generated-reduction actions
reduceActionForyield_statement2: nodes
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result breakToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result