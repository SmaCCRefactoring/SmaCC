generated-reduction actions
reduceActionForpass_stmt1: nodes
	| result |
	result := ASTPassNode new.
	result passToken: (nodes at: 1).
	^ result