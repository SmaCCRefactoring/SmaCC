generated-reduction actions
reduceActionForsmall_stmt8: nodes
	| result |
	result := Array new: 55.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 45 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 24).
	result at: 46 put: ((nodes at: 1) at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 47).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 48).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 49).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 50).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 51).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 52).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 53).
	self add: ((nodes at: 1) at: 15) to: (result at: 2).
	^ result