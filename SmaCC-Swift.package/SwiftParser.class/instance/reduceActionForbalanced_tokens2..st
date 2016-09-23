generated-reduction actions
reduceActionForbalanced_tokens2: nodes
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	^ result