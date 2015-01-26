generated-reduction actions
reduceActionFortestlist12: nodes
	| result |
	result := PyTestlist1Node new.
	result test: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result tests: (nodes at: 3).
	^ result