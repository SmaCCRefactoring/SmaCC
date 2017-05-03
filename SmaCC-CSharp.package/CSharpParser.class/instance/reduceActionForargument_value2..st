generated-reduction actions
reduceActionForargument_value2: nodes
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result