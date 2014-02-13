generated-reduction actions
reduceActionFormember_declarator2: nodes
	| result |
	result := CSMemberDeclaratorNode new.
	result access: (nodes at: 1).
	^ result