generated-reduction actions
reduceActionForbalanced_token5: nodes
	| result |
	result := Array new: 11.
	result at: 1 put: (OrderedCollection new: 2).
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
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	self add: ((nodes at: 1) at: 2) to: (result at: 9).
	self add: ((nodes at: 1) at: 3) to: (result at: 11).
	^ result