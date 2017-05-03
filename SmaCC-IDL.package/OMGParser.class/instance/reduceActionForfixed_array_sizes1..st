generated-reduction actions
reduceActionForfixed_array_sizes1: nodes
	| result |
	result := ASTFixedArraySizesNode new.
	result fixedArraySize: (nodes at: 1).
	^ result