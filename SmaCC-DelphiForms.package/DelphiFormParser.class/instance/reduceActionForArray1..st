generated-reduction actions
reduceActionForArray1: nodes
	| result |
	result := DelphiFormArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result right: (nodes at: 3).
	^ result