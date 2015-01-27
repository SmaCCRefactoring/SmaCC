generated-reduction actions
reduceActionForlist_if2: nodes
	| result |
	result := PyListIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	result iter: (nodes at: 3).
	^ result