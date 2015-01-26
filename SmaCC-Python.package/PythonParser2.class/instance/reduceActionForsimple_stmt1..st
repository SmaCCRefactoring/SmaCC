generated-reduction actions
reduceActionForsimple_stmt1: nodes
	| result |
	result := nodes at: 3.
	result addFirstNode: (nodes at: 1) to: result stmts.
	result addFirstToken: (nodes at: 2) to: result semicolonTokens.
	^ result