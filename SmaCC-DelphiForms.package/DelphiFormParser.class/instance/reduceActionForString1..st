generated-reduction actions
reduceActionForString1: nodes
	| result |
	result := DelphiFormStringNode new.
	result value: (nodes at: 1).
	^ result