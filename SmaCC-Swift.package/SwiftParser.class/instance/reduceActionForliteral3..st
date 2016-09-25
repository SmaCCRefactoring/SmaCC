generated-reduction actions
reduceActionForliteral3: nodes
	| result |
	result := Array new: 3.
	result at: 3 put: (nodes at: 1).
	^ result