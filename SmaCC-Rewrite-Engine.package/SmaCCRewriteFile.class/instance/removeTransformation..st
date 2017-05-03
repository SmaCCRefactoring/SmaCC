accessing
removeTransformation: aSmaCCAbstractRewrite
	rewrites remove: aSmaCCAbstractRewrite ifAbsent: [  ].
	aSmaCCAbstractRewrite parent: nil.
	self changed: #rewrites