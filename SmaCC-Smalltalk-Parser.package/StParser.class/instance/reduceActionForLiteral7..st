generated-reduction actions
reduceActionForLiteral7: nodes
	^ ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1)
		copyReplaceAll: ''''''
		with: ''''