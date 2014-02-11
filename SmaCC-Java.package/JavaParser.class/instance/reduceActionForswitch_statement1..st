generated-reduction actions
reduceActionForswitch_statement1: nodes
	| result |
	result := JavaSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result block: (nodes at: 5).
	^ result