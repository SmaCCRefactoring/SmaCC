generated
reduceActionFornamespace_or_type_name1: nodes
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^result