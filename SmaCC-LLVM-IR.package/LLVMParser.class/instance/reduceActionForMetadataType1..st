generated-reduction actions
reduceActionForMetadataType1: nodes
	| result |
	result := Array new: 1.
	result at: 1 put: (nodes at: 1).
	^ result