generated-reduction actions
reduceActionForstatic_constructor_body2: nodes
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 4 put: (nodes at: 1).
	^ result