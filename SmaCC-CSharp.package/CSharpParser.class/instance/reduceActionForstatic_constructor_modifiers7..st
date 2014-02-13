generated-reduction actions
reduceActionForstatic_constructor_modifiers7: nodes
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	^ result