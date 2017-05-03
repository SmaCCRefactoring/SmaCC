generated-reduction actions
reduceActionForBoolean1: nodes
	| result |
	result := DelphiFormBooleanNode new.
	result value: (nodes at: 1).
	^ result