generated-reduction actions
reduceActionFordeclarator2: nodes
	| result |
	result := CGLRDeclaratorNode new.
	result direct: (nodes at: 1).
	^ result