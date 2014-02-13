generated-reduction actions
reduceActionForfixed_pointer_declarator1: nodes
	| result |
	result := CSFixedPointerDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result andToken: ((nodes at: 3) at: 1).
	result expression: ((nodes at: 3) at: 2).
	^ result