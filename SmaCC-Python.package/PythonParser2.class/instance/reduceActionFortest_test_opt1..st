generated-reduction actions
reduceActionFortest_test_opt1: nodes
	| result |
	result := PyTestTestOptNode new.
	result test1: (nodes at: 1).
	^ result