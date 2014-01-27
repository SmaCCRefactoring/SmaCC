generated
reduceActionForstatic_constructor_modifiers6: nodes
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	^result