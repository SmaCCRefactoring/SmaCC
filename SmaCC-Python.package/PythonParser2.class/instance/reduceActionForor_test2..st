generated-reduction actions
reduceActionForor_test2: nodes
	| result |
	result := ASTOrNode new.
	result one: (nodes at: 1).
	result orToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result