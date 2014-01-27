generated
reduceActionFornullable_type1: nodes
	| result |
	result := CSNullableTypeNode new.
	result type: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^result