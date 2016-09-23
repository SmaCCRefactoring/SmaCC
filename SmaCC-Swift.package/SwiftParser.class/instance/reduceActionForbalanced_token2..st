generated-reduction actions
reduceActionForbalanced_token2: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 4).
	^ result