generated-reduction actions
reduceActionForbalanced_token3: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 6).
	^ result