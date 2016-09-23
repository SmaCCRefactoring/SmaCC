generated-reduction actions
reduceActionForBinaryMethodName1: nodes
	^ Array
		with: (nodes at: 1) value asSymbol
		with: (Array with: (nodes at: 2))