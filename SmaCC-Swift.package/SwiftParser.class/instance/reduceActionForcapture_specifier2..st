generated-reduction actions
reduceActionForcapture_specifier2: nodes
	| result |
	result := Array new: 4.
	result at: 2 put: (nodes at: 1).
	^ result