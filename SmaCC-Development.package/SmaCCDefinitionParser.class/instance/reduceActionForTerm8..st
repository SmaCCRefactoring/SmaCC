generated-reduction actions
reduceActionForTerm8: nodes
	^ grammar
		makeOptionalSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)