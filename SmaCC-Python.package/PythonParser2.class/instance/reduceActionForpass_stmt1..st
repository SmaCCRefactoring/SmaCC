generated-reduction actions
reduceActionForpass_stmt1: nodes
	| result |
	result := PyPassNode new.
	result passToken: (nodes at: 1).
	^ result