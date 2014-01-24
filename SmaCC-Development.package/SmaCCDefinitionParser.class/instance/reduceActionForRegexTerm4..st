generated
reduceActionForRegexTerm4: nodes
	^self nodeFor: (ReadStream on: ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size))