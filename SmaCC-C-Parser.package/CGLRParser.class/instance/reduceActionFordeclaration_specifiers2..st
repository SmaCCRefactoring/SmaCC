generated-reduction actions
reduceActionFordeclaration_specifiers2: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: result.
	^ result