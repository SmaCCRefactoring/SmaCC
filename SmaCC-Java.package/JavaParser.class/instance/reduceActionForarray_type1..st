generated-reduction actions
reduceActionForarray_type1: nodes
	| result |
	result := JavaArrayTypeNode new.
	result baseType: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result lefts.
	result addTokens: ((nodes at: 2) at: 2) to: result rights.
	^ result