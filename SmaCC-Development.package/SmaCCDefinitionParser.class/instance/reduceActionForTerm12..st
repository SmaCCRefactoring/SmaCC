generated-reduction actions
reduceActionForTerm12: nodes
	^ grammar
		makeRepeatMultipleSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)