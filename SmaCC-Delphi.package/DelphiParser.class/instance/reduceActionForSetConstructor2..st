generated-reduction actions
reduceActionForSetConstructor2: nodes
	| result |
	result := DelphiSetExpressionNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^ result