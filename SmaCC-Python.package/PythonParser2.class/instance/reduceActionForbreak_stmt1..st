generated-reduction actions
reduceActionForbreak_stmt1: nodes
	| result |
	result := ASTBreakNode new.
	result breakToken: (nodes at: 1).
	^ result