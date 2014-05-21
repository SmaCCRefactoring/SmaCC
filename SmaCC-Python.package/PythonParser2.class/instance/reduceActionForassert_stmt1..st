generated-reduction actions
reduceActionForassert_stmt1: nodes
	| result |
	result := ASTAssertNode new.
	result assertToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result