generated-reduction actions
reduceActionForimport_as_names1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result