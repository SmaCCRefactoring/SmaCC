generated-reduction actions
reduceActionForterm4: nodes
	| result |
	result := ASTTermNode new.
	result factor: (nodes at: 1).
	result percentToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result