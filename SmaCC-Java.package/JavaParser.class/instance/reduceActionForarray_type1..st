generated
reduceActionForarray_type1: nodes
	| result |
	result := JavaArrayTypeNode new.
	result baseType: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result emptyDims.
	^result