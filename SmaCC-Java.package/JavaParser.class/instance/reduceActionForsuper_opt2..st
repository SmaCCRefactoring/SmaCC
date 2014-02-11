generated-reduction actions
reduceActionForsuper_opt2: nodes
	| result |
	result := Array new: 2.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	^ result