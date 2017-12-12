generated-reduction actions
reduceActionForRegexTerm1: nodes
	^ SmaCCCharacterRENode
		characters:
			(SmaCCCharacterSet withAll:
				(nodes at: 1) value)