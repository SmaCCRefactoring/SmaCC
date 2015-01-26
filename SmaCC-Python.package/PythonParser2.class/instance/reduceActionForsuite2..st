generated-reduction actions
reduceActionForsuite2: nodes
	| result |
	result := PySuiteNode new.
	result nEWLINEToken: (nodes at: 1).
	result iNDENTToken: (nodes at: 2).
	result suite: (nodes at: 3).
	result dEDENTToken: (nodes at: 4).
	^ result