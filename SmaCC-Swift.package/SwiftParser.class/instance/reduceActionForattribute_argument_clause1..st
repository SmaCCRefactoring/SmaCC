generated-reduction actions
reduceActionForattribute_argument_clause1: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result