generated-reduction actions
reduceActionFordictionary_literal_items2: nodes
	| result |
	result := nodes at: 3.
	self addFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addFirst: (nodes at: 2) to: (result at: 4).
	^ result