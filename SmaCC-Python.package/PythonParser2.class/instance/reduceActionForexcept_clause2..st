generated-reduction actions
reduceActionForexcept_clause2: nodes
	| result |
	result := Array new: 15.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self add: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: ((nodes at: 2) at: 3) to: (result at: 4).
	self add: ((nodes at: 2) at: 4) to: (result at: 5).
	self add: ((nodes at: 2) at: 5) to: (result at: 6).
	self add: ((nodes at: 2) at: 6) to: (result at: 7).
	self add: ((nodes at: 2) at: 7) to: (result at: 8).
	self add: ((nodes at: 2) at: 8) to: (result at: 9).
	self add: ((nodes at: 2) at: 9) to: (result at: 10).
	self add: ((nodes at: 2) at: 10) to: (result at: 11).
	self add: ((nodes at: 2) at: 11) to: (result at: 12).
	self add: ((nodes at: 2) at: 12) to: (result at: 13).
	^ result