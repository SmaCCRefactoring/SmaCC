generated-reduction actions
reduceActionForObject1: nodes
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result typeToken: (nodes at: 4).
	result left: ((nodes at: 5) at: 1).
	result indexToken: ((nodes at: 5) at: 2).
	result right: ((nodes at: 5) at: 3).
	result addNodes: (nodes at: 6) to: result properties.
	result endToken: (nodes at: 7).
	^ result