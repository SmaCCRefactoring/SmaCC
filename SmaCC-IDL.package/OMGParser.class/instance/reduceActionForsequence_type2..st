generated-reduction actions
reduceActionForsequence_type2: nodes
	| result |
	result := ASTSequenceTypeNode new.
	result sequenceToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result simpleTypeSpec: (nodes at: 3).
	result greaterThanToken: (nodes at: 4).
	^ result