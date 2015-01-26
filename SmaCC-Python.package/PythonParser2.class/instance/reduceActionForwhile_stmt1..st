generated-reduction actions
reduceActionForwhile_stmt1: nodes
	| result |
	result := PyWhileNode new.
	result whileToken: (nodes at: 1).
	result test: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result suite: (nodes at: 4).
	result else: (nodes at: 5).
	^ result