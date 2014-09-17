generated-reduction actions
reduceActionForPrimType1: nodes
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	^ result