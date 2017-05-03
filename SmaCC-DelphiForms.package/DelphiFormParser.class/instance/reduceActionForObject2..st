generated-reduction actions
reduceActionForObject2: nodes
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result typeToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result indexToken: ((nodes at: 3) at: 2).
	result right: ((nodes at: 3) at: 3).
	result addNodes: (nodes at: 4) to: result properties.
	result endToken: (nodes at: 5).
	^ result