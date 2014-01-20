generated-reduction actions
reduceActionForNonAssociativeLine1: nodes
	(nodes at: 2)
		do: [ :each | 
			grammar
				nonAssociativePrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil