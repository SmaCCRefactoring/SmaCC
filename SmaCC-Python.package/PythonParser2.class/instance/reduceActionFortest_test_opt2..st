generated-reduction actions
reduceActionFortest_test_opt2: nodes
	| result |
	result := PyTestTestOptNode new.
	result test1: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result test2: (nodes at: 3).
	^ result