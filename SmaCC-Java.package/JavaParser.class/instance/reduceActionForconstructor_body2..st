generated-reduction actions
reduceActionForconstructor_body2: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result left: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result right: (nodes at: 3).
	^ result