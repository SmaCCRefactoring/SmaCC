generated-reduction actions
reduceActionFortags2: nodes
	| result |
	result := Array new: 1.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	^ result