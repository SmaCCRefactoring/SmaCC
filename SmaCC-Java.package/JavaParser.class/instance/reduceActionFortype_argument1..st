generated
reduceActionFortype_argument1: nodes
	| result |
	result := JavaTypeArgumentNode new.
	result type: (nodes at: 1).
	^result