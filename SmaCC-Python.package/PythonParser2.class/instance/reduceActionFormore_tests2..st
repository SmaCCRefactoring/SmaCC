generated-reduction actions
reduceActionFormore_tests2: nodes
	| result |
	result := PyMoreTestsNode new.
	result commaToken: (nodes at: 1).
	result test: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result test2: (nodes at: 4).
	result more_tests: (nodes at: 5).
	^ result