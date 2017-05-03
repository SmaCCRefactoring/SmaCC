generated-reduction actions
reduceActionForusing_static_directive1: nodes
	| result |
	result := CSUsingStaticDirectiveNode new.
	result usingToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result namespace: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result