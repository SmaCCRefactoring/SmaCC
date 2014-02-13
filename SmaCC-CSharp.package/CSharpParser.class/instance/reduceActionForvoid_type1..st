generated-reduction actions
reduceActionForvoid_type1: nodes
	| result |
	result := CSVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^ result