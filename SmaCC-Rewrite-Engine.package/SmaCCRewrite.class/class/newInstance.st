instance creation
newInstance
	^ self
		comment: ''
		match: (SmaCCRewriteTypeMatch on: SmaCCParseNode)
		transformation: (SmaCCRewriteCodeTransformation on: 'self continue')