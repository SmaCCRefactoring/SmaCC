generated-reduction actions
reduceActionForarray_access1: nodes
	| result |
	result := JavaArrayAccessNode new.
	result array: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	^ result