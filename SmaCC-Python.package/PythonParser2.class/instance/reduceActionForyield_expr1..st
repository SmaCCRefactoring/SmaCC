generated-reduction actions
reduceActionForyield_expr1: nodes
	| result |
	result := PyYieldNode new.
	result yieldToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result