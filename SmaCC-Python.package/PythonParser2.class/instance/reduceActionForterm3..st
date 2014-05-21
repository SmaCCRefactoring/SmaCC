generated-reduction actions
reduceActionForterm3: nodes
	| result |
	result := ASTTermNode new.
	result factor: (nodes at: 1).
	result divideToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result