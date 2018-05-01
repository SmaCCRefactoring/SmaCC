generated-reduction actions
reduceActionForTerm10: nodes
	^ grammar
		makeRepeatSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)