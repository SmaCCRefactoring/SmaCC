generated-reduction actions
reduceActionForfactor3: nodes
	| result |
	result := ASTFactorNode new.
	result minusToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result