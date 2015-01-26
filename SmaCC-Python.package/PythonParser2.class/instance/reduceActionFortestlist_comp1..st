generated-reduction actions
reduceActionFortestlist_comp1: nodes
	| result |
	result := PyTestlistCompNode new.
	result test: (nodes at: 1).
	result comp_for: (nodes at: 2).
	^ result