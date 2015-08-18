generated-reduction actions
reduceActionForSourceElements2: nodes
	| result |
	result := OrderedCollection new: 2.
	self addAll: (nodes at: 1) to: result.
	self add: (nodes at: 2) to: result.
	^ result