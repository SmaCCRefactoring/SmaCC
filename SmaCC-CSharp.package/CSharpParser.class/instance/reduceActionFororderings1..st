generated
reduceActionFororderings1: nodes
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	^result