generated-reduction actions
reduceActionFormember_declarator1: nodes
	| result |
	result := CSMemberDeclaratorNode new.
	result _name: (nodes at: 1).
	^ result