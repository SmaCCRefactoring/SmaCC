generated
reduceActionForsimple_name1: nodes
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^result