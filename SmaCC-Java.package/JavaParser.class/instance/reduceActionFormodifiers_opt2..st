generated-reduction actions
reduceActionFormodifiers_opt2: nodes
	| result |
	result := OrderedCollection new: 2.
	self addAll: (nodes at: 1) to: result.
	^ result