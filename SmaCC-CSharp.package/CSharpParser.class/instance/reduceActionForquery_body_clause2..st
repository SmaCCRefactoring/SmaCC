generated-reduction actions
reduceActionForquery_body_clause2: nodes
	| result |
	result := Array new: 20.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 10 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	result at: 11 put: ((nodes at: 1) at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 6).
	self add: ((nodes at: 1) at: 6) to: (result at: 7).
	self add: ((nodes at: 1) at: 7) to: (result at: 8).
	self add: ((nodes at: 1) at: 8) to: (result at: 9).
	^ result