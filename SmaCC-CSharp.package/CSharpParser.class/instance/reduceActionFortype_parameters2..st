generated-reduction actions
reduceActionFortype_parameters2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result