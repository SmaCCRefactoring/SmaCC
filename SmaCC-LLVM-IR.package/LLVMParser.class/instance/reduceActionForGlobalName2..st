generated-reduction actions
reduceActionForGlobalName2: nodes
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result