generated-reduction actions
reduceActionForvarargslist3: nodes
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (nodes at: 1).
	result at: 5 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 6 put: (nodes at: 4).
	result at: 7 put: (nodes at: 5).
	^ result