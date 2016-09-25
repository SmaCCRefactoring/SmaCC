generated-reduction actions
reduceActionForTerms3: nodes
	^ (nodes at: 1)
		add: (nodes at: 2);
		nameLastItem:
			((nodes at: 3) value copyFrom: 2 to:
				(nodes at: 3) value size - 1);
		yourself