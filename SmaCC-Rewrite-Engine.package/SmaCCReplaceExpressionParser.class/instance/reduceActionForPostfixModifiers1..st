generated-reduction actions
reduceActionForPostfixModifiers1: nodes
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	^ result