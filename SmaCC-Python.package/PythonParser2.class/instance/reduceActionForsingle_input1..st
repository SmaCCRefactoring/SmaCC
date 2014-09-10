generated-reduction actions
reduceActionForsingle_input1: nodes
	| result |
	result := PySingleInputNode new.
	result addToken: (nodes at: 1) to: result nEWLINETokens.
	^ result