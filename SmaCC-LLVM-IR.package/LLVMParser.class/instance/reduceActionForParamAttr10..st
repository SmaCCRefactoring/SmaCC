generated-reduction actions
reduceActionForParamAttr10: nodes
	| result |
	result := Array new: 11.
	result at: 10 put: (nodes at: 1).
	result at: 11 put: (nodes at: 2).
	^ result