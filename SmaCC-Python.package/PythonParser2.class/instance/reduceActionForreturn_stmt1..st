generated-reduction actions
reduceActionForreturn_stmt1: nodes
	| result |
	result := PyReturnNode new.
	result returnToken: (nodes at: 1).
	result args: (nodes at: 2).
	^ result