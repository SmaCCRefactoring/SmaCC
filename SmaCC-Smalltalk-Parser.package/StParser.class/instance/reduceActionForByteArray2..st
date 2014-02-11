generated-reduction actions
reduceActionForByteArray2: nodes
	^ (nodes at: 1)
		nextPut: (nodes at: 2) value;
		yourself