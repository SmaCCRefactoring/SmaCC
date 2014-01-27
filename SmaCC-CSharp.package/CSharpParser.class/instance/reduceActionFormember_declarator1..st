generated
reduceActionFormember_declarator1: nodes
	| result |
	result := CSMemberDeclaratorNode new.
	result name: (nodes at: 1).
	^result