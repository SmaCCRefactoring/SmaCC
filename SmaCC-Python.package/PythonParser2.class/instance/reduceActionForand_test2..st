generated-reduction actions
reduceActionForand_test2: nodes
	| result |
	result := ASTAndNode new.
	result one: (nodes at: 1).
	result andToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result