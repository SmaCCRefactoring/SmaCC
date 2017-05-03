generated-reduction actions
reduceActionForRule3: nodes
	^ SmaCCRewritePropertyDefinition
		comment: (nodes at: 1)
		locals:
			(((nodes at: 2) reject: [ :each | each first ])
				collect: [ :each | each last ])
		globals:
			(((nodes at: 2) select: [ :each | each first ])
				collect: [ :each | each last ])