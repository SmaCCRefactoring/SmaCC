generated-reduction actions
reduceActionFortype_casting_operator3: nodes
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	result at: 4 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	^ result