generated-reduction actions
reduceActionForinfix_operator_attributes1: nodes
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 2) at: 1).
	result at: 4 put: ((nodes at: 2) at: 2).
	result at: 5 put: ((nodes at: 2) at: 3).
	result at: 6 put: ((nodes at: 2) at: 4).
	^ result