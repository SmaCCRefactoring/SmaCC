generated-reduction actions
reduceActionForargument1: nodes
	| result |
	result := CSArgumentNode new.
	result identifier: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result expression: ((nodes at: 2) at: 1).
	result refToken: ((nodes at: 2) at: 2).
	result outToken: ((nodes at: 2) at: 3).
	^ result