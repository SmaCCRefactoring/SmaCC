generated-reduction actions
reduceActionForbreak_stmt1: nodes
	| result |
	result := PyBreakNode new.
	result breakToken: (nodes at: 1).
	^ result