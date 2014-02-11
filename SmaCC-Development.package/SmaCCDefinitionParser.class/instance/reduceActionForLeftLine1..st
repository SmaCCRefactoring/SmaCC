generated-reduction actions
reduceActionForLeftLine1: nodes
	(nodes at: 2)
		do: [ :each | 
			grammar
				leftPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil