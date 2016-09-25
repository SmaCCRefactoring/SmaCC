generated-reduction actions
reduceActionForliteral2: nodes
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	^ result