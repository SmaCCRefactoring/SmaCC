generated-reduction actions
reduceActionForRaiseStatement2: nodes
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result