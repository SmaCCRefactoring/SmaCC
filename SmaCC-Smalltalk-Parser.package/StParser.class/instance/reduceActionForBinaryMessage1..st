generated-reduction actions
reduceActionForBinaryMessage1: nodes
	^ Array
		with: (ReadStream on: (nodes at: 1) value)
		with: (Array with: (nodes at: 2))