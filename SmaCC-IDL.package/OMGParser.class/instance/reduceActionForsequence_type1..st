generated-reduction actions
reduceActionForsequence_type1: nodes
	| result |
	result := ASTSequenceTypeNode new.
	result sequenceToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result simpleTypeSpec: (nodes at: 3).
	result commaToken: (nodes at: 4).
	result positiveIntConst: (nodes at: 5).
	result greaterThanToken: (nodes at: 6).
	^ result