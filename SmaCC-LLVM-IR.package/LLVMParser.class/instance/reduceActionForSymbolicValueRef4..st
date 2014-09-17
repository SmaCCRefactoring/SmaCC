generated-reduction actions
reduceActionForSymbolicValueRef4: nodes
	| result |
	result := Array new: 7.
	result at: 6 put: ((nodes at: 1) at: 1).
	result at: 7 put: ((nodes at: 1) at: 2).
	^ result