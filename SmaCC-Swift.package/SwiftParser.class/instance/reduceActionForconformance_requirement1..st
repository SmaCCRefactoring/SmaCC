generated-reduction actions
reduceActionForconformance_requirement1: nodes
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 2).
	^ result