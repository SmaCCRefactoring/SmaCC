generated-reduction actions
reduceActionForsingle_input1: nodes
	| result |
	result := PySingleInputNode new.
	result nEWLINEToken: (nodes at: 1).
	^ result