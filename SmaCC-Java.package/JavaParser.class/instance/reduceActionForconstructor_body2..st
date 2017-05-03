generated-reduction actions
reduceActionForconstructor_body2: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result rightBrace: (nodes at: 3).
	^ result