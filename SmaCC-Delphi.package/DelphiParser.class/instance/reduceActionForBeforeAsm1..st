generated-reduction actions
reduceActionForBeforeAsm1: nodes
	parseAll
		ifFalse: [ scanner skipToEndToken.
			currentState position: scanner position ].
	^ nil