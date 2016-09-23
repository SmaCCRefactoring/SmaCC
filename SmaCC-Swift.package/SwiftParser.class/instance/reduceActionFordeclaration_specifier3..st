generated-reduction actions
reduceActionFordeclaration_specifier3: nodes
	| result |
	result := Array new: 9.
	result at: 3 put: (nodes at: 1).
	^ result