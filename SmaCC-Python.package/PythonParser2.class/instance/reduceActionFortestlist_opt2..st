generated-reduction actions
reduceActionFortestlist_opt2: nodes
	| result |
	result := PyTestlistOptNode new.
	result tests: (nodes at: 1).
	^ result