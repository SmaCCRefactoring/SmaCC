generated
reduceActionForgoto_statement3: nodes
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result defaultToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^result