generated-reduction actions
reduceActionForlist_if1: nodes
	| result |
	result := PyListIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result