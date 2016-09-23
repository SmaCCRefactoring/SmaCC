generated-reduction actions
reduceActionForattributes2: nodes
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	^ result