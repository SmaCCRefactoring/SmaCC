generated
reduceActionForyield_statement1: nodes
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result returnToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^result