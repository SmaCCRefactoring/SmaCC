generated-reduction actions
reduceActionForSymbolicValueRef3: nodes
	| result |
	result := Array new: 7.
	result at: 3 put: ((nodes at: 1) at: 1).
	result at: 4 put: ((nodes at: 1) at: 2).
	result at: 5 put: ((nodes at: 1) at: 3).
	^ result