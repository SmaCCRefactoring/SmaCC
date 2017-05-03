generated-reduction actions
reduceActionForenumerators2: nodes
	| result |
	result := ASTEnumeratorsNode new.
	result enumerators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result enumerator: (nodes at: 3).
	^ result