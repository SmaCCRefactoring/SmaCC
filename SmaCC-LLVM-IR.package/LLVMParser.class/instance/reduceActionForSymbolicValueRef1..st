generated-reduction actions
reduceActionForSymbolicValueRef1: nodes
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	^ result