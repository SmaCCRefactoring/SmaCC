generated-reduction actions
reduceActionForconstructor_body3: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result