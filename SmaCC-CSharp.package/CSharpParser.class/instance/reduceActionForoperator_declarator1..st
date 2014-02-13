generated-reduction actions
reduceActionForoperator_declarator1: nodes
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	^ result