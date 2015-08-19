generated-reduction actions
reduceActionForarray_type1: nodes
	| result |
	result := CSArrayTypeNode new.
	result type: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result rankSpecifiers.
	^ result