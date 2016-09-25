generated-reduction actions
reduceActionFortuple_type_body1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 24).
	^ result