generated-reduction actions
reduceActionForTemporaries1: nodes
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result