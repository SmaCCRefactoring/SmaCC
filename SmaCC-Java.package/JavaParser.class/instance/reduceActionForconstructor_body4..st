generated-reduction actions
reduceActionForconstructor_body4: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result