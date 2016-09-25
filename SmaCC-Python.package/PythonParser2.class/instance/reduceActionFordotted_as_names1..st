generated-reduction actions
reduceActionFordotted_as_names1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: ((nodes at: 3) at: 1) to: (result at: 2).
	self add: ((nodes at: 3) at: 2) to: (result at: 3).
	self add: ((nodes at: 3) at: 3) to: (result at: 4).
	^ result