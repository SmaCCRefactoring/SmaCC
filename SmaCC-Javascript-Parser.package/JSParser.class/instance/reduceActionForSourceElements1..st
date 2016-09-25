generated-reduction actions
reduceActionForSourceElements1: nodes
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result