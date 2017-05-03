generated-reduction actions
reduceActionForenumerator1: nodes
	| result |
	result := ASTEnumeratorNode new.
	result id: (nodes at: 1).
	^ result