generated
reduceActionForbinary_operator_declarator1: nodes
	| result |
	result := Array new: 8.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	self add: (nodes at: 5) to: (result at: 5).
	self add: (nodes at: 6) to: (result at: 6).
	result at: 7 put: (nodes at: 7).
	self add: (nodes at: 8) to: (result at: 5).
	self add: (nodes at: 9) to: (result at: 6).
	result at: 8 put: (nodes at: 10).
	^result