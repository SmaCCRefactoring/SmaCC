generated-reduction actions
reduceActionForconstructor_body1: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result statements.
	result rightBrace: (nodes at: 4).
	^ result