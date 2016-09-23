generated-reduction actions
reduceActionForImport1: nodes
	^ ((nodes at: 3) value copyFrom: 2 to: (nodes at: 3) value size - 1)
		copyReplaceAll: ''''''
		with: ''''