generated-reduction actions
reduceActionForjoin_into_clause1: nodes
	| result |
	result := Array new: 10.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	result at: 9 put: (nodes at: 9).
	result at: 10 put: (nodes at: 10).
	self add: (nodes at: 11) to: (result at: 3).
	^ result