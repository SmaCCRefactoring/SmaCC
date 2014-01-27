generated
reduceActionFortype_parameter1: nodes
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	^result