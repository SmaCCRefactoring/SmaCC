generated-reduction actions
reduceActionForrequirement_list2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self add: ((nodes at: 3) at: 6) to: (result at: 6).
	self add: ((nodes at: 3) at: 7) to: (result at: 7).
	self add: ((nodes at: 3) at: 8) to: (result at: 8).
	^ result