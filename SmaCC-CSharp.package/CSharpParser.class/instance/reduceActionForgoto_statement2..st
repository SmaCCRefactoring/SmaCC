generated-reduction actions
reduceActionForgoto_statement2: nodes
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result caseToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result