generated-reduction actions
reduceActionForgoto_statement1: nodes
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result