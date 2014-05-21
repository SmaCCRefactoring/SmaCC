generated-reduction actions
reduceActionForimport_from1: nodes
	| result |
	result := Array new: 9.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: ((nodes at: 4) at: 1).
	result at: 6 put: ((nodes at: 4) at: 2).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 8).
	result at: 9 put: ((nodes at: 4) at: 6).
	^ result