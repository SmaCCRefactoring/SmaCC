generated-reduction actions
reduceActionForconstructor_body3: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result right: (nodes at: 3).
	^ result