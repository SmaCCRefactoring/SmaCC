generated-reduction actions
reduceActionForParamAttr2: nodes
	| result |
	result := Array new: 11.
	result at: 2 put: (nodes at: 1).
	^ result