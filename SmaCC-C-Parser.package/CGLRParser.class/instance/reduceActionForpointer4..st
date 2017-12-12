generated-reduction actions
reduceActionForpointer4: nodes
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addAllFirst: (nodes at: 2) to: (result at: 2).
	^ result