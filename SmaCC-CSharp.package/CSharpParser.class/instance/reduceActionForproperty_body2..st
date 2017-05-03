generated-reduction actions
reduceActionForproperty_body2: nodes
	| result |
	result := Array new: 8.
	result at: 7 put: (nodes at: 1).
	result at: 8 put: (nodes at: 2).
	^ result