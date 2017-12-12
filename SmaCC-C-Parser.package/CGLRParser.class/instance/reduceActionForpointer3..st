generated-reduction actions
reduceActionForpointer3: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 1).
	^ result