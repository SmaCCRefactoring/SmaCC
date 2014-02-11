generated-reduction actions
reduceActionForconstructor_body1: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result left: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result right: (nodes at: 4).
	^ result