generated-reduction actions
reduceActionForfixed_array_size1: nodes
	| result |
	result := ASTFixedArraySizeNode new.
	result leftBracketToken: (nodes at: 1).
	result positiveIntConst: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result