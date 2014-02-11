generated-reduction actions
reduceActionForconstructor_body4: nodes
	| result |
	result := JavaConstructorBodyNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^ result