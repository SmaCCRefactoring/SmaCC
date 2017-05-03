generated-reduction actions
reduceActionForRule2: nodes
	^ SmaCCRewriteMethodDefinition
		comment: (nodes at: 1)
		source:
			(((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1) copyReplaceAll: '!!' with: '!')