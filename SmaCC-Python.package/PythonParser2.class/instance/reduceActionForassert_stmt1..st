generated-reduction actions
reduceActionForassert_stmt1: nodes
	| result |
	result := PyAssertNode new.
	result assertToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result