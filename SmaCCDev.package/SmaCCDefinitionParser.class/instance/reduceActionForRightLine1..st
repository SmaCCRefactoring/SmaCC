generated
reduceActionForRightLine1: nodes
	(nodes at: 2)
		do:
			[:each | 
			grammar
				rightPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber].
	^nil