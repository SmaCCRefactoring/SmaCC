generated-reduction actions
reduceActionForfixed_array_sizes2: nodes
	| result |
	result := ASTFixedArraySizesNode new.
	result fixedArraySizes: (nodes at: 1).
	result fixedArraySize: (nodes at: 2).
	^ result