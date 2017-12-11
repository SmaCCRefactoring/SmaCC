generated-reduction actions
reduceActionFormultiplicative_expression3: nodes
	| result |
	result := CGLRBinaryNode new.
	result left: (nodes at: 1).
	result op: (nodes at: 2).
	result right: (nodes at: 3).
	^ result