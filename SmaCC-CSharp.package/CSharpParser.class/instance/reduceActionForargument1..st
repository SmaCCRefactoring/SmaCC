generated-reduction actions
reduceActionForargument1: nodes
	| result |
	result := CSArgumentNode new.
	result expression: (nodes at: 1).
	^ result