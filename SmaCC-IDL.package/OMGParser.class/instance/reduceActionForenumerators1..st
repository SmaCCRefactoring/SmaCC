generated-reduction actions
reduceActionForenumerators1: nodes
	| result |
	result := ASTEnumeratorsNode new.
	result enumerator: (nodes at: 1).
	^ result