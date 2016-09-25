generated-reduction actions
reduceActionForcapture_specifier3: nodes
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	^ result