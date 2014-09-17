generated-reduction actions
reduceActionForSymbolicValueRef2: nodes
	| result |
	result := Array new: 7.
	result at: 2 put: (nodes at: 1).
	^ result