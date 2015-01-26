generated-reduction actions
reduceActionForsuite1: nodes
	| result |
	result := PySuiteNode new.
	result suite: (nodes at: 1).
	^ result