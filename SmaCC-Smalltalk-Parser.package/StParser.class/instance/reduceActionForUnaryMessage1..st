generated-reduction actions
reduceActionForUnaryMessage1: nodes
	^ Array with: (ReadStream on: (nodes at: 1) value) with: #()