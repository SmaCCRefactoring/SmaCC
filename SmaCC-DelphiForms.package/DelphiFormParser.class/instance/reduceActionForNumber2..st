generated-reduction actions
reduceActionForNumber2: nodes
	| result |
	result := DelphiFormFloatNode new.
	result value: (nodes at: 1).
	^ result