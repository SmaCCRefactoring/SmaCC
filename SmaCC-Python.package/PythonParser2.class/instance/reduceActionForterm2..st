generated-reduction actions
reduceActionForterm2: nodes
	| result |
	result := ASTTermNode new.
	result factor: (nodes at: 1).
	result timesToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result